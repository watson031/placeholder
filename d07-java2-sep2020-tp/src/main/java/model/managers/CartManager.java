/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model.managers;

import java.util.HashMap;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import model.entities.Item;
import model.entities.Product;

/**
 *
 * @author abrossea
 */
public class CartManager {

    public static void addToCart(int itemToAdd, HttpServletRequest request) {
        HashMap<Integer, Item> cart = (HashMap<Integer, Item>) SessionManager.get("cart", request);

        if (cart == null) {
            cart = new HashMap<>();
            SessionManager.add("cart", cart, request);
        }

        Product prodToItem = ProductManager.getById(itemToAdd);

        if (!itemExists(itemToAdd, cart)) {
            Item newItem = new Item();
            newItem.setId(itemToAdd);
            newItem.setName(prodToItem.getName());
            if (prodToItem.getPromo() > 0) {
                newItem.setPrice(prodToItem.getPrice() - (prodToItem.getPrice() * prodToItem.getPromo()));
            } else {
                newItem.setPrice(prodToItem.getPrice());
            }
            newItem.setQty(1);
            newItem.setImgUrl(prodToItem.getImgUrl());
            cart.put(newItem.getId(), newItem);
        } else {
            Item item = cart.get(itemToAdd);
            item.setQty(item.getQty() + 1);
        }
    }

    private static boolean itemExists(int itemToCheck, HashMap<Integer, Item> cart) {
        boolean retour = false;
        for (Map.Entry<Integer, Item> ligne : cart.entrySet()) {
            Item value = ligne.getValue();
            if (value.getId() == itemToCheck) {
                retour = true;
                break;
            }
        }
        return retour;
    }

    public static void removeItem(HttpServletRequest request, int id) {
        HashMap<Integer, Item> cart = (HashMap<Integer, Item>) SessionManager.get("cart", request);

        if (cart != null) {
            if (cart.containsKey(id)) {
                cart.remove(id);
            }
        }
    }

    public static void addToItem(int itemToAdd, HttpServletRequest request) {
        HashMap<Integer, Item> cart = (HashMap<Integer, Item>) SessionManager.get("cart", request);

        if (cart != null) {
            if (itemExists(itemToAdd, cart)) {
                Item item = cart.get(itemToAdd);
                item.setQty(item.getQty() + 1);
            }
        }
    }

    public static void deleteInItem(int itemToDelete, HttpServletRequest request) {
        HashMap<Integer, Item> cart = (HashMap<Integer, Item>) SessionManager.get("cart", request);

        if (cart != null) {
            if (itemExists(itemToDelete, cart)) {
                Item item = cart.get(itemToDelete);
                if (item.getQty() > 0) {
                    item.setQty(item.getQty() - 1);
                }
            }
        }
    }
}
