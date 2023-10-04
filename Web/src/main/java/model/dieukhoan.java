/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package model;

import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 *
 * @author ASUS
 */
public class dieukhoan extends HttpServlet {

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
            out.println("<html>");
            out.println("<head>");
            out.println("<style>");
            out.println("body {");
            out.println("    background-image: url('https://c0.wallpaperflare.com/preview/914/440/48/pair-of-cream-white-adidas-yeezy-boost-350-v2-s.jpg');");
            out.println("    background-repeat: no-repeat;");
            out.println("    background-size: cover;");
            out.println("}");
            out.println("p {");
            out.println("    font-size: 18px;");
            out.println("    font-family: 'Roboto', sans-serif;");
            out.println("    color: white;");
            out.println("}");
            out.println("li {");
            out.println("    font-size: 18px;");
            out.println("    color: white;");
            out.println("    font-family: 'Roboto', sans-serif;");
            out.println("}");
            out.println("</style>");
            out.println("<title>10-terms-and-conditions-for-online-shopping</title>");
            out.println("</head>");
            out.println("<br>");
            out.println("<body>");
            out.println("<p>Below are 10 terms and conditions that you may include in your online shopping policy:</p>");
            out.println("<ul>");
            out.println("<br>");
            out.println("<li>Terms about pricing: Clearly state the price of the product, including shipping fees, taxes, and any other applicable fees.</li>");
            out.println("<br>");
            out.println("<li>Terms about payment: Specify the accepted payment methods, payment timeframes, and any accompanying conditions.</li>");
            out.println("<br>");
            out.println("<li>Terms about shipping and delivery: State the shipping timeframe, shipping services used, and shipping fees (if any).</li>");
            out.println("<br>");
            out.println("<li>Terms about returns and exchanges: Define the return and exchange policy, including the timeframe, conditions, and any accompanying fees (if any).</li>");
            out.println("<br>");
            out.println("<li>Terms about warranties and repairs: Specify the product warranty and repair policy, including the timeframe, conditions, and any accompanying fees (if any).</li>");
            out.println("<br>");
            out.println("<li>Terms about intellectual property rights: Outline the intellectual property rights of the product and protect your intellectual property rights.</li>");
            out.println("<br>");
            out.println("<li>Terms about information security: Commit to protecting customer information and using it only for order processing purposes.</li>");
            out.println("<br>");
            out.println("<li>Terms about order cancellation: Provide regulations on cancelling orders and any accompanying conditions (if any).</li>");
            out.println("<br>");
            out.println("<li>Terms about legal responsibility: Clearly state the legal responsibilities of both you and the customer during the purchasing process.</li>");
            out.println("<br>");
            out.println("<li>Terms about privacy policy: Outline your privacy policy and commit to protecting customer information.</li>");
            out.println("<br>");
            out.println("</ul>");
            out.println("<script>");
            out.println("function goBack() {");
            out.println("  window.location.href = 'login.jsp';");
            out.println("}");
            out.println("</script>");
           out.println("<button onclick=\"goBack()\" style=\"background-color: black; color: white; padding: 10px 20px; border: none; border-radius: 4px; cursor: pointer;\">Back</button>");
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
