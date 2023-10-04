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
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Product;

/**
 *
 * @author ASUS
 */
public class signupControl extends HttpServlet {

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
        try ( PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
        }
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
        String user = request.getParameter("username");
        String email = request.getParameter("email");
        String pass = request.getParameter("password");
        String name = request.getParameter("name");
        String birthday = request.getParameter("birthday");
        String phone = request.getParameter("phone");
        String Repass = request.getParameter("RePassword");
        String checkrem = request.getParameter("btnCheck");
        HttpSession session = request.getSession(); // Khai báo biến session
        DAO dao = new DAO();
        if (user.length() < 5 || !user.matches("[a-zA-Z0-9]+")) {
            request.setAttribute("mesA", "Username must be at least 5 characters long and contain letters and numbers!");
            request.getRequestDispatcher("login.jsp").forward(request, response);
        } else {
            Account e = dao.checkEmailExist(email);
            if (e != null) {
                request.setAttribute("mes", "Email is existed !!!");
                request.getRequestDispatcher("login.jsp").forward(request, response);
            } else {
                if (!email.matches("^\\w+@[fF][pP][tT]\\.[eE][dD][uU]\\.[vV][nN]$") && !email.matches("^\\w+@[gG][mM][aA][iI][lL]\\.[cC][oO][mM]$")) {
                    request.setAttribute("mes", "Email must be aaa@gmail.com or aaa@fpt.edu.vn !");
                    request.getRequestDispatcher("login.jsp").forward(request, response);
                } else {
                    if (!pass.matches("(?=.*[0-9])(?=.*[a-z]).{8,}")) {
                        request.setAttribute("mes", "Password must be at least 8 characters and include letters and numbers!");
                        request.getRequestDispatcher("login.jsp").forward(request, response);
                    } else {
                        if (!pass.equals(Repass)) {
                            request.setAttribute("mes", "Password and Re-password are different, Please try again!!!");
                            request.getRequestDispatcher("login.jsp").forward(request, response);
                        } else {
                            if (checkrem == null) {
                                request.setAttribute("mes", "Please accept terms and conditions.");
                                request.getRequestDispatcher("login.jsp").forward(request, response);
                            } else {
                                Account a = dao.checkAccountExist(user);
                                if (a == null) {
                                    if (name == null || name.equals("")) { // Kiểm tra name không được null
                                        request.setAttribute("mes", "Name must not be empty!");
                                        request.getRequestDispatcher("login.jsp").forward(request, response);
                                    } else if (!name.matches("[a-zA-Z ]+")) { // Kiểm tra name không có số
                                        request.setAttribute("mes", "Name must not contain any numbers!");
                                        request.getRequestDispatcher("login.jsp").forward(request, response);
                                    } else if (birthday == null || birthday.equals("")) { // Kiểm tra birthday không được null
                                        request.setAttribute("mes", "Birthday must not be empty!");
                                        request.getRequestDispatcher("login.jsp").forward(request, response);
                                    } else {
                                        try {
                                            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
                                            Date date = sdf.parse(birthday);
                                            if (date.after(new Date())) { // Kiểm tra birthday không phải là ngày trong tương lai
                                                request.setAttribute("mes", "Birthday must not be in the future!");
                                                request.getRequestDispatcher("login.jsp").forward(request, response);
                                            } else {
                                                if (phone == null || phone.equals("")) { // Kiểm tra phone không được null
                                                    request.setAttribute("mes", "Phone must not be empty!");
                                                    request.getRequestDispatcher("login.jsp").forward(request, response);
                                                } else if (!phone.matches("\\d{10}")) { // Kiểm tra phone có đủ 10 số
                                                    request.setAttribute("mes", "Phone must have 10 digits!");
                                                    request.getRequestDispatcher("login.jsp").forward(request, response);
                                                } else {
                                                    dao.signup(user, pass, email, name, birthday, phone);
                                                    ProductDAO daoX = new ProductDAO();
                                                    ArrayList<Product> list = daoX.getListProduct();
                                                    session.setAttribute("isAdmin", 0);
                                                    session.setAttribute("isLoggedIn", true); // Tạo biến isLoggedIn và lưu giá trị vào session
                                                    session.setAttribute("username", user); // Lưu tên người dùng vào biến session
                                                    request.setAttribute("list", list);
                                                    request.getRequestDispatcher("home.jsp").forward(request, response);
                                                }
                                            }
                                        } catch (ParseException ex) {
                                            request.setAttribute("mes", "Invalid date format!");
                                            request.getRequestDispatcher("login.jsp").forward(request, response);
                                        }
                                    }
                                } else {
                                    request.setAttribute("mes", "Username is existed !!!");
                                    request.getRequestDispatcher("login.jsp").forward(request, response);
                                }
                            }
                        }
                    }
                }
            }
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
