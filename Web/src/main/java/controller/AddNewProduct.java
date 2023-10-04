/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dao.ProductDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import java.io.File;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author PC
 */
@MultipartConfig(
        fileSizeThreshold = 1024 * 1024 * 1,
        maxFileSize = 1024 * 1024 * 10,
        maxRequestSize = 1024 * 1025 * 20
)
public class AddNewProduct extends HttpServlet {

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
            out.println("<title>Servlet AddNewProduct</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet AddNewProduct at " + request.getContextPath() + "</h1>");
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
        request.getRequestDispatcher("./products/add.jsp").forward(request, response);
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
//        String id = request.getParameter("id");
//        int id1 = Integer.valueOf(id);
        String name = request.getParameter("name");
        String price = request.getParameter("price");
        float price1 = Float.valueOf(price);
        String brand = request.getParameter("brand");
        Part part = request.getPart("image");
        String fileName = extractFileName(part);
        fileName = new File(fileName).getName();
        part.write(this.getFolderUpload().getAbsolutePath()+ File.separator + fileName);        
        String stock = request.getParameter("stock");
        int stock1 = Integer.valueOf(stock);
        String status = request.getParameter("status");
        boolean status1 = Boolean.parseBoolean(status);

        //them truong du lieu des
        String des = request.getParameter("des");
               
        ProductDAO dao = new ProductDAO();

        //them truong du lieu des
        boolean check = dao.addNewProduct(name, price1, brand, fileName, stock1, status1, des);
        if (check) {

            response.sendRedirect("/home");
        } else {
            response.getWriter().print("Add failed");
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

private String extractFileName(Part part) {
    String contentDisp = part.getHeader("content-disposition");
    String[] items = contentDisp.split(";");
    for (String s : items) {
        if (s.trim().startsWith("filename")) {
            String fileName = s.substring(s.indexOf("=") + 2, s.length() - 1);
            String fileExtension = fileName.substring(fileName.lastIndexOf(".") + 1);
            if (isImageExtension(fileExtension)) {
                return fileName;
            } else {
                try {
                    throw new IOException("File uploaded is not an image");
                } catch (IOException ex) {
                    Logger.getLogger(AddNewProduct.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
        }
    }
    return "";
}

public static boolean isImageExtension(String extension) {
    String[] imageExtensions = { "jpg", "jpeg", "png", "gif", "bmp" };
    for (String imageExtension : imageExtensions) {
        if (extension.equalsIgnoreCase(imageExtension)) {
            return true;
        }
    }
    return false;
}

    public File getFolderUpload() {
        // sua nay theo duong link toi thu muc images trong may.
        File folderUpload = new File("D:\\Web\\web6\\Web\\Web\\src\\main\\webapp\\images");
        if (!folderUpload.exists()) {
            folderUpload.mkdirs();
        }
        return folderUpload;
    }

}
