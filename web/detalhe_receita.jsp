<%@page import="java.util.HashMap"%>
<%@page import="model.User"%>
<%@page import="model.Ingredient"%>
<%@page import="model.Recipe"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    String recipeName = "";
    String recipeCategory = "";
    String recipeIngredientsList = "";
    String recipeNutritionValue = "";
    String recipeTips = "";
    String recipeCookingTime = "";
    String recipeGrade = "";
    String comments = "";
    String login = "<li><a href='login.jsp'>Login</a></li>";
    
    String recipeId = request.getParameter("recipe_id");
    if(recipeId != null) {
        Recipe r = Recipe.getRecibeById(Integer.parseInt(recipeId));
        
        User u = (User) session.getAttribute("user");
        if(u != null) {
            if(request.getParameter("comment") != null) {
                String comment = request.getParameter("comment");
                u.addComment(r, comment);
                r.addComment(u, comment);
            } else if(request.getParameter("rate") != null) {
                Integer i = new Integer(request.getParameter("rate"));
                u.addRating(r, i);
                r.addRate(i);
            }
            login = "";
        }
        
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
        
        HashMap<User, String> c = r.getComments();
        for(User us : c.keySet()) {
            comments = comments.concat("<div><div>" + us.getName() + "</div><div>" + c.get(us) + "</div></div>");
        }
        
    }
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title><%=recipeName%></title>
        <link rel="stylesheet" href="style.css" />
    </head>
    <body>
        <header>
            <h1>Recipes 563</h1>
            <h2><%=recipeName%></h2>
        </header>
        <nav>
            <ul>
                <li><a href="index.jsp">Home</a></li>
                <%=login%>
            </ul>
        </nav>
        <div class="page-content">
            <ul>
                <li><strong>Nota:</strong> <%=recipeGrade%></li>
                <li><strong>Categoria:</strong> <%=recipeCategory%></li>
                <li>
                    <strong>Ingredientes:</strong>
                    <%=recipeIngredientsList%>
                </li>
                <li><strong>Valor nutricional:</strong> <%=recipeNutritionValue%></li>
                <li>
                    <div>
                        <div>
                            <strong>Dicas:</strong>
                        </div>
                        <div class="recipe-tips">
                            <%=recipeTips%>
                        </div>
                    </div>
                </li>
                <li><strong>Tempo de preparo:</strong> <%=recipeCookingTime%></li>
            </ul>
            <div>
                <form action="detalhe_receita.jsp">
                    <input type="hidden" name="recipe_id" value="${recipeId}" />
                    <label>Comentário:</label><br />
                    <textarea name="comment" required></textarea><br />
                    <input type="submit" value="Enviar" />
                </form>
            </div>
            <div>
                <form action="detalhe_receita.jsp">
                    <input type="hidden" name="recipe_id" value="${recipeId}" />
                    <label>De sua nota:</label>
                    <input type="radio" name="rate" value="0" />0
                    <input type="radio" name="rate" value="1" />1
                    <input type="radio" name="rate" value="2" />2
                    <input type="radio" name="rate" value="3" />3
                    <input type="radio" name="rate" value="4" />4
                    <input type="radio" name="rate" value="5" />5
                    <input type="submit" value="Votar" />
                </form>
            </div>
            <div>
                <div>
                    <h3>Comentários</h3>
                </div>
                <%=comments%>
            </div>
        </div>
    </body>
</html>
