/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dao.InfoDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import model.Info;

/**
 *
 * @author ASUS
 */
public class UpdateInF extends HttpServlet {

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
            out.println("<title>Servlet UpdateInF</title>");

            out.println("</head>");
            out.println("<body>");
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

        String username = request.getParameter("user");
        String email = request.getParameter("email");
        String name = request.getParameter("name");
        String birthday = request.getParameter("birthday");
        String phone = request.getParameter("phone");
        InfoDAO dao = new InfoDAO();
        if (email == null || email.trim().isEmpty() || !email.matches("^\\w+@[fF][pP][tT]\\.[eE][dD][uU]\\.[vV][nN]$") && !email.matches("^\\w+@[gG][mM][aA][iI][lL]\\.[cC][oO][mM]$")) {
            // Nếu giá trị email trống, trả về một thông báo lỗi và hiển thị lại trang info.jsp
            request.setAttribute("mesfl", "Please provide your email");
            HttpSession session = request.getSession();
            String username1 = (String) session.getAttribute("username");
            InfoDAO daox = new InfoDAO();
            List<Info> infoList = daox.getInfoByUsername(username1);
            request.setAttribute("infoList", infoList);
            request.setAttribute("username", username); // Thêm username vào request để hiển thị lại trang info.jsp
            request.setAttribute("email", email); // Thêm email vào request để hiển thị lại trang info.jsp
            request.setAttribute("name", name); // Thêm name vào request để hiển thị lại trang info.jsp
            request.setAttribute("birthday", birthday); // Thêm birthday vào request để hiển thị lại trang info.jsp
            request.setAttribute("phone", phone); // Thêm phone vào request để hiển thị lại trang info.jsp
            request.getRequestDispatcher("info.jsp").forward(request, response);
            return;
        } else {
            // Kiểm tra xem email đã tồn tại trong cơ sở dữ liệu hay chưa
            String oldEmail = dao.getEmailByUsername(username);
            if (!email.equals(oldEmail)) {
                String result = dao.checkEmailExist(email, username);
                if (result != null) {
                    // Nếu email đã tồn tại cho một người dùng khác, trả về một thông báo lỗi và hiển thị lại trang info.jsp
                    request.setAttribute("mesfl", "This email already exists for another user");
                    HttpSession session = request.getSession();
                    String username1 = (String) session.getAttribute("username");
                    InfoDAO daox = new InfoDAO();
                    List<Info> infoList = daox.getInfoByUsername(username1);
                    request.setAttribute("infoList", infoList);
                    request.setAttribute("username", username); // Thêm username vào request để hiển thị lại trang info.jsp
                    request.setAttribute("email", email); // Thêm email vào request để hiển thị lại trang info.jsp
                    request.setAttribute("name", name); // Thêm name vào request để hiển thị lại trang info.jsp
                    request.setAttribute("birthday", birthday); // Thêm birthday vào request để hiển thị lại trang info.jsp
                    request.setAttribute("phone", phone); // Thêm phone vào request để hiển thị lại trang info.jsp
                    request.getRequestDispatcher("info.jsp").forward(request, response);
                    return;
                } else {
                    if (phone != null && !phone.matches("\\d{10}") || (!phone.matches("^[0-9]+$"))) {
                        // Nếu giá trị phone không đúng định dạng, trả về một thông báo lỗi và hiển thị lại trang info.jsp
                        request.setAttribute("mesfl", "Please provide a valid phone number (10 digits)");
                        HttpSession session = request.getSession();
                        String username1 = (String) session.getAttribute("username");
                        InfoDAO daox = new InfoDAO();
                        List<Info> infoList = daox.getInfoByUsername(username1);
                        request.setAttribute("infoList", infoList);
                        request.setAttribute("username", username); // Thêm username vào request để hiển thị lại trang info.jsp
                        request.setAttribute("email", email); // Thêm email vào request để hiển thị lại trang info.jsp
                        request.setAttribute("name", name); // Thêm name vào request để hiển thị lại trang info.jsp
                        request.setAttribute("birthday", birthday); // Thêm birthday vào request để hiển thị lại trang info.jsp
                        request.getRequestDispatcher("info.jsp").forward(request, response);
                    } else {
                        if (name == null || name.trim().isEmpty() || !name.matches("[a-zA-Z ]+")) {
                            // Nếu giá trị name trống, trả về một thông báo lỗi và hiển thị lại trang info.jsp
                            request.setAttribute("mesfl", "Please provide your name");
                            HttpSession session = request.getSession();
                            String username1 = (String) session.getAttribute("username");
                            InfoDAO daox = new InfoDAO();
                            List<Info> infoList = daox.getInfoByUsername(username1);
                            request.setAttribute("infoList", infoList);
                            request.setAttribute("username", username); // Thêm username vào request để hiển thị lại trang info.jsp
                            request.setAttribute("email", email); // Thêm email vào request để hiển thị lại trang info.jsp
                            request.setAttribute("name", name); // Thêm name vào request để hiển thị lại trang info.jsp
                            request.setAttribute("birthday", birthday); // Thêm birthday vào request để hiển thị lại trang info.jsp
                            request.setAttribute("phone", phone); // Thêm phone vào request để hiển thị lại trang info.jsp
                            request.getRequestDispatcher("info.jsp").forward(request, response);
                            return;
                        } else {

                            if (birthday == null || birthday.trim().isEmpty()) {
                                // Nếu giá trị birthday trống, trả về một thông báo lỗi và hiển thị lại trang info.jsp
                                request.setAttribute("mesfl", "Please provide your date of birth");
                                HttpSession session = request.getSession();
                                String username1 = (String) session.getAttribute("username");
                                InfoDAO daox = new InfoDAO();
                                List<Info> infoList = daox.getInfoByUsername(username1);
                                request.setAttribute("infoList", infoList);
                                request.setAttribute("username", username); // Thêm username vào request để hiển thị lại trang info.jsp
                                request.setAttribute("email", email); // Thêm email vào request để hiển thị lại trang info.jsp
                                request.setAttribute("name", name); // Thêm name vào request để hiển thị lại trang info.jsp
                                request.setAttribute("phone", phone); // Thêm phone vào request để hiển thị lại trang info.jsp
                                request.getRequestDispatcher("info.jsp").forward(request, response);
                                return;
                            } else {
                                try {
                                    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
                                    Date date = null;
                                    if (!birthday.matches("\\d{4}-\\d{2}-\\d{2}")) {
                                        // Nếu ngày sinh không đúng định dạng yyyy-MM-dd, trả về một thông báo lỗi và hiển thị lại trang info.jsp
                                        request.setAttribute("mesfl", "Please provide your date of birth in the format yyyy-MM-dd");
                                        HttpSession session = request.getSession();
                                        String username1 = (String) session.getAttribute("username");
                                        InfoDAO daox = new InfoDAO();
                                        List<Info> infoList = daox.getInfoByUsername(username1);
                                        request.setAttribute("infoList", infoList);
                                        request.setAttribute("username", username); // Thêm username vào request để hiển thị lại trang info.jsp
                                        request.setAttribute("email", email); // Thêm email vào request để hiển thị lại trang info.jsp
                                        request.setAttribute("name", name); // Thêm name vào request để hiển thị lại trang info.jsp
                                        request.setAttribute("phone", phone); // Thêm phone vào request để hiển thị lại trang info.jsp
                                        request.getRequestDispatcher("info.jsp").forward(request, response);
                                        return;
                                    } else {
                                        date = sdf.parse(birthday);
                                    }
                                    if (date.after(new Date())) { // Kiểm tra birthday không phải là ngày trong tương lai
                                        request.setAttribute("mesfl", "Birthday must not be in the future!");
                                        HttpSession session = request.getSession();
                                        String username1 = (String) session.getAttribute("username");
                                        InfoDAO daox = new InfoDAO();
                                        List<Info> infoList = daox.getInfoByUsername(username1);
                                        request.setAttribute("infoList", infoList);
                                        request.setAttribute("username", username); // Thêm username vào request để hiển thị lại trang info.jsp
                                        request.setAttribute("email", email); // Thêm email vào request để hiển thị lại trang info.jsp
                                        request.setAttribute("name", name); // Thêm name vào request để hiển thị lại trang info.jsp
                                        request.setAttribute("phone", phone); // Thêm phone vào request để hiển thị lại trang info.jsp
                                        request.getRequestDispatcher("info.jsp").forward(request, response);
                                    } else {
                                        request.setAttribute("messc", "Update your profile successfully !!!");
                                        HttpSession session = request.getSession();
                                        String username1 = (String) session.getAttribute("username");
                                        InfoDAO daox = new InfoDAO();
                                        List<Info> infoList = daox.getInfoByUsername(username1);
                                        request.setAttribute("infoList", infoList);
                                        request.getRequestDispatcher("info.jsp").forward(request, response);
                                        boolean updated = dao.updateUserInfo(username, email, name, birthday, phone);

                                        if (updated) {
                                            request.setAttribute("messc", "Update your profile successfully !!!");

                                            String username12 = (String) session.getAttribute("username");
                                            InfoDAO daoxa = new InfoDAO();
                                            List<Info> infoListx = daoxa.getInfoByUsername(username1);
                                            request.setAttribute("infoList", infoList);
                                            request.getRequestDispatcher("info.jsp").forward(request, response);
                                        } else {
                                            // Nếu xảy ra lỗi khi cập nhật thông tin người dùng, trả về một thông báo lỗi và hiển thị lại trang info.jsp
                                            request.setAttribute("mesfl", "Update your profile fail !!!");

                                            String username13 = (String) session.getAttribute("username");
                                            InfoDAO daoxb = new InfoDAO();
                                            List<Info> infoLista = daoxb.getInfoByUsername(username1);
                                            request.setAttribute("infoList", infoList);
                                            request.setAttribute("username", username); // Thêm username vào request để hiển thị lại trang info.jsp
                                            request.setAttribute("email", email); // Thêm email vào request để hiển thị lại trang info.jsp
                                            request.setAttribute("name", name); // Thêm name vào request để hiển thị lại trang info.jsp
                                            request.setAttribute("birthday", birthday); // Thêm birthday vào request để hiển thị lại trang info.jsp
                                            request.getRequestDispatcher("info.jsp").forward(request, response);
                                        }
                                    }
                                } catch (ParseException ex) {
                                    request.setAttribute("mesfl", "Invalid date format!");
                                    HttpSession session = request.getSession();
                                    String username1 = (String) session.getAttribute("username");
                                    InfoDAO daox = new InfoDAO();
                                    List<Info> infoList = daox.getInfoByUsername(username1);
                                    request.setAttribute("infoList", infoList);
                                    request.setAttribute("username", username);// Thêm username vào request để hiển thị lại trang info.jsp
                                    request.setAttribute("email", email); // Thêm email vào request để hiển thị lại trang info.jsp
                                    request.setAttribute("name", name); // Thêm name vào request để hiển thị lại trang info.jsp
                                    request.setAttribute("phone", phone); // Thêm phone vào request để hiển thị lại trang info.jsp
                                    request.getRequestDispatcher("info.jsp").forward(request, response);
                                    return;
                                }
                            }
                        }
                    }

                }
            } else {
                if (phone != null && !phone.matches("\\d{10}") || (!phone.matches("^[0-9]+$"))) {
                    // Nếu giá trị phone không đúng định dạng, trả về một thông báo lỗi và hiển thị lại trang info.jsp
                    request.setAttribute("mesfl", "Please provide a valid phone number (10 digits)");
                    HttpSession session = request.getSession();
                    String username1 = (String) session.getAttribute("username");
                    InfoDAO daox = new InfoDAO();
                    List<Info> infoList = daox.getInfoByUsername(username1);
                    request.setAttribute("infoList", infoList);
                    request.setAttribute("username", username); // Thêm username vào request để hiển thị lại trang info.jsp
                    request.setAttribute("email", email); // Thêm email vào request để hiển thị lại trang info.jsp
                    request.setAttribute("name", name); // Thêm name vào request để hiển thị lại trang info.jsp
                    request.setAttribute("birthday", birthday); // Thêm birthday vào request để hiển thị lại trang info.jsp
                    request.getRequestDispatcher("info.jsp").forward(request, response);
                } else {
                    if (name == null || name.trim().isEmpty() || !name.matches("[a-zA-Z ]+")) {
                        // Nếu giá trị name trống, trả về một thông báo lỗi và hiển thị lại trang info.jsp
                        request.setAttribute("mesfl", "Please provide your name");
                        HttpSession session = request.getSession();
                        String username1 = (String) session.getAttribute("username");
                        InfoDAO daox = new InfoDAO();
                        List<Info> infoList = daox.getInfoByUsername(username1);
                        request.setAttribute("infoList", infoList);
                        request.setAttribute("username", username); // Thêm username vào request để hiển thị lại trang info.jsp
                        request.setAttribute("email", email); // Thêm email vào request để hiển thị lại trang info.jsp
                        request.setAttribute("name", name); // Thêm name vào request để hiển thị lại trang info.jsp
                        request.setAttribute("birthday", birthday); // Thêm birthday vào request để hiển thị lại trang info.jsp
                        request.setAttribute("phone", phone); // Thêm phone vào request để hiển thị lại trang info.jsp
                        request.getRequestDispatcher("info.jsp").forward(request, response);
                        return;
                    } else {

                        if (birthday == null || birthday.trim().isEmpty()) {
                            // Nếu giá trị birthday trống, trả về một thông báo lỗi và hiển thị lại trang info.jsp
                            request.setAttribute("mesfl", "Please provide your date of birth");
                            HttpSession session = request.getSession();
                            String username1 = (String) session.getAttribute("username");
                            InfoDAO daox = new InfoDAO();
                            List<Info> infoList = daox.getInfoByUsername(username1);
                            request.setAttribute("infoList", infoList);
                            request.setAttribute("username", username); // Thêm username vào request để hiển thị lại trang info.jsp
                            request.setAttribute("email", email); // Thêm email vào request để hiển thị lại trang info.jsp
                            request.setAttribute("name", name); // Thêm name vào request để hiển thị lại trang info.jsp
                            request.setAttribute("phone", phone); // Thêm phone vào request để hiển thị lại trang info.jsp
                            request.getRequestDispatcher("info.jsp").forward(request, response);
                            return;
                        } else {
                            try {
                                SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
                                Date date = null;
                                if (!birthday.matches("\\d{4}-\\d{2}-\\d{2}")) {
                                    // Nếu ngày sinh không đúng định dạng yyyy-MM-dd, trả về một thông báo lỗi và hiển thị lại trang info.jsp
                                    request.setAttribute("mesfl", "Please provide your date of birth in the format yyyy-MM-dd");
                                    HttpSession session = request.getSession();
                                    String username1 = (String) session.getAttribute("username");
                                    InfoDAO daox = new InfoDAO();
                                    List<Info> infoList = daox.getInfoByUsername(username1);
                                    request.setAttribute("infoList", infoList);
                                    request.setAttribute("username", username); // Thêm username vào request để hiển thị lại trang info.jsp
                                    request.setAttribute("email", email); // Thêm email vào request để hiển thị lại trang info.jsp
                                    request.setAttribute("name", name); // Thêm name vào request để hiển thị lại trang info.jsp
                                    request.setAttribute("phone", phone); // Thêm phone vào request để hiển thị lại trang info.jsp
                                    request.getRequestDispatcher("info.jsp").forward(request, response);
                                    return;
                                } else {
                                    date = sdf.parse(birthday);
                                }
                                if (date.after(new Date())) { // Kiểm tra birthday không phải là ngày trong tương lai
                                    request.setAttribute("mesfl", "Birthday must not be in the future!");
                                    HttpSession session = request.getSession();
                                    String username1 = (String) session.getAttribute("username");
                                    InfoDAO daox = new InfoDAO();
                                    List<Info> infoList = daox.getInfoByUsername(username1);
                                    request.setAttribute("infoList", infoList);
                                    request.setAttribute("username", username); // Thêm username vào request để hiển thị lại trang info.jsp
                                    request.setAttribute("email", email); // Thêm email vào request để hiển thị lại trang info.jsp
                                    request.setAttribute("name", name); // Thêm name vào request để hiển thị lại trang info.jsp
                                    request.setAttribute("phone", phone); // Thêm phone vào request để hiển thị lại trang info.jsp
                                    request.getRequestDispatcher("info.jsp").forward(request, response);
                                } else {
                                    request.setAttribute("messc", "Update your profile successfully !!!");
                                    HttpSession session = request.getSession();
                                    String username1 = (String) session.getAttribute("username");
                                    InfoDAO daox = new InfoDAO();
                                    List<Info> infoList = daox.getInfoByUsername(username1);
                                    request.setAttribute("infoList", infoList);
                                    request.getRequestDispatcher("info.jsp").forward(request, response);
                                    boolean updated = dao.updateUserInfo(username, email, name, birthday, phone);

                                    if (updated) {
                                        request.setAttribute("messc", "Update your profile successfully !!!");

                                        String username12 = (String) session.getAttribute("username");
                                        InfoDAO daoxa = new InfoDAO();
                                        List<Info> infoListx = daoxa.getInfoByUsername(username1);
                                        request.setAttribute("infoList", infoList);
                                        request.getRequestDispatcher("info.jsp").forward(request, response);
                                    } else {
                                        // Nếu xảy ra lỗi khi cập nhật thông tin người dùng, trả về một thông báo lỗi và hiển thị lại trang info.jsp
                                        request.setAttribute("mesfl", "Update your profile fail !!!");

                                        String username13 = (String) session.getAttribute("username");
                                        InfoDAO daoxb = new InfoDAO();
                                        List<Info> infoLista = daoxb.getInfoByUsername(username1);
                                        request.setAttribute("infoList", infoList);
                                        request.setAttribute("username", username); // Thêm username vào request để hiển thị lại trang info.jsp
                                        request.setAttribute("email", email); // Thêm email vào request để hiển thị lại trang info.jsp
                                        request.setAttribute("name", name); // Thêm name vào request để hiển thị lại trang info.jsp
                                        request.setAttribute("birthday", birthday); // Thêm birthday vào request để hiển thị lại trang info.jsp
                                        request.getRequestDispatcher("info.jsp").forward(request, response);
                                    }
                                }
                            } catch (ParseException ex) {
                                request.setAttribute("mesfl", "Invalid date format!");
                                HttpSession session = request.getSession();
                                String username1 = (String) session.getAttribute("username");
                                InfoDAO daox = new InfoDAO();
                                List<Info> infoList = daox.getInfoByUsername(username1);
                                request.setAttribute("infoList", infoList);
                                request.setAttribute("username", username);// Thêm username vào request để hiển thị lại trang info.jsp
                                request.setAttribute("email", email); // Thêm email vào request để hiển thị lại trang info.jsp
                                request.setAttribute("name", name); // Thêm name vào request để hiển thị lại trang info.jsp
                                request.setAttribute("phone", phone); // Thêm phone vào request để hiển thị lại trang info.jsp
                                request.getRequestDispatcher("info.jsp").forward(request, response);
                                return;
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
