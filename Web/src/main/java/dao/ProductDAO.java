/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import static DBConnection.dbconnection.getConnection;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import model.Account;
import model.Info;
import model.Order;
import model.Product;

/**
 *
 * @author PC
 */
public class ProductDAO extends DBConnection.dbconnection {

    private Connection conn = null;
    PreparedStatement ps = null;
    ResultSet rs = null;
    Product product = null;

    //get list doi tuong product
    public ArrayList<Product> getListProduct() {

        String sql = "select * from Product";

        try {
            ArrayList<Product> list = new ArrayList<>();
            conn = DBConnection.dbconnection.getConnection();
            PreparedStatement stm = conn.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();

            while (rs.next()) {
                Product p = new Product(rs.getInt(1), rs.getString(2), rs.getFloat(3), rs.getString(4), rs.getString(5));
                list.add(p);
            }
            return list;
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }
  
    public ArrayList<Product> getListProductHomePage(int index, int pageSize) {

        String sql = " SELECT * FROM Product order by P_id\n"
                + "OFFSET ? ROWS\n"
                + "FETCH NEXT ? ROWS ONLY;";

        try {
            ArrayList<Product> list = new ArrayList<>();
            conn = DBConnection.dbconnection.getConnection();
            PreparedStatement stm = conn.prepareStatement(sql);
            stm.setInt(1, (index - 1) * pageSize);
            stm.setInt(2, pageSize);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Product p = new Product(rs.getInt(1), rs.getString(2), rs.getFloat(3), rs.getString(4), rs.getString(5));
                list.add(p);
            }
            return list;
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

    public ArrayList<Product> getFourItemLast() {
        String sql = "SELECT TOP 6 * FROM Product ORDER BY P_id DESC;";

        try {
            ArrayList<Product> list = new ArrayList<>();
            conn = DBConnection.dbconnection.getConnection();
            PreparedStatement stm = conn.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();

            while (rs.next()) {
                Product p = new Product(rs.getInt(1), rs.getString(2), rs.getFloat(3), rs.getString(4), rs.getString(5));
                list.add(p);
            }
            return list;
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

    public ArrayList<Product> getAdidasItem() {
        String sql = "SELECT TOP 6 * FROM Product \n"
                + "where brand = 'Adidas'\n"
                + "ORDER BY P_id DESC;";

        try {
            ArrayList<Product> listA = new ArrayList<>();
            conn = DBConnection.dbconnection.getConnection();
            PreparedStatement stm = conn.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();

            while (rs.next()) {
                Product p = new Product(rs.getInt(1), rs.getString(2), rs.getFloat(3), rs.getString(4), rs.getString(5));
                listA.add(p);
            }
            return listA;
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

    public ArrayList<Product> getNikeItem() {
        String sql = "SELECT TOP 6 * FROM Product \n"
                + "where brand = 'Nike'\n"
                + "ORDER BY P_id DESC;";

        try {
            ArrayList<Product> listN = new ArrayList<>();
            conn = DBConnection.dbconnection.getConnection();
            PreparedStatement stm = conn.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();

            while (rs.next()) {
                Product p = new Product(rs.getInt(1), rs.getString(2), rs.getFloat(3), rs.getString(4), rs.getString(5));
                listN.add(p);
            }
            return listN;
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

    public Product getDetailProduct(int productID) {

        String sql = "select * from Product where p_id = " + productID;

        try {
            conn = DBConnection.dbconnection.getConnection();
            PreparedStatement stm = conn.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();

            while (rs.next()) {
                //them rs.getString(8) de lay du lieu des
                //vì không can` hien^? thi. cot^. thu' 7 trong database nên ko can` phai? them^ vao` day^. bên model.product thì phai insert them constructor ma` ko co status/
                Product p = new Product(rs.getInt(1), rs.getString(2), rs.getFloat(3), rs.getString(4), rs.getString(5), rs.getInt(6),rs.getBoolean(7), rs.getString(8));
                return p;
            }
            return null;
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

    public boolean addNewProduct(String name, float price, String brand, String image, int stock, boolean status, String des) {
        try {
            String sql = "insert into [Product] ( [p_name], [price], [brand], [image], [stock], [status], [des]) values (?,?,?,?,?,?,?)";
            conn = DBConnection.dbconnection.getConnection();
            PreparedStatement pm = conn.prepareStatement(sql);

            pm.setString(1, name);
            pm.setFloat(2, price);
            pm.setString(3, brand);
            pm.setString(4, image);
            pm.setInt(5, stock);
            pm.setBoolean(6, status);
            pm.setString(7, des);
            pm.executeUpdate();

            return true;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }

    }

    public boolean updateProduct(int productId, String name, float price, String brand, String image, int stock, boolean status, String des) {
        try {
            String sql = "update [Product] set [p_name] = ?, [price] = ?, [brand] = ?, [image] = ?, [stock] = ?, [status] = ?, [des] = ? where [p_id] = ?";
            conn = DBConnection.dbconnection.getConnection();
            PreparedStatement pm = conn.prepareStatement(sql);

            pm.setString(1, name);
            pm.setFloat(2, price);
            pm.setString(3, brand);
            pm.setString(4, image);
            pm.setInt(5, stock);
            pm.setBoolean(6, status);
            pm.setString(7, des);
            pm.setInt(8, productId);
            pm.executeUpdate();

            return true;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    public boolean deleteProduct(int productId) {
        try {
            String sql = "delete from Product where p_id = ?";
            conn = DBConnection.dbconnection.getConnection();
            PreparedStatement pm = conn.prepareStatement(sql);

            pm.setInt(1, productId);
            pm.executeUpdate();

            return true;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    public ArrayList<Product> Search(String search, String priceFrom, String priceTo, String sortType, int index, int pageSize) {

        if (search == null) {
            search = "";
        }
        if (priceFrom == null || priceFrom.isEmpty()) {
            priceFrom = "0";
        }
        if (priceTo == null || priceTo.isEmpty()) {
            priceTo = "999999";
        }
        if (sortType == null || sortType.isEmpty()) {
            sortType = "order by p_id asc";
        }
        String sql = " select * from Product where price between ? and ? and p_name like ?  \n "
                + sortType
                + " offset ? rows fetch next ? rows only ";

        try {
            ArrayList<Product> list = new ArrayList<>();
            conn = DBConnection.dbconnection.getConnection();
            PreparedStatement stm = conn.prepareStatement(sql);
            stm.setDouble(1, Double.valueOf(priceFrom));
            stm.setDouble(2, Double.valueOf(priceTo));
            stm.setString(3, "%" + search + "%");
            stm.setInt(4, (index - 1) * pageSize);
            stm.setInt(5, pageSize);
            ResultSet rs = stm.executeQuery();

            while (rs.next()) {
                Product p = new Product();
                p.setP_id(rs.getInt(1));
                p.setP_name(rs.getString(2));
                p.setPrice(rs.getFloat(3));
                p.setBrand(rs.getString(4));
                p.setImage(rs.getString(5));
                list.add(p);
            }
            return list;
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

    public ArrayList<Product> getListDiscountP() {

        String sql = "select * from Product";

        try {
            ArrayList<Product> list = new ArrayList<>();
            conn = DBConnection.dbconnection.getConnection();
            PreparedStatement stm = conn.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();

            while (rs.next()) {
                Product p = new Product(rs.getInt(1),
                        rs.getString(2),
                        rs.getFloat(3),
                        rs.getString(4),
                        rs.getString(5));
                list.add(p);
            }
            return list;
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

    public List<Product> pagingProduct(int index) {

        String query = "SELECT * From Product \n"
                + "ORDER BY p_id \n"
                + "OFFSET ? ROWS FETCH NEXT 5 ROWS ONLY;";
        try {
            List<Product> list = new ArrayList<>();
            conn = DBConnection.dbconnection.getConnection();
            PreparedStatement stm = conn.prepareStatement(query);
            stm.setInt(1, (index - 1) * 5);
            ResultSet rs = stm.executeQuery();

            while (rs.next()) {
                Product p = new Product(rs.getInt(1),
                        rs.getString(2),
                        rs.getFloat(3),
                        rs.getString(4),
                        rs.getString(5));
                list.add(p);
            }
            return list;
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

    public int getTotalProduct() {
        String query = "select count(*) from Product";
        try {
            conn = DBConnection.dbconnection.getConnection();
            PreparedStatement stm = conn.prepareStatement(query);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                return rs.getInt(1);
            }
        } catch (Exception e) {
        }

        return 0;
    }

    public int countPageSize() {
        String sql = "select COUNT (*) as total from Product";
        try {
            PreparedStatement stm = conn.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                return rs.getInt(1);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return 0;
    }

    public int getTotalProductCount(String search, String priceFrom, String priceTo) {
        if (search == null) {
            search = "";
        }
        if (priceFrom == null || priceFrom.isEmpty()) {
            priceFrom = "0";
        }
        if (priceTo == null || priceTo.isEmpty()) {
            priceTo = "999999";
        }
        String sql = "SELECT COUNT(*) FROM Product WHERE price BETWEEN ? AND ? AND p_name LIKE ?";
        try {
            conn = DBConnection.dbconnection.getConnection();
            PreparedStatement stm = conn.prepareStatement(sql);
            stm.setDouble(1, Double.valueOf(priceFrom));
            stm.setDouble(2, Double.valueOf(priceTo));
            stm.setString(3, "%" + search + "%");
            ResultSet rs = stm.executeQuery();
            if (rs.next()) {
                return rs.getInt(1);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return 0;
    }

    public int getTotalProductCountHomePage() {

        String sql = "SELECT COUNT(*) FROM Product";
        try {
            conn = DBConnection.dbconnection.getConnection();
            PreparedStatement stm = conn.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            if (rs.next()) {
                return rs.getInt(1);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return 0;
    }
//    public void addOrder(int order_id, String shoes_name, double total, String username, String address) {
//   
//    try {
//        // Tạo câu lệnh SQL INSERT
//        String sql = "INSERT INTO orders (order_id, shoes_name, total, username, address) VALUES (?, ?, ?, ?, ?)";
//
//        // Tạo đối tượng PreparedStatement
//        PreparedStatement stm = conn.prepareStatement(sql);
//
//        // Thiết lập giá trị cho các tham số
//        stm.setInt(1, order_id);
//        stm.setString(2, shoes_name);
//        stm.setDouble(3, total);
//        stm.setString(4, username);
//        stm.setString(5, address);
//
//        // Thực thi câu lệnh SQL
//        stm.executeUpdate();
//    } catch (SQLException e) {
//        // Xử lý ngoại lệ
//        e.printStackTrace();
//    } 
//    }

public void addOrder(String user, String[] shoesNames, String address, double total) {
    String sql = "INSERT INTO [Order] ([user], Shoes_Name, [address], total) VALUES (?, ?, ?, ?)";

    try (Connection conn = DBConnection.dbconnection.getConnection();
         PreparedStatement pstmt = conn.prepareStatement(sql)) {

        // Thêm thông tin đặt hàng
        pstmt.setString(1, user);
        pstmt.setString(3, address);
        pstmt.setDouble(4, total);

        // Thêm thông tin sản phẩm
        for (String shoesName : shoesNames) {
            pstmt.setString(2, shoesName);
            pstmt.executeUpdate();
        }
    } catch (SQLException e) {
        e.printStackTrace();
    }
}



//   public List<Product> getProductByID(String productId) {
//    List<Product> productList = new ArrayList<>();
//
//    try (Connection conn = getConnection();
//         PreparedStatement stmt = conn.prepareStatement(
//                 "SELECT P_id, P_name, price, brand FROM dbo.Product WHERE P_id = ?")) {
//        stmt.setString(1, productId);
//        try (ResultSet rs = stmt.executeQuery()) {
//            if (rs.next()) {
//                int pId = rs.getInt("P_id");
//                String pName = rs.getString("P_name");
//                float price = rs.getFloat("price");
//                String brand = rs.getString("brand");
//                
//                Product product = new Product(pId, pName, price, brand);
//                productList.add(product);
//            }
//        }
//    } catch (SQLException ex) {
//        ex.printStackTrace();
//    }
//
//    return productList;
//}

public static void main(String[] args) {
    ProductDAO dao = new ProductDAO();
    boolean result = dao.updateProduct(11, "New Product Name", 9.99f, "New Brand", "new-image.jpg", 100, true, "New Description");
    if (result) {
        System.out.println("Product updated successfully.");
    } else {
        System.out.println("Product update failed.");
    }
}



 public List<Order> getAllOrder(String user) {
        List<Order> list = new ArrayList<>();
         String sql = "SELECT  * FROM [Order] where [user]= ?";
        try {
            conn = DBConnection.dbconnection.getConnection();
            ps = conn.prepareStatement(sql);
             ps.setString(1, user);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Order(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getFloat(4), rs.getString(5)));

            }

        } catch (Exception e) {
        }
        return list;
    }


}
