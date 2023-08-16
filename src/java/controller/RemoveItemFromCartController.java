package src.java.controller;

import java.io.IOException;
import java.util.List;
import java.util.Map;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import src.java.lib.utils.Config.*;
import src.java.model.DAO.PlantDAO;
import src.java.model.DTO.Account;
import src.java.model.DTO.Plant;

public class RemoveItemFromCartController extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();

        int id = Integer.parseInt(request.getParameter(Param.ID));
        Plant plant = null;

        Map<Integer, Integer> cart = (Map<Integer, Integer>) session.getAttribute(Attribute.CART);
        List<Plant> cartItem = (List<Plant>) session.getAttribute(Attribute.CART_ITEMS);

        cart.remove(id);
        for (Plant p : cartItem)
            if (id == p.getPlantID()) {
                plant = p;
                break;
            }
        cartItem.remove(plant);

        session.setAttribute(Attribute.CART, cart);
        session.setAttribute(Attribute.CART_ITEMS, cartItem);

        response.sendRedirect(Url.CART);

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
        HttpSession session = request.getSession();
        Account acc = (Account) session.getAttribute(Attribute.USER);

        if (acc == null)
            response.sendRedirect(Url.LOGIN);
        else
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
