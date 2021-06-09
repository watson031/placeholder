/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model.entities;

/**
 *
 * @author abrossea
 */
public class Category {
    private int id;
    private String description;
    private String img_url;
    
    public Category(){
    }

    public void setId(int id) {
        this.id = id;
    }

    public void setDescription(String name) {
        this.description = name;
    }

    public void setImg_url(String img_url) {
        this.img_url = img_url;
    }

    public int getId() {
        return id;
    }

    public String getDescription() {
        return description;
    }

    public String getImg_url() {
        return img_url;
    }
}