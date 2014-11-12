
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Login</title>
        <link rel="stylesheet" href="style.css">
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
        <jsp:useBean id="operation_report" class="java.lang.String" scope="request" />
        <c:choose>
            <c:when test="${operation_report == 'user_inserted'}">
                <script>
                    alert("Usuário inserido com sucesso!");
                </script>
            </c:when>
            <c:when test="${operation_report == 'user_edited'}">
                <script>
                    alert("Usuário editado com sucesso!");
                </script>
            </c:when>
            <c:when test="${operation_report == 'login_err'}">
                <script>
                    alert("Login inválido.\nPor favor, escolha outro.");
                </script>
            </c:when>
            <c:otherwise />
        </c:choose>
    </body>
</html>
