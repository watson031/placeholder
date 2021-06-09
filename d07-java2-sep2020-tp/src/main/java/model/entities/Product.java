/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model.entities;

import java.util.ArrayList;

/**
 *
 * @author abrossea
 */
public class Product {

    private int id;
    private int category;
    private String name;
    private int stock;
    private double price;
    private double promo;
    private String description;
    private String spec_1;
    private String spec_2;
    private String spec_3;
    private String spec_4;
    private String spec_5;
    private String imgUrl;

    public void setPromo(double promo) {
        this.promo = promo;
    }

    public void setSpec_1(String spec_1) {
        this.spec_1 = spec_1;
    }

    public void setSpec_2(String spec_2) {
        this.spec_2 = spec_2;
    }

    public void setSpec_3(String spec_3) {
        this.spec_3 = spec_3;
    }

    public void setSpec_4(String spec_4) {
        this.spec_4 = spec_4;
    }

    public void setSpec_5(String spec_5) {
        this.spec_5 = spec_5;
    }

    public String getSpec_1() {
        return spec_1;
    }

    public String getSpec_2() {
        return spec_2;
    }

    public String getSpec_3() {
        return spec_3;
    }

    public String getSpec_4() {
        return spec_4;
    }

    public String getSpec_5() {
        return spec_5;
    }

    public double getPromo() {
        return promo;
    }    

    public int getId() {
        return id;
    }

    public int getCategory() {
        return category;
    }

    public String getName() {
        return name;
    }

    public double getPrice() {
        return price;
    }

    public String getDescription() {
        return description;
    }

    public String getImgUrl() {
        return imgUrl;
    }

    public int getStock() {
        return stock;
    }

    public void setId(int id) {
        this.id = id;
    }

    public void setCategory(int category) {
        this.category = category;
    }

    public void setName(String name) {
        this.name = name;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public void setDescription(String description) {
        this.description = description;
    }
    
    public void setImgUrl(String imgUrl) {
        this.imgUrl = imgUrl;
    }

    public void setStock(int stock) {
        this.stock = stock;
    }
}
