package src.java.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import src.java.lib.utils.Config.*;
import src.java.model.DAO.CategoryDAO;
import src.java.model.DAO.PlantDAO;
import src.java.model.DTO.Plant;

public class SearchController extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            String search = request.getParameter(Param.SEARCH);
            String option = request.getParameter(Param.OPTION);
            List<Plant> list = new ArrayList<>();
            Map<Integer, String> cate = CategoryDAO.getCategories();

            request.setAttribute(Attribute.OPTION, Option.NAME);

            switch (option) {
                case Option.NAME:
                    list = PlantDAO.getPlants(search);
                    break;
                case Option.CATEGORY:
                    Map<Integer, String> cateSearch = CategoryDAO.getCategoriesByName(search);
                    System.out.println(cateSearch);
                    List<Plant> tmpList = PlantDAO.getPlants();
                    for (Plant p : tmpList)
                        for (int i : cateSearch.keySet()) {
                            if (p.getCateID() == i)
                                list.add(p);
                        }
                    System.out.println(list);
                    request.setAttribute(Attribute.OPTION, Option.CATEGORY);
                    break;
                default:
                    list = PlantDAO.getPlants();

            }

            request.setAttribute(Attribute.SEARCH_VALUE, search);
            request.setAttribute(Attribute.SEARCH_RESULT, list);
            request.getRequestDispatcher(Page.SEARCH).forward(request, response);
        } catch (Exception e) {
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
        String search = request.getParameter(Param.SEARCH);
        String option = request.getParameter(Param.OPTION);
        if (search == null || search.isEmpty() ||
                option == null || option.isEmpty())
            response.sendRedirect(Url.HOME);
        else
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
