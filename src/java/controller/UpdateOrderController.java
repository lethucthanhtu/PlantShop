package src.java.controller;

import java.io.IOException;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import src.java.model.DAO.OrderDAO;
import src.java.model.DTO.Order;
import src.java.lib.utils.Config.*;
import src.java.model.DTO.Account;

public class UpdateOrderController extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            HttpSession session = request.getSession();
            Account acc = (Account) session.getAttribute(Attribute.USER);

            int id = Integer.parseInt(request.getParameter(Param.ID));
            int status = Integer.parseInt(request.getParameter(Param.STATUS));

            if (status == Status.PENDING)
                status = Status.CANCEL;
            else
                status = Status.PENDING;

            boolean isSuccess = OrderDAO.updateOrderStatus(id, status);

            if (!isSuccess)
                session.setAttribute(Attribute.MSG, Message.UPDATE_FAILED);

            String url = Url.USER;
            if (acc.getRole() == Role.ADMIN)
                url = Url.ADMIN;

            response.sendRedirect(url + "?" + Param.ACTIVITY + "=" + User.ORDERS);

        } catch (SQLException ex) {
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the
    // + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request  servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException      if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // processRequest(request, response);
        HttpSession session = request.getSession();
        Account acc = (Account) session.getAttribute(Attribute.USER);

        if (acc != null)
            processRequest(request, response);
        else
            response.sendRedirect(Url.LOGIN);

    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request  servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException      if an I/O error occurs
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
