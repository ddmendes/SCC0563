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
                    <strong>Ingredientes</strong>
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
        </div>
    </body>
</html>
