package com.tian.order.service;

import java.util.Set;

public interface RoleService {

    public Set<String> findPermissions(Set<String> roles);
}
