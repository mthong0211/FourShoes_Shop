/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author Dell
 */
public class Order {
    private int orderId;
    private String user;
    private String address;
    private Float total;
    private String Shoes_name;

    public Order(int orderId, String user, String address, Float total, String Shoes_name) {
        this.orderId = orderId;
        this.user = user;
        this.address = address;
        this.total = total;
        this.Shoes_name = Shoes_name;
    }

    public Order(int orderId, String address, Float total, String Shoes_name) {
        this.orderId = orderId;
        this.address = address;
        this.total = total;
        this.Shoes_name = Shoes_name;
    }

    public Order(String user, String address, Float total, String Shoes_name) {
        this.user = user;
        this.address = address;
        this.total = total;
        this.Shoes_name = Shoes_name;
    }

    @Override
    public String toString() {
        return "Order{" + "orderId=" + orderId + ", user=" + user + ", address=" + address + ", total=" + total + ", Shoes_name=" + Shoes_name + '}';
    }

   
    
    

    public String getShoes_name() {
        return Shoes_name;
    }

    public void setShoes_name(String Shoes_name) {
        this.Shoes_name = Shoes_name;
    }

    

    public int getOrderId() {
        return orderId;
    }

    public void setOrderId(int orderId) {
        this.orderId = orderId;
    }

    public String getUser() {
        return user;
    }

    public void setUser(String user) {
        this.user = user;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public Float getTotal() {
        return total;
    }

    public void setTotal(Float total) {
        this.total = total;
    }
    
    
}
