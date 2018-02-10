package com.tian.order.service;

import com.tian.common.pojo.AdminOrders;
import com.tian.common.pojo.Result;
import com.tian.order.pojo.Order;

import java.util.List;

public interface OrderService {

    List<AdminOrders> getOrders(Long userId, Long categoryId);

    Result save(Order order);

    Order slectOrderById(Long orderId);

    Result updateOrder(Order order);

    Result deleteOrder(Long orderId);

    List<Order> searchOrderByName(String orderName);

    Result batchInsert(List<String[]> list);
}
