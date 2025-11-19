package com.phonemarket.model.bean;

public class Products {
    private int id;
    private String name;
    private int price;
    private String description;
    private String image_url;
    private int stock_quantity;

    public Products(int id, String name, int price, String description, String image_url, int stock_quantity) {
        this.id = id;
        this.name = name;
        this.price = price;
        this.description = description;
        this.image_url = image_url;
        this.stock_quantity = stock_quantity;
    }



    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getPrice() {
        return price;
    }

    public void setPrice(int price) {
        this.price = price;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getImage_url() {
        return image_url;
    }

    public void setImage(String image_url) {
        this.image_url = this.image_url;
    }

    public int getStock_quantity() {
        return stock_quantity;
    }

    public void setStock_quantity(int stock_quantity) {
        this.stock_quantity = stock_quantity;
    }

}
