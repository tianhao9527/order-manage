package com.tian.order.realm;

import com.tian.order.pojo.User;
import com.tian.order.service.RoleService;
import com.tian.order.service.impl.UserServiceImpl;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.*;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.authz.SimpleAuthorizationInfo;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.session.Session;
import org.apache.shiro.session.mgt.eis.SessionDAO;
import org.apache.shiro.subject.PrincipalCollection;
import org.apache.shiro.subject.Subject;
import org.apache.shiro.subject.support.DefaultSubjectContext;
import org.apache.shiro.web.mgt.DefaultWebSecurityManager;
import org.apache.shiro.web.session.mgt.DefaultWebSessionManager;
import org.springframework.beans.factory.annotation.Autowired;

import javax.annotation.Resource;
import java.util.Collection;
import java.util.Set;

public class UserRealm extends AuthorizingRealm {

    @Resource
    private UserServiceImpl userService;
    @Resource
    private RoleService roleService;

    @Autowired
    private SessionDAO sessionDAO;

    @Override
    protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection principals) {

        SimpleAuthorizationInfo authorizationInfo = new SimpleAuthorizationInfo();
        Subject subject = SecurityUtils.getSubject();
        String username = (String) SecurityUtils.getSubject().getPrincipal();
        User user = userService.findByUsername(username);
        // 调用业务层，查询角色
        Set<String> roles = userService.findRoles(user.getUserId());
        for (String role : roles) {
            authorizationInfo.addRole(role);
        }
        // 调用业务层，查询权限
        Set<String> permissions = roleService.findPermissions(roles);
        for (String permission : permissions) {
            authorizationInfo.addStringPermission(permission);
        }
        return authorizationInfo;
    }

    @Override
    protected AuthenticationInfo doGetAuthenticationInfo(AuthenticationToken token) throws AuthenticationException {
        // 转换token
        UsernamePasswordToken usernamePasswordToken = (UsernamePasswordToken) token;
        String userName = usernamePasswordToken.getUsername();
        //处理session
        DefaultWebSecurityManager securityManager = (DefaultWebSecurityManager) SecurityUtils.getSecurityManager();
        DefaultWebSessionManager sessionManager = (DefaultWebSessionManager)securityManager.getSessionManager();
        Collection<Session> sessions = sessionManager.getSessionDAO().getActiveSessions();//获取当前已登录的用户session列表
        for(Session session:sessions){
            //清除该用户以前登录时保存的session
            if(userName.equals(String.valueOf(session.getAttribute(DefaultSubjectContext.PRINCIPALS_SESSION_KEY)))) {
                sessionManager.getSessionDAO().delete(session);
                return new SimpleAuthenticationInfo(userName, null, getName());
            }
        }
        User user = userService.findByUsername(usernamePasswordToken.getUsername());
        if (user == null) {
            throw new UnknownAccountException();//没找到帐号
        }

        //交给AuthenticatingRealm使用CredentialsMatcher进行密码匹配，如果觉得人家的不好可以自定义实现
        AuthenticationInfo info = new SimpleAuthenticationInfo(user.getUserName(), user.getPassword(), getName());

        return info;
    }
}