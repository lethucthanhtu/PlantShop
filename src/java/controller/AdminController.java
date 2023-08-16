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
import letu.ui.MySystem;
import letu.validate.Check;
import src.java.lib.utils.Config.*;
import src.java.model.DAO.AccountDAO;
import src.java.model.DAO.PlantDAO;
import src.java.model.DTO.Account;
import src.java.model.DTO.Plant;

public class AdminController extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // request.getRequestDispatcher(Page.ADMIN).forward(request, response);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        String actStr = request.getParameter(Param.ACTIVITY);
        String id = request.getParameter(Param.ID);
        String from = request.getParameter(Param.FROM_DATE);
        String to = request.getParameter(Param.TO_DATE);
        System.out.println(id);
        System.out.println(from);
        System.out.println(to);
        // int act = Integer.parseInt(actStr);
        Account acc = (Account) session.getAttribute(Attribute.USER);

        if (acc != null)
            switch (acc.getRole()) {
                case Role.ADMIN:
                    try {
                        if (actStr == null)
                            session.setAttribute(Attribute.ACTIVITY, User.PROFILE);
                        else
                            switch (actStr) {
                                case Admin.ACCOUNTS + "":
                                    List<Account> accounts = AccountDAO.getAccounts();
                                    request.setAttribute(Attribute.ACCOUNTS, accounts);
                                    session.setAttribute(Attribute.ACTIVITY, Admin.ACCOUNTS);
                                    break;
                                case Admin.PLANTS + "":
                                    List<Plant> plants = PlantDAO.getPlants();
                                    request.setAttribute(Attribute.PLANTS, plants);
                                    session.setAttribute(Attribute.ACTIVITY, Admin.PLANTS);
                                    break;
                                case Admin.CATEGORIES + "":
                                    Map<Integer, String> categories = CategoryDAO.getCategories();
                                    request.setAttribute(Attribute.CATEGORIES, categories);
                                    session.setAttribute(Attribute.ACTIVITY, Admin.CATEGORIES);
                                    break;
                                case User.PROFILE + "":
                                    session.setAttribute(Attribute.ACTIVITY, User.PROFILE);
                                    break;
                                case User.ORDERS + "":

                                    List<Order> orders = OrderDAO.getOrders();
                                    List<Order> o = new ArrayList<>();

                                    if ((from != null && !from.isEmpty()) &&
                                            (to != null && !to.isEmpty())) {
                                        orders = OrderDAO.getOrdersByOrderDate(Date.valueOf(from), Date.valueOf(to));
                                        System.out.println("check");
                                    }

                                    if (id != null && !id.isEmpty()) {
                                        for (Order order : orders)
                                            if (order.getAccID() == Integer.parseInt(id))
                                                o.add(order);
                                        orders = o;
                                    }
                                    request.setAttribute(Attribute.SORT_VALUE, id);
                                    request.setAttribute(Attribute.ORDERS, orders);
                                    session.setAttribute(Attribute.ACTIVITY, User.ORDERS);

                                    break;
                                default:
                                    break;
                            }
                    } catch (SQLException ex) {
                        ex.printStackTrace();
                    }
                    request.getRequestDispatcher(Page.ADMIN).forward(request, response);

                    break;
                case Role.BUYER:
                    response.sendRedirect(Url.USER);
                    break;
                default:
                    response.sendRedirect(Url.HOME);
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
