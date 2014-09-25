<%@page import="model.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    User user = (User) session.getAttribute("user");
    String usrRecipesTable = user.getMyRecipesTableView();
%>
<html>
    <head>
        <title>Minhas Receitas</title>
        <link rel="stylesheet" href="style.css" />
    </head>
    <body>
        <header>
            <h1>Recipes 563</h1>
            <h2>Minhas Receitas</h2>
        </header>
        <nav>
            <ul>
                <li><a href="index.jsp">Home</a></li>
            </ul>
        </nav>
        <div class="page-content">
            <div>
                <div>
                    <h3>Que você postou</h3>
                </div>
                <div>
                    <%=usrRecipesTable%>
                </div>
            </div>
            <div>
                <div>
                    <h3>Que você curtiu</h3>
                </div>
            </div>
        </div>
    </body>
</html>

