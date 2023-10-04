/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import static DBConnection.dbconnection.getConnection;
import model.Info;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Account;

/**
 *
 * @author Dell
 */
public class InfoDAO {

    private Connection conn;
    ResultSet rs = null;
    Info info = null;

    public InfoDAO() {
        conn = DBConnection.dbconnection.getConnection();
    }

   

    public List<Info> getInfoByUsername(String username) {
        List<Info> infoList = new ArrayList<>();

        try ( Connection conn = getConnection();  PreparedStatement stmt = conn.prepareStatement("SELECT a.[user], a.email, p.name, p.birthday, p.phone \n" +
"FROM [dbo].[Account] AS a \n" +
"JOIN [dbo].[information] AS p ON a.[user] = p.[user] \n" +
"WHERE a.[user] = ?")) {
            stmt.setString(1, username);
            try ( ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {

                    String user = rs.getString("user");
                    Account account = new Account();
                    account.setEmail(rs.getString("email"));
                    String name = rs.getString("name");
                    String birthday = rs.getString("birthday");
                    String phone = rs.getString("phone");

                    Info info = new Info(user, account, name, birthday, phone);
                    infoList.add(info);                
                }
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }

        return infoList;
    }

    public static void main(String[] args) {
        InfoDAO dao = new InfoDAO();

        String Ilist = dao.getEmailByUsername("loc12");
        System.out.println(Ilist);

    }
  public boolean updateUserInfo(String username, String email, String name, String birthday, String phone) {
    try (Connection conn = getConnection();
         PreparedStatement stmt = conn.prepareStatement("UPDATE [dbo].[Account] SET email=? WHERE [user]=?; " +
                                                         "UPDATE [dbo].[information] SET name=?, birthday=?, phone=? WHERE [user]=?")) {
        stmt.setString(1, email);
        stmt.setString(2, username);
        stmt.setString(3, name);
        stmt.setString(4, birthday);
        stmt.setString(5, phone);
        stmt.setString(6, username);

        int rowsUpdated = stmt.executeUpdate();
        return rowsUpdated > 0;
    } catch (SQLException ex) {
        ex.printStackTrace();
        return false;
    }
}
    public String getEmailByUsername(String username) {
    String email = null;
try (Connection conn = getConnection();
         PreparedStatement stmt = conn.prepareStatement("SELECT email FROM [dbo].[Account] WHERE [user] = ?")) {
        stmt.setString(1, username);

        try (ResultSet rs = stmt.executeQuery()) {
            if (rs.next()) {
                email = rs.getString("email");
            }
        }
    } catch (SQLException ex) {
        ex.printStackTrace();
    }

    return email;
}
    public String checkEmailExist(String email, String username) {
    String result = null;

    try (Connection conn = getConnection();
         PreparedStatement stmt = conn.prepareStatement("SELECT [user] FROM [dbo].[Account] WHERE email = ? AND [user] <> ?")) {
        stmt.setString(1, email);
        stmt.setString(2, username);

        try (ResultSet rs = stmt.executeQuery()) {
            if (rs.next()) {
                result = rs.getString("user");
            }
        }
    } catch (SQLException ex) {
        ex.printStackTrace();
    }

    return result;
}

}