/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.util.List;

/**
 *
 * @author PC
 */
public class Cart {

    private List<CartItems> items;
    private float totalPrice;
    

    public Cart(List<CartItems> items, float totalPrice) {
        this.items = items;
        this.totalPrice = totalPrice;
    }

    public Cart() {
    }

    public List<CartItems> getItems() {
        return items;
    }

    public void setItems(List<CartItems> items) {
        this.items = items;
    }

    public float getTotalPrice() {
        return totalPrice;
    }

    public void setTotalPrice(float totalPrice) {
        this.totalPrice = totalPrice;
    }

    private boolean checkItem(int id) {
        for (CartItems item : items) {
            if (item.getProduct().getP_id()== id) {
                return true;
            }
        }
        return false;
    }

    private CartItems getItemByPid(int id) {
        for (CartItems item : items) {
            if (item.getProduct().getP_id()== id) {
                return item;
            }
        }
        return null;
    }

    public void addItem(CartItems newItem) {
        if (checkItem(newItem.getProduct().getP_id())) {
            CartItems oldItem = getItemByPid(newItem.getProduct().getP_id());
            oldItem.setQuantity(oldItem.getQuantity() + newItem.getQuantity());
        } else {
            items.add(newItem);
        }
    }

    public void changeQuantity(int pid, int quantity) {
        CartItems item = getItemByPid(pid);
        item.setQuantity(quantity);
        if (quantity == 0) {
            removeItems(pid);
        }
    }

    public void removeItems(int pid) {
        if (getItemByPid(pid) != null) {
            items.remove(getItemByPid(pid));
        }
    }

    public float getTotalMoney() {
        float total = 0;
        for (CartItems item : items) {
            total += (float) (item.getQuantity() * item.getProduct().getPrice());
        }
        return total;
    }
  

}
