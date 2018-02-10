package com.tian.common.pojo;

import com.tian.order.pojo.Order;

import java.io.Serializable;
import java.util.Date;

public class AdminOrders implements Serializable {
    private String username;
    private Long orderId;
    private String orderName;
    private Date updatetime;
    private Long userId;
    private Date createtime;
    private Long money;
    private String orderDesc;
    private Long orderType;

    public AdminOrders() {
    }

    public AdminOrders(String username, Order order) {
        this.username = username;
        this.orderId = order.getOrderId();
        this.orderName = order.getOrderName();
        this.updatetime = order.getUpdatetime();
        this.createtime = order.getCreatetime();
        this.userId = order.getUserId();
        this.money = order.getMoney();
        this.orderDesc = order.getOrderDesc();
        this.orderType = order.getOrderType();
    }

    public Long getOrderType() {
        return orderType;
    }

    public void setOrderType(Long orderType) {
        this.orderType = orderType;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public Long getOrderId() {
        return orderId;
    }

    public void setOrderId(Long orderId) {
        this.orderId = orderId;
    }

    public String getOrderName() {
        return orderName;
    }

    public void setOrderName(String orderName) {
        this.orderName = orderName;
    }

    public Date getUpdatetime() {
        return updatetime;
    }

    public void setUpdatetime(Date updatetime) {
        this.updatetime = updatetime;
    }

    public Long getUserId() {
        return userId;
    }

    public void setUserId(Long userId) {
        this.userId = userId;
    }

    public Date getCreatetime() {
        return createtime;
    }

    public void setCreatetime(Date createtime) {
        this.createtime = createtime;
    }

    public Long getMoney() {
        return money;
    }

    public void setMoney(Long money) {
        this.money = money;
    }

    public String getOrderDesc() {
        return orderDesc;
    }

    public void setOrderDesc(String orderDesc) {
        this.orderDesc = orderDesc;
    }
}



