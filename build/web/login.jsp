<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Login</title>
    </head>
    <body>		
        <head>
            <script language="JavaScript">
                function testeLogin() {
                    alert("testeLogin");
                    var obj_form = document.getElementById('form_login');
                    var obj_login = document.getElementById('usr_email').value;
                    var obj_senha = document.getElementById('usr_pwd').value;
                    var obj_msg_erro = document.getElementById('msg_erro');
                    var msg_erro = '';

                    if (obj_login == '')
                        msg_erro = 'Campo e-mail vazio'
                    else if (obj_senha == '')
                        msg_erro = 'Campo senha vazio'

                    if (msg_erro == '')
                        obj_form.submit();
                    else
                        obj_msg_erro.innerHTML = msg_erro;
                }

            </script>
        </head>

        <h1>Receitas Online</h1><br>
        <form id="form_login" action="index.jsp">
            <table>
                <tr>
                    <td>Login:</td>
                    <td><input type='email' id="usr_email" name="usr_email" maxlength="35"></td>
                </tr>
                <tr>
                    <td>Senha:</td>
                    <td><input type='password' id="usr_pwd" name="usr_pwd" ></td>
                </tr>
                <tr><td><input type='button' value="Enviar" onclick="testeLogin();" ></td></tr>
                <tr><td><a href="cadastro_usuario.jsp">Cadastro de usuario</a></td></tr>
            </table>
        </form>
        <div id="msg_erro"></div>
    </body>
</html>
