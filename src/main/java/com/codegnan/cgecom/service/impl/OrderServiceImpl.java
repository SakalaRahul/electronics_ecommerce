package com.codegnan.cgecom.service.impl;

import java.util.List;

import org.springframework.stereotype.Service;

import com.codegnan.cgecom.model.Order;
import com.codegnan.cgecom.model.User;
import com.codegnan.cgecom.repositories.OrderRepository;
import com.codegnan.cgecom.service.iface.OrderService;

@Service
public class OrderServiceImpl implements OrderService {

    private final OrderRepository orderRepository;

    public OrderServiceImpl(OrderRepository orderRepository) {
        this.orderRepository = orderRepository;
    }

    @Override
    public void saveOrder(Order order) {
        orderRepository.save(order);
    }

    @Override
    public Order getOrderById(int id) {
        return orderRepository.findById(id)
                .orElseThrow(() -> new RuntimeException("Order not found with id: " + id));
    }

    @Override
    public List<Order> getOrdersForUser(User user) {
        return orderRepository.findByUserOrderByIdDesc(user);
    }

    @Override
    public List<Order> getAllOrders() {
        return orderRepository.findAll();
    }
}