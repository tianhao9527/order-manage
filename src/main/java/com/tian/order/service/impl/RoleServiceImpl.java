package com.tian.order.service.impl;

import com.tian.order.mapper.RoleMapper;
import com.tian.order.service.RoleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.HashSet;
import java.util.List;
import java.util.Set;

@Service
@Transactional
public class RoleServiceImpl implements RoleService {

    @Autowired
    private RoleMapper roleMapper;

    @Override
    public Set<String> findPermissions(Set<String> roles) {
        Set<String> permissionSet = new HashSet<>();
        for (String rolename : roles) {
            List<String> permissions = roleMapper.findPermissions(rolename);
            permissionSet.addAll(permissions);
        }

        return permissionSet;
    }


}
