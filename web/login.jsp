<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Login</title>
    </head>
    <body>		
        <script language="JavaScript">
            function testeLogin() {
                var obj_form = document.getElementById('form_login');
                var obj_login = document.getElementById('usr_email');
                var obj_senha = document.getElementById('usr_pwd');
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
                document.write("Hello WOrd");
            }

        </script>

        <h1>Receitas Online</h1><br>
        <form id="form_login" action="home.html">
            <table>
                <tr>
                    <td>Login:</td>
                    <td><input type='email' id="usr_email" name="usr_email" maxlength="35"></td>
                </tr>
                <tr>
                    <td>Senha:</td>
                    <td><input type='password' id="usr_pwd" name="usr_pwd" ></td>
                </tr>
                <tr><td><input type='submit' value="Enviar" onclik="testeLogin();" ></td></tr>
                <tr><td><a href="cadastro_usuario.html">Cadastro de usuario</a></td></tr>
            </table>
        </form>
        <div id="msg_erro"></div>
    </body>
</html>
