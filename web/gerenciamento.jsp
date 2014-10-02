<%-- 
    Document   : gerenciamento.jsp
    Created on : 02/10/2014, 08:59:07
    Author     : DaviDiório
--%>

<%@page import="model.Recipe"%>
<%@page import="model.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    if(request.getParameter("rem_user") != null) {
        User.remove(request.getParameter("rem_user"));
    } else if (request.getParameter("rem_rec") != null) {
        Recipe.getRecibeById(Integer.parseInt(request.getParameter("rem_rec"))).remove();
    }
    
    String userList = User.getUserTableView();
    String recipeList = Recipe.getManagementTableView();
    
    
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="style.css" />
    </head>
    <body>
        <header>
            <h1>Recipes 563</h1>
            <h2>Gerenciamento</h2>
        </header>
        <div class="page">
            <nav>
                <ul>
                    <li><a href="index.jsp">Home</a></li>
                    <li><a href="index.jsp?logout=true">Sair</a></li>
                </ul>
            </nav>
            <div class="page-content">
                <h3>Usuarios</h3>
                <%=userList%>
                <h3>Receitas</h3>
                <%=recipeList%>
            </div>
        </div>
    </body>
</html>
