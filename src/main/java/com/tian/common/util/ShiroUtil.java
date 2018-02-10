package com.tian.common.util;

import com.tian.order.mapper.RoleMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.util.List;

@Component
public class ShiroUtil {

    private static RoleMapper roleMapper;

    public static List<String> getRolesNameByUserId(Long userId) {

        return roleMapper.getRolesNameByUserId(userId);
    }


    //	@Value("#{ADMIN}")
//	public static final String ADMIN ="admin";

    public static boolean isAdmin(Long userId) {
        List<String> roles = getRolesNameByUserId(userId);
        if (roles != null && roles.size() != 0) {
            for (String roleName : roles) {
                if ("admin".equals(roleName)) {
                    return true;
                }
            }
        }
        return false;
    }

    @Autowired
    public void setRoleMapper(RoleMapper roleMapper) {
        ShiroUtil.roleMapper = roleMapper;
    }
}
