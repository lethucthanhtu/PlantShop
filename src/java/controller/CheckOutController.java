package src.java.controller;

import java.io.IOException;
import java.util.List;
import java.util.Map;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import src.java.model.DAO.OrderDAO;
import src.java.model.DTO.Order;
import src.java.lib.utils.Config.*;
import src.java.model.DAO.AccountDAO;
import src.java.model.DTO.Account;

public class CheckOutController extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            HttpSession session = request.getSession();

            Map<Integer, Integer> cart = (Map<Integer, Integer>) session.getAttribute(Attribute.CART);
            Account acc = (Account) session.getAttribute(Attribute.USER);

            if (acc == null)
                response.sendRedirect(Url.LOGIN);
            else {
                if (cart.size() != 0) {
                    int id = acc.getAccID();

                    if (OrderDAO.insertOrder(id, cart)) {
                        List<Order> order = OrderDAO.getOrdersByAccID(id);
                        session.setAttribute(Attribute.ORDER, order);
                        session.removeAttribute(Attribute.CART);
                        response.sendRedirect(Url.CART);
                    } else
                        request.setAttribute(Attribute.MSG, Message.ORDER_FAILED);

                } else
                    response.sendRedirect(Url.HOME);
            }

        } catch (Exception ex) {
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
        processRequest(request, response);
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
        // processRequest(request, response);
        HttpSession session = request.getSession();
        Account acc = (Account) session.getAttribute(Attribute.USER);

        if (acc != null)
            processRequest(request, response);
        else
            response.sendRedirect(Url.LOGIN);
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
