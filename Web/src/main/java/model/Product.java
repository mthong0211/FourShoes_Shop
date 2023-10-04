/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author PC
 */
public class Product {
    private int p_id;
    private String p_name;
    private float price;
    private String brand;
    private String image;
    private int stock;
    private boolean status;
    
    //them truong du lieu des ( xoa het constructor phia duoi roi insert code lai).
    private String des; 
    

    public Product() {
    }

    public Product(int p_id, String p_name, float price, String brand, String image) {
        this.p_id = p_id;
        this.p_name = p_name;
        this.price = price;
        this.brand = brand;
        this.image = image;
    }

    public Product(int p_id, String p_name, float price, String brand, String image, int stock, boolean status, String des) {
        this.p_id = p_id;
        this.p_name = p_name;
        this.price = price;
        this.brand = brand;
        this.image = image;
        this.stock = stock;
        this.status = status;
        this.des = des;
    }

    public Product(int p_id, String p_name, float price, String brand, String image, int stock, String des) {
        this.p_id = p_id;
        this.p_name = p_name;
        this.price = price;
        this.brand = brand;
        this.image = image;
        this.stock = stock;
        this.des = des;
    }
    

    public int getP_id() {
        return p_id;
    }

    public void setP_id(int p_id) {
        this.p_id = p_id;
    }

    public String getP_name() {
        return p_name;
    }

    public void setP_name(String p_name) {
        this.p_name = p_name;
    }

    public float getPrice() {
        return price;
    }

    public void setPrice(float price) {
        this.price = price;
    }

    public String getBrand() {
        return brand;
    }

    public void setBrand(String brand) {
        this.brand = brand;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public int getStock() {
        return stock;
    }

    public void setStock(int stock) {
        this.stock = stock;
    }

    public boolean isStatus() {
        return status;
    }

    public void setStatus(boolean status) {
        this.status = status;
    }

    public String getDes() {
        return des;
    }

    public void setDes(String des) {
        this.des = des;
    }

    public Product(int p_id, String p_name, float price, String brand) {
        this.p_id = p_id;
        this.p_name = p_name;
        this.price = price;
        this.brand = brand;
    }

    @Override
    public String toString() {
        return "Product{" + "p_id=" + p_id + ", p_name=" + p_name + ", price=" + price + ", brand=" + brand + ", image=" + image + ", stock=" + stock + ", status=" + status + ", des=" + des + '}';
    }
    

    
    
    
}
