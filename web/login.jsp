
<%@page import="model.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    String msg = "";
    User u = (User) session.getAttribute("user");
    String login = request.getParameter("login");
    if(login != null) {
        if(request.getParameter("edt_user").equals("") && User.checkAvailableLogin(login) && request.getParameter("pwd_usuario").equals(request.getParameter("chk_pwd_usuario"))) {
            new User(
                request.getParameter("name").toUpperCase(), 
                request.getParameter("city").toUpperCase(),
                request.getParameter("state"),
                request.getParameter("phone"),
                login,
                request.getParameter("pwd_usuario"));
            msg = "document.onLoad = new function() { alert(\"Cadastro realizado com sucesso!\"); }";
        } else if(u != null && u.getLogin().equals(request.getParameter("edt_user"))) {
            u.setName(request.getParameter("name"));
            u.setCity(request.getParameter("city"));
            u.setState(request.getParameter("state"));
            u.setPhone(request.getParameter("phone"));
            u.setLogin(login);
            u.setPasswd(request.getParameter("actual_passwd"), request.getParameter("pwd_usuario"));
            msg = "document.onLoad = new function() { alert(\"Usuário editado com sucesso!\"); }";
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
                        <label>Login:</label>
                        <input type='email' name="login" required />
                    </div>
                    <div class="input-line">
                        <label>Senha:</label>
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
