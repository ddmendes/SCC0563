
<%@page import="model.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    String msg = "";
    if(request.getParameter("login") != null) {
        if(User.checkAvailableLogin(request.getParameter("login"))) {
            new User(
                request.getParameter("name").toUpperCase(), 
                request.getParameter("city").toUpperCase(),
                request.getParameter("state"),
                request.getParameter("phone"),
                request.getParameter("login"),
                request.getParameter("passwd"));
            msg = "document.onLoad = new function() { alert(\"Cadastro realizado com sucesso!\"); }";
        } else {
            msg = "document.onLoad = new function() { alert(\"Login inválido.\\nEscolha outro.\"); }";
        }
    }
%>
<html>
    <head>
        <title>Login</title>
        <link rel="stylesheet" href="style.css">
        <script><%=msg%></script>
    </head>
    <body>		
        <header>
            <h1>Recipes 563</h1>
            <h2>Página de Login</h2>
        </header>
        <nav>
            <ul>
                <li><a href="index.jsp">Home</a></li>
                <li><a href="cadastro_usuario.jsp">Cadastro de Usuários</a></li>
            </ul>
        </nav>
        <div class="page-content">
            <form action="index.jsp">
                <div class="input-group">
                    <div class="input-line">
                        <label for="login">Login:</label>
                        <input type='email' name="login" required />
                    </div>
                    <div class="input-line">
                        <label for="passwd">Senha:</label>
                        <input type="password" name="passwd" required />
                    </div>
                    <div class="input-line">
                        <input type="submit" value="Enviar" />
                    </div>
                </div>
            </form>
        </div>
    </body>
</html>
