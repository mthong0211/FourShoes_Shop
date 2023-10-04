/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DBConnection;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author ThanhLoc
 */
public class dbconnection {
     private static Connection conn;     
    
    public static Connection getConnection() {
        
            try {
         Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
                 conn = DriverManager.getConnection("jdbc:sqlserver://LAPTOP-947768H0:1433;databaseName=Shoes5;user=sa;password=123456;encrypt=true;trustServerCertificate=true;");
            } catch (ClassNotFoundException ex) {
                Logger.getLogger(dbconnection.class.getName()).log(Level.SEVERE, null, ex);
            } catch (SQLException ex){
                Logger.getLogger(dbconnection.class.getName()).log(Level.SEVERE, null, ex);
            }
        return conn;
       
        } 
    public static void main(String[] args) {
        try {
            System.out.println(dbconnection.getConnection());
        } catch (Exception e) {
        }
    }

    public PreparedStatement prepareStatement(String query) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }
        
}
