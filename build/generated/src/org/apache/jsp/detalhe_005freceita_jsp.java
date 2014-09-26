package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import model.Ingredient;
import model.Recipe;

public final class detalhe_005freceita_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  private org.glassfish.jsp.api.ResourceInjector _jspx_resourceInjector;

  public java.util.List<String> getDependants() {
    return _jspx_dependants;
  }

  public void _jspService(HttpServletRequest request, HttpServletResponse response)
        throws java.io.IOException, ServletException {

    PageContext pageContext = null;
    HttpSession session = null;
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;
    PageContext _jspx_page_context = null;

    try {
      response.setContentType("text/html;charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("<!DOCTYPE html>\n");

    String recipeName = "";
    String recipeCategory = "";
    String recipeIngredientsList = "";
    String recipeNutritionValue = "";
    String recipeTips = "";
    String recipeCookingTime = "";
    String recipeGrade = "";
    
    String recipeId = request.getParameter("recipe_id");
    if(recipeId != null) {
        Recipe r = Recipe.getRecibeById(Integer.parseInt(recipeId));
        
        recipeName = r.getName();
        recipeCategory = r.getCategory();
        
        recipeIngredientsList = "<ul>";
        for(Ingredient i : r.getIngredients()) {
            recipeIngredientsList = recipeIngredientsList.concat("<li>" + i.getAmount() + i.getUnit() + " de " + i.getName() + "</li>");
        }
        recipeIngredientsList = recipeIngredientsList.concat("</ul>");
        
        recipeNutritionValue = r.getNutritionValue().toString();
        
        for(String s : r.getTips().split("\n")) {
            recipeTips = recipeTips.concat("<p>" + s + "</p>");
        }
        
        recipeCookingTime = r.getCookingTime() + " min.";
        recipeGrade = "<progress max='5' value='" + r.getGrade() + "' ></progress><span>" + r.getGrade() + "</span>";
        
    }
    String login = (session.getAttribute("user") != null) ? "" : "<li><a href='login.jsp'>Login</a></li>";

      out.write("\n");
      out.write("<html>\n");
      out.write("    <head>\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n");
      out.write("        <title>");
      out.print(recipeName);
      out.write("</title>\n");
      out.write("        <link rel=\"stylesheet\" href=\"style.css\" />\n");
      out.write("    </head>\n");
      out.write("    <body>\n");
      out.write("        <header>\n");
      out.write("            <h1>Recipes 563</h1>\n");
      out.write("            <h2>");
      out.print(recipeName);
      out.write("</h2>\n");
      out.write("        </header>\n");
      out.write("        <nav>\n");
      out.write("            <ul>\n");
      out.write("                <li><a href=\"index.jsp\">Home</a></li>\n");
      out.write("                ");
      out.print(login);
      out.write("\n");
      out.write("            </ul>\n");
      out.write("        </nav>\n");
      out.write("        <div class=\"page-content\">\n");
      out.write("            <ul>\n");
      out.write("                <li><strong>Nota:</strong> ");
      out.print(recipeGrade);
      out.write("</li>\n");
      out.write("                <li><strong>Categoria:</strong> ");
      out.print(recipeCategory);
      out.write("</li>\n");
      out.write("                <li>\n");
      out.write("                    <strong>Ingredientes</strong>\n");
      out.write("                    ");
      out.print(recipeIngredientsList);
      out.write("\n");
      out.write("                </li>\n");
      out.write("                <li><strong>Valor nutricional:</strong> ");
      out.print(recipeNutritionValue);
      out.write("</li>\n");
      out.write("                <li>\n");
      out.write("                    <div>\n");
      out.write("                        <div>\n");
      out.write("                            <strong>Dicas:</strong>\n");
      out.write("                        </div>\n");
      out.write("                        <div class=\"recipe-tips\">\n");
      out.write("                            ");
      out.print(recipeTips);
      out.write("\n");
      out.write("                        </div>\n");
      out.write("                    </div>\n");
      out.write("                </li>\n");
      out.write("                <li><strong>Tempo de preparo:</strong> ");
      out.print(recipeCookingTime);
      out.write("</li>\n");
      out.write("            </ul>\n");
      out.write("            <div>\n");
      out.write("                <form action=\"detalhe_receita.jsp\">\n");
      out.write("                    <input type=\"hidden\" name=\"recipe_id\" value=\"");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.evaluateExpression("${recipeId}", java.lang.String.class, (PageContext)_jspx_page_context, null));
      out.write("\" />\n");
      out.write("                    <label>Comentário:</label><br />\n");
      out.write("                    <textarea name=\"comment\" required></textarea><br />\n");
      out.write("                    <input type=\"submit\" value=\"Enviar\" />\n");
      out.write("                </form>\n");
      out.write("            </div>\n");
      out.write("            <div>\n");
      out.write("                <form action=\"detalhe_receita.jsp\">\n");
      out.write("                    <input type=\"hidden\" name=\"recipe_id\" value=\"");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.evaluateExpression("${recipeId}", java.lang.String.class, (PageContext)_jspx_page_context, null));
      out.write("\" />\n");
      out.write("                    <label>De sua nota:</label>\n");
      out.write("                    <input type=\"radio\" name=\"rate\" value=\"0\" />0\n");
      out.write("                    <input type=\"radio\" name=\"rate\" value=\"1\" />1\n");
      out.write("                    <input type=\"radio\" name=\"rate\" value=\"2\" />2\n");
      out.write("                    <input type=\"radio\" name=\"rate\" value=\"3\" />3\n");
      out.write("                    <input type=\"radio\" name=\"rate\" value=\"4\" />4\n");
      out.write("                    <input type=\"radio\" name=\"rate\" value=\"5\" />5\n");
      out.write("                    <input type=\"submit\" value=\"Votar\" />\n");
      out.write("                </form>\n");
      out.write("            </div>\n");
      out.write("        </div>\n");
      out.write("    </body>\n");
      out.write("</html>\n");
    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          out.clearBuffer();
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
