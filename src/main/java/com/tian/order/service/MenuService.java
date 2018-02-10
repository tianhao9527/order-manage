package com.tian.order.service;

import com.tian.order.pojo.Menu;

import java.util.List;

public interface MenuService {

    List<Menu> getMenus(Long userId);

    List<Menu> getSubMenus(Long parentId);

}
