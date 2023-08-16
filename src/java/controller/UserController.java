package src.java.controller;

import java.io.IOException;
import java.sql.Date;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import src.java.model.DAO.CategoryDAO;
import src.java.model.DAO.OrderDAO;
import src.java.model.DTO.Order;
import src.java.lib.utils.Config.*;
import src.java.model.DAO.AccountDAO;
import src.java.model.DAO.PlantDAO;
import src.java.model.DTO.Account;
import src.java.model.DTO.Plant;

public class UserController extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        ;

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
        HttpSession session = request.getSession();
        String act = request.getParameter(Param.ACTIVITY);
        String from = request.getParameter(Param.FROM_DATE);
        String to = request.getParameter(Param.TO_DATE);
        // int act = Integer.parseInt(actStr);
        Account acc = (Account) session.getAttribute(Attribute.USER);

        if (acc != null)
            switch (acc.getRole()) {
                case Role.ADMIN:
                    response.sendRedirect(Url.ADMIN);
                    break;
                // case Role.BUYER:
                default:
                    int id = acc.getAccID();
                    try {
                        if (act == null)
                            session.setAttribute(Attribute.ACTIVITY, User.PROFILE);
                        else
                            switch (act) {
                                case User.PROFILE + "":
                                    session.setAttribute(Attribute.ACTIVITY, User.PROFILE);
                                    break;
                                case User.ORDERS + "":
                                    List<Order> orders = OrderDAO.getOrdersByAccID(id);

                                    if ((from != null && !from.isEmpty()) &&
                                            (to != null && !to.isEmpty())) {
                                        orders = OrderDAO.getOrdersByOrderDate(Date.valueOf(from), Date.valueOf(to));

                                        for (Order o : orders)
                                            if (o.getAccID() != id)
                                                orders.remove(o);

                                    }
                                    request.setAttribute(Attribute.ORDERS, orders);
                                    session.setAttribute(Attribute.ACTIVITY, User.ORDERS);
                                    break;
                                default:
                                    break;
                            }
                    } catch (SQLException ex) {
                        ex.printStackTrace();
                    }

                    request.getRequestDispatcher(Page.USER).forward(request, response);
                    // break;
                    // default:
                    // response.sendRedirect(Url.HOME);
            }
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
