package src.java.controller;

import java.io.IOException;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import src.java.lib.utils.Config.*;
import src.java.model.DAO.AccountDAO;
import src.java.model.DTO.Account;

public class RegisterController extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            HttpSession session = request.getSession();

            String name = request.getParameter(Param.NAME);
            String email = request.getParameter(Param.EMAIL);
            String phone = request.getParameter(Param.PHONE);
            String password = request.getParameter(Param.PASSWORD);

            boolean isSuccess = false;
            // if(!AccountDAO.isExist(email))
            isSuccess = AccountDAO.insertAccount(new Account(email, password, name, Status.ACTIVE, phone, Role.BUYER));

            if (isSuccess) {
                Account acc = AccountDAO.getAccount(email, password);
                session.setAttribute(Attribute.USER, acc);
                if (acc.getRole() == Role.ADMIN)
                    response.sendRedirect(Url.ADMIN);
                else
                    response.sendRedirect(Url.HOME);

            } else {
                request.setAttribute(Attribute.MSG, Message.REGISTER_FAILED);
                request.getRequestDispatcher(Page.REGISTER).forward(request, response);
            }
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
        HttpSession session = request.getSession();

        if (session.getAttribute(Attribute.USER) != null)
            response.sendRedirect(Url.HOME);
        else
            request.getRequestDispatcher(Page.REGISTER).forward(request, response);

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
