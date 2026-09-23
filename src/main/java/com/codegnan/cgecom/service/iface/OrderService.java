package com.codegnan.cgecom.service.iface;

import java.util.List;

import com.codegnan.cgecom.model.Order;
import com.codegnan.cgecom.model.User;

public interface OrderService {

    void saveOrder(Order order);

    Order getOrderById(int id);

    List<Order> getOrdersForUser(User user);

    List<Order> getAllOrders();
}