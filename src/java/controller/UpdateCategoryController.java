package src.java.controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.Map;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import src.java.lib.utils.Config.*;
import src.java.model.DAO.CategoryDAO;
import src.java.model.DTO.Account;

public class UpdateCategoryController extends HttpServlet {
    protected void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            HttpSession session = request.getSession();
            
            int id = Integer.parseInt(request.getParameter(Param.ID));
            String name = request.getParameter(Param.NAME);

            Map<Integer, String> cate = (Map<Integer, String>) CategoryDAO.getCategories();
            
            boolean isSuccess = CategoryDAO.updateCategory(id, name);
            
            if(!isSuccess) session.setAttribute(Attribute.MSG, Message.UPDATE_FAILED);
            
            response.sendRedirect(Url.ADMIN + "?" + Param.ACTIVITY + "=" + Admin.CATEGORIES);
        } catch (SQLException ex) {}
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
//                    processRequest(request, response);        
        HttpSession session = request.getSession();
        Account acc = (Account) session.getAttribute(Attribute.USER);
        
        if(acc != null){
            switch (acc.getRole()) {
                case Role.ADMIN:
                    processRequest(request, response);        
                    break;
                default:
                    response.sendRedirect(Url.HOME);
            }
        } else {
            response.sendRedirect(Url.LOGIN);
        }
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
