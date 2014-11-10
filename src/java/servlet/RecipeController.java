/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package servlet;

import beans.Ingredient;
import beans.Recipe;
import beans.User;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author DaviDiório
 */
@WebServlet(name = "RecipeController", urlPatterns = {"/receita"})
public class RecipeController extends HttpServlet {

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
        try {
            User u = (User) request.getSession(false).getAttribute("user");
            ArrayList<Ingredient> ingList = null;
            Recipe rec = null;
            
            if(u != null && request.getParameter("recipe_name") != null) {
                ingList = new ArrayList<Ingredient>();
                
                int i = 1;
                do {
                    ingList.add(new Ingredient(request.getParameter("ingr_name" + i), 
                                                    new Double(request.getParameter("ingr_amnt" + i)),
                                                    request.getParameter("ingr_unt" + i)));

                } while(request.getParameter("ingr_name" + ++i) != null && !request.getParameter("ingr_name" + 1).equals(""));
                
                rec = new Recipe(request.getParameter("recipe_name"),
                                request.getParameter("recipe_category"),
                                ingList,
                                new Integer(request.getParameter("nutritional_value")),
                                request.getParameter("tips"),
                                new Integer(request.getParameter("cooking_time")),
                                request.getParameter("available").equals("true"));  
        
                u.addRecipe(rec);
                
                request.setAttribute("recipe_insertion", "ok");
            }
            
            request.getRequestDispatcher("cadastro_receitas.jsp").forward(request, response);
        } catch(NullPointerException ex) {
            request.setAttribute("trying_access", "ok");
            request.getRequestDispatcher("login.jsp").forward(request, response);
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
