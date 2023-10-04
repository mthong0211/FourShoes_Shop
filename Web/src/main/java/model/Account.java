/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author ASUS
 */
public class Account {
    private int A_id;
    private String user;
    private String pass;
    private int isAdmin;
    private String email;

    public Account() {
    }

    public Account(int A_id, String user, String pass, int isAdmin, String email) {
        this.A_id = A_id;
        this.user = user;
        this.pass = pass;
        this.isAdmin = isAdmin;
        this.email = email;
    }

    public Account(String pass) {
        this.pass = pass;
    }
    
    

    public int getA_id() {
        return A_id;
    }

    public void setA_id(int A_id) {
        this.A_id = A_id;
    }

    public String getUser() {
        return user;
    }

    public void setUser(String user) {
        this.user = user;
    }

    public String getPass() {
        return pass;
    }

    public void setPass(String pass) {
        this.pass = pass;
    }

    public int getIsAdmin() {
        return isAdmin;
    }

    public void setIsAdmin(int isAdmin) {
        this.isAdmin = isAdmin;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    @Override
    public String toString() {
        return "Account{" + "A_id=" + A_id + ", user=" + user + ", pass=" + pass + ", isAdmin=" + isAdmin + ", email=" + email + '}';
    }

    
}
