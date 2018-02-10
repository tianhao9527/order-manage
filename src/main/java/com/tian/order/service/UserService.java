package com.tian.order.service;

import com.tian.common.pojo.Result;
import com.tian.common.pojo.UserBo;
import com.tian.order.pojo.User;

import java.util.List;
import java.util.Set;

public interface UserService {

    public Set<String> findRoles(Long id);

    public User findByUsername(String username);

    public int updateUser(User user);

    public Result insertUser(User user);

    List<User> getUserList();

    Result deleteUserById(Long userId);

    List<UserBo> getAllUser();

    Result kickOutUser(String sessionId);
}
