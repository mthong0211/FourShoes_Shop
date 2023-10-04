/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.sql.Date;

/**
 *
 * @author Dell
 */
public class Info {
    private String user;
    private String name;
    private String birthday;
    private String phone;
    private String email;

    public Info() {
    }

    public Info(String user, Account account, String name, String birthday, String phone) {
        this.user = user;
        this.email = account.getEmail();
        this.name = name;
        this.birthday = birthday;
        this.phone = phone;
    }

    public String getUser() {
        return user;
    }

    public void setUser(String user) {
        this.user = user;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getBirthday() {
        return birthday;
    }

    public void setBirthday(String birthday) {
        this.birthday = birthday;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    @Override
    public String toString() {
        return "Info{" + "user=" + user + ", name=" + name + ", birthday=" + birthday + ", phone=" + phone + ", email=" + email + '}';
    }
    
}
    
    
    
   