package com.tian.order.service.impl;

import com.tian.common.util.ShiroUtil;
import com.tian.order.mapper.MenuMapper;
import com.tian.order.pojo.Menu;
import com.tian.order.pojo.MenuExample;
import com.tian.order.service.MenuService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Transactional
public class MenuServiceImpl implements MenuService {

    @Autowired
    private MenuMapper menuMapper;

    /**
     * 获取用户的菜单(主要是账单类型)
     */
    @Override
    public List<Menu> getMenus(Long userId) {

        if (ShiroUtil.isAdmin(userId)) {
            return menuMapper.getMenus(null);
        }
        return menuMapper.getMenus(1);

    }

    @Override
    public List<Menu> getSubMenus(Long parentId) {
        MenuExample example = new MenuExample();
        MenuExample.Criteria criteria = example.createCriteria();
        criteria.andParentIdEqualTo(parentId);
        return menuMapper.selectByExample(example);
    }
}
