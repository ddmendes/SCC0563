<%@page import="model.Recipe"%>
<%@page import="model.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    if(User.checkAvailableLogin("adm@receitas.com")) {
        new User("Administrador", "São Carlos", "SP", "(19)3333-3333", "adm@receitas.com", "12345@Fc");
    }
    
    if(request.getParameter("logout") != null) {
        session.removeAttribute("user");
    }
    
    User user = (User) session.getAttribute("user");
    User login = User.getUser(request.getParameter("login"));
    String navSection = null;
    String mainSection = null;
    
    if(user != null || login != null) {
        if(user == null) {
            user = login;
            session.setAttribute("user", login);
        }
        
        navSection = "<ul>";
        if(user.getName().equals("Administrador")) {
            navSection = navSection.concat("<li><a href='management.jsp'>Gerenciamento</a></li>");
        }
        navSection = navSection.concat(""
            + "     <li><a href='cadastro_usuario.jsp?login="+user.getLogin()+"'>Editar perfil</a></li>"
            + "     <li><a href='minhas_receitas.jsp'>Minhas Receitas</a></li>"
            + "     <li><a href='cadastro_receitas.jsp'>Cadastro de Receitas</a></li>"
            + "     <li><a href='index.jsp?logout=true'>Sair</a></li>"
            + " </ul>");
        
        mainSection = "<h3>Bem vindo, " + user.getName() + "!</h3>";
        mainSection = mainSection.concat(Recipe.getCategoryNameGradeTableView());
        
    } else {
        navSection = ""
                + " <ul>"
                + "     <li><a href='login.jsp'>Login</a></li>"
                + " </ul>";
        
        mainSection = "Faça login para continuar";
    }
    
%>
<!DOCTYPE html>
<html>
    <head>
        <title>Login</title>
        <link rel="stylesheet" href="style.css">
    </head>
    <body>
        <header>
            <h1>Recipes 563</h1>
        </header>
        <div class="page-content">
            <nav>
                <%=navSection%>
            </nav>
            <section>
                <%=mainSection%>
            </section>
        </div>
    </body>
</html>
