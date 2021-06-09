/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model.entities;

import java.util.HashMap;

/**
 *
 * @author Alex
 */
public class OrderEmail {

    private Order order;
    private User user;
    private HashMap<Integer, Item> cart;

    public OrderEmail() {
    }

    public void setOrder(Order order) {
        this.order = order;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public Order getOrder() {
        return order;
    }

    public User getUser() {
        return user;
    }

    public void setCart(HashMap<Integer, Item> cart) {
        this.cart = cart;
    }

    public HashMap<Integer, Item> getCart() {
        return cart;
    }
}
