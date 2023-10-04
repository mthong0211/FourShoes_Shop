/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import EncodeMD5.MD5;
import EncodeMD5.PassToMD5;
import model.Account;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author ASUS
 */
public class DAO extends DBConnection.dbconnection {

    private Connection conn = null;
    PreparedStatement ps = null;
    ResultSet rs = null;

    public DAO() {

    }

    public List<Account> getAllAccounts() {
        List<Account> list = new ArrayList<>();
        String query = "select * from Account";
        try {
            conn = DBConnection.dbconnection.getConnection();
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Account(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getInt(4), rs.getString(5)));

            }

        } catch (Exception e) {
        }
        return list;
    }

    public Account login(String username, String password) {

        String query = "select * from Account\n"
                + "where [user] = ?\n"
                + "and pass = ?";
        try {
            conn = DBConnection.dbconnection.getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, username);
            ps.setString(2, MD5.encode(password)); // Mã hóa mật khẩu với MD5
            rs = ps.executeQuery();
            while (rs.next()) {
                return (new Account(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getInt(4), rs.getString(5)));

            }

        } catch (Exception e) {
        }

        return null;
    }

    public Account checkAccountExist(String username) {

        String query = "select * from Account\n"
                + "where [user]= ?";
        try {
            conn = DBConnection.dbconnection.getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, username);
            rs = ps.executeQuery();
            while (rs.next()) {
                return (new Account(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getInt(4), rs.getString(5)));
            }

        } catch (Exception e) {
        }

        return null;
    }

    public void signup(String user, String pass, String email, String name, String birthday, String phone) {
        try {
            conn = DBConnection.dbconnection.getConnection();
            conn.setAutoCommit(false); // Tắt chế độ tự động commit

            // Thêm bản ghi vào bảng Account
            String queryAccount = "INSERT INTO Account ([user], pass,isAdmin, email) VALUES (?, ?,0, ?)";
            PreparedStatement psAccount = conn.prepareStatement(queryAccount);
            psAccount.setString(1, user);
            psAccount.setString(2, PassToMD5.getMd5(pass));
            psAccount.setString(3, email);
            psAccount.executeUpdate();

            // Thêm bản ghi vào bảng information
            String queryInfo = "INSERT INTO information ([user], name, birthday, phone) VALUES (?, ?, ?, ?)";
            PreparedStatement psInfo = conn.prepareStatement(queryInfo);
            psInfo.setString(1, user);
            psInfo.setString(2, name);
            psInfo.setDate(3, Date.valueOf(birthday));
            psInfo.setString(4, phone);
            psInfo.executeUpdate();

            conn.commit(); // Lưu các thay đổi vào cơ sở dữ liệu
        } catch (SQLException ex) {

        }
    }

    public int getIsAdminByUsername(String username) {
        int isAdmin = 0;
        try {
            conn = DBConnection.dbconnection.getConnection();
            PreparedStatement stmt = conn.prepareStatement("SELECT isAdmin FROM Account WHERE [user] = ?");
            stmt.setString(1, username);
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                isAdmin = rs.getInt("isAdmin");
            }
            rs.close();
            stmt.close();
            conn.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return isAdmin;
    }

    public Account checkEmailExist(String email) {
        String query = "select * from Account where Email = ?";
        try {
            conn = DBConnection.dbconnection.getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, email);
            rs = ps.executeQuery();
            while (rs.next()) {
                return (new Account(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getInt(4), rs.getString(5)));
            }

        } catch (Exception e) {
        }

        return null;
    }

    public boolean updatePass(String email, String password) {
        try {
            Connection conn = getConnection();
            String sql = "update Account set pass = ? where Email = ?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, PassToMD5.getMd5(password));
            ps.setString(2, email);
            int rowsUpdated = ps.executeUpdate();
            conn.close();
            return rowsUpdated > 0;
        } catch (SQLException ex) {
            ex.printStackTrace();
            return false;
        }
    }

    public Account getPass(String email) {
        String sql = "select pass from Account where Email = ?";
        try {
            conn = DBConnection.dbconnection.getConnection();
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setString(1, email);
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                Account acc = new Account(rs.getString(1));
                return acc;
            }
            return null;

        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    public static void main(String[] args) {
        String email = "loihhca171233@fpt.edu.vn";
        DAO dao = new DAO();
        Account acc = dao.getPass(email);
        if (acc != null) {
            System.out.println("Password for email " + email + " is: " + acc.getPass());
        } else {
            System.out.println("No record found for email: " + email);
        }
    }

}
