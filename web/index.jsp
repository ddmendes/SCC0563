
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Login</title>
        <link rel="stylesheet" href="style.css" />
    </head>
    <body>
        <header>
            <h1>Recipes 563</h1>
        </header>
        <div class="page-content">
            <nav>
                <ul>
                    <c:choose>
                        <c:when test="${param.login_state='not_logged'}">
                            <li><a href='login.jsp'>Login</a></li>
                        </c:when>
                        <c:otherwise>
                            <c:if test="${param.login_state='admin'}">
                                <li><a href='gerenciamento.jsp'>Gerenciamento</a></li>
                            </c:if>
                            <jsp:useBean id="user" class="beans.User" scope="session" />
                            <li><a href='cadastro_usuario.jsp?edit_user=${user.login}'>Editar perfil</a></li>
                            <li><a href='minhas_receitas.jsp'>Minhas Receitas</a></li>
                            <li><a href='cadastro_receitas.jsp'>Cadastro de Receitas</a></li>
                            <li><a href='index.jsp?logout=true'>Sair</a></li>
                        </c:otherwise>
                    </c:choose>
                </ul>
            </nav>
            <section>
                <jsp:useBean id="recList" class="java.util.List" scope="request" />
                <table>
                    <tr>
                        <th>Categoria</th>
                        <th>Receita</th>
                        <th>Nota</th>
                    </tr>
                    <c:forEach var="r" items="recList">
                        <tr>
                            <td><c:out value="${r.category}" /></td>
                            <td><c:out value="${r.name}"     /></td>
                            <td><c:out value="${r.grade}"    /></td>
                        </tr>
                    </c:forEach>
                </table>
            </section>
        </div>
    </body>
</html>
