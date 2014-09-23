<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Cadastro de usuario</title>
    </head>
    <body>
        <table>
            <td><a href="home.jsp">Home</a></td>
        </table>

        <h1>Cadastro de Usuario<br>

            <form action="login.jsp">
                <table>
                    <tr><td>Nome:</td>
                        <td><input type='text' name="nome_usuario" maxlength="35"></td>
                    </tr>
                    <tr>
                        <td>Cidade:</td>
                        <td><input type='text' name="cidade_usuario"></td>
                        <td>Estado:</td>
                        <td><input list="estados" name="estado_usuario" size="2">
                            <datalist id="estados">
                                <option value="AC">
                                <option value="AL">
                                <option value="AP">
                                <option value="AM">
                                <option value="BA">
                                <option value="CE">	
                                <option value="DF">
                                <option value="ES">
                                <option value="GO">
                                <option value="MA">
                                <option value="MT">
                                <option value="MS">
                                <option value="MG">
                                <option value="PA">
                                <option value="PB">
                                <option value="PR">
                                <option value="PE">
                                <option value="PI">
                                <option value="RJ">
                                <option value="RN">
                                <option value="RS">
                                <option value="RO">
                                <option value="RR">
                                <option value="SC">
                                <option value="SP">
                                <option value="SE">
                                <option value="TO">
                            </datalist>
                        </td>
                    </tr>
                    <tr><td>Telefone:</td>
                        <td><input type='tel' name="tel_usuario"></td>
                    </tr>
                    <tr>
                        <td>Login:</td>
                        <td><input type='email' name="login_usuario" maxlength="35"></td>
                    </tr>	
                    <tr>
                        <td>Senha:</td>
                        <td><input type='password' name="pwd_usuario" max="8"></td>
                    </tr>	

                    <tr><td><input type='submit' value='Cadastrar'></td></tr>
                </table>
            </form>
    </body>
</html>
