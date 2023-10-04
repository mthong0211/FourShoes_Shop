/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dao.DAO;
import dao.ProductDAO;
import model.Account;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import static java.lang.System.out;
import java.util.ArrayList;
import model.Product;

/**
 *
 * @author ASUS
 */
public class loginControl extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String username = request.getParameter("name");
        String password = request.getParameter("pass");
        HttpSession session = request.getSession(); // Khai báo biến session
        DAO dao = new DAO();
        int isAdmin = dao.getIsAdminByUsername(username);
        Account a = dao.login(username, password);
        out.print(username);
        if (a == null) {
            request.setAttribute("mess", "Wrong username or password !!!");
            request.getRequestDispatcher("login.jsp").forward(request, response);
        } else {
            ProductDAO daoX = new ProductDAO();
            ArrayList<Product> list = daoX.getListProduct();
            session.setAttribute("isAdmin", isAdmin);
            session.setAttribute("username", username); // Lưu tên người dùng vào biến session
            session.setAttribute("isLoggedIn", true); // Tạo biến isLoggedIn và lưu giá trị vào session
            request.setAttribute("list", list);
//            request.getRequestDispatcher("index.jsp").forward(request, response);
            response.sendRedirect("index-control");

        }
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
