/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dao.ProductDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import model.Product;

/**
 *
 * @author PC
 */
public class ListProduct extends HttpServlet {

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
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet ListProduct</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ListProduct at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
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
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    ProductDAO dao = new ProductDAO();

    String search = request.getParameter("search");
    String priceFrom = request.getParameter("priceFrom");
    String priceTo = request.getParameter("priceTo");
    String sortType = request.getParameter("sortType");
    String currentIndex = request.getParameter("index") == null ? "1" : request.getParameter("index");
    int index = Integer.valueOf(currentIndex);
    int pageSize = 5;
    ArrayList<Product> list = dao.Search(search, priceFrom, priceTo, sortType, index, pageSize);
    int totalProductCount = dao.getTotalProductCount(search, priceFrom, priceTo);
    int pageCount = (int) Math.ceil((double) totalProductCount / pageSize);
    request.setAttribute("list", list);
    request.setAttribute("pageCount", pageCount);
    request.setAttribute("search", search);
request.setAttribute("priceFrom", priceFrom);
request.setAttribute("priceTo", priceTo);
request.setAttribute("sortType", sortType);
    request.getRequestDispatcher("./products/list.jsp").forward(request, response);

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
        processRequest(request, response);
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
