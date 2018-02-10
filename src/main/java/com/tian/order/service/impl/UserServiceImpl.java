package com.tian.order.service.impl;

import com.tian.common.pojo.Result;
import com.tian.common.pojo.UserBo;
import com.tian.common.util.DateUtils;
import com.tian.order.mapper.UserMapper;
import com.tian.order.pojo.User;
import com.tian.order.pojo.UserExample;
import com.tian.order.service.UserService;
import org.apache.shiro.session.Session;
import org.apache.shiro.session.mgt.eis.SessionDAO;
import org.apache.shiro.subject.support.DefaultSubjectContext;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.*;

@Service
@Transactional
public class UserServiceImpl implements UserService {

    @Autowired
    private UserMapper userMapper;

    @Autowired
    private SessionDAO sessionDAO;


    @Override
    public Set<String> findRoles(Long id) {

        return new HashSet<String>(userMapper.findRoles(id));
    }

    @Override
    public User findByUsername(String userName) {

        return userMapper.findByUsername(userName);
    }

    @Override
    public int updateUser(User user) {
        UserExample example = new UserExample();
        UserExample.Criteria criteria = example.createCriteria();
        criteria.andUserIdEqualTo(user.getUserId());
        return userMapper.updateByExampleSelective(user, example);

    }

    @Override
    public Result insertUser(User user) {
        // 将user插入user表，并获取对应id，更新user_role中间表
            int result = userMapper.insert(user);
            if(result>0){
                // 用户注册默认是user角色
               result = userMapper.updateTbUserRole(user.getUserId());
               if(result>0){
                   return Result.ok();
               }
            }
        return Result.build(400,"注册失败");

    }

    @Override
    public List<User> getUserList() {
        UserExample example = new UserExample();
        List<User> users = userMapper.selectByExample(example);
        return users;
    }

    @Override
    public Result deleteUserById(Long userId) {
       int i = userMapper.deleteByPrimaryKey(userId);
        if(i>0){
            return Result.ok();
        }
        return Result.build(400,"删除失败！");
    }

    @Override
    public List<UserBo> getAllUser() {
        List<UserBo> list = new ArrayList<>();
        Collection<Session> sessions = sessionDAO.getActiveSessions();
        UserBo userBo = null;
        for(Session session:sessions){
            Object o = session.getAttribute(DefaultSubjectContext.PRINCIPALS_SESSION_KEY);
            String userName = session.getAttribute(DefaultSubjectContext.PRINCIPALS_SESSION_KEY).toString();
            User user = userMapper.findByUsername(userName);
            userBo = new UserBo();
            userBo.setUserName(user.getUserName());
            userBo.setHost(session.getHost());
            userBo.setSessionId((String) session.getId());
            userBo.setLastAccessTime(DateUtils.dateToString(session.getLastAccessTime(),"yyyy-MM-dd HH:mm:ss"));
            list.add(userBo);
        }
        return list;
    }

    @Override
    public Result kickOutUser(String sessionId) {
        Collection<Session> sessions = sessionDAO.getActiveSessions();
        for(Session session:sessions){
            if(session.getId().equals(sessionId)){
                sessionDAO.delete(session);
                return Result.build(200,"OK");
            }
        }
        return Result.build(400,"踢出失败");
    }

}
