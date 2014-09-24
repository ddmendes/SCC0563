<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Cadastro de usuario</title>
        <script>
            var passwdMatch = false;
            function checkPassword() {
                alert("checking!");
                var passwd = document.getElementById("passwd").value;
                var chkPasswd = document.getElementById("chk_passwd").value;
                
                if(passwd === chkPasswd) {
                    passwdMatch = true;
                    document.getElementById("chk_passwd_result").innerHTML = "Senha ok!";
                } else {
                    passwdMatch = false;
                    document.getElementById("chk_passwd_result").innerHTML = "Senha e confirmação estão diferentes!";
                }   
            }
            
            function checkSend() {
                var form = document.getElementById("form");
                if(passwdMatch) {
                    form.submit();
                }
            }
        </script>
    </head>
    <body>
        <table>
            <td><a href="home.jsp">Home</a></td>
        </table>

        <h1>Cadastro de Usuario<br>

            <form action="login.jsp" id="form">
                <table>
                    <tr><td>Nome:</td>
                        <td><input type='text' name="nome_usuario" maxlength="35" pattern="[\w\s]+" title="Utilize somente letras e espaços, sem acentos." required /></td>
                    </tr>
                    <tr>
                        <td>Cidade:</td>
                        <td><input type='text' name="cidade_usuario" pattern="[\w\s]+" title="Utilize somente letras e espaços, sem acentos." required /></td>
                        <td>Estado:</td>
                        <td><input list="estados" name="estado_usuario" size="2" required />
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
                        <td><input type='tel' name="tel_usuario" placeholder="(00)00000-0000" pattern="\(\d{2}\)\d{4,5}-\d{4}" title="Utilize o número no formato (00)00000-0000" required /></td>
                    </tr>
                    <tr>
                        <td>Login:</td>
                        <td><input type='email' name="login_usuario" maxlength="35" required /></td>
                    </tr>	
                    <tr>
                        <td>Senha:</td>
                        <td><input type='password' name="pwd_usuario" max="8" id="passwd"
                                   pattern="^.*(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[^A-Za-z0-9]).*$"
                                   title="A senha deve conter pelo menos: 1 letra maiúscula, 1 letra minúscula, 1 número e uma caracter especial (não alfanumérico)."
                                   required/></td>
                    </tr>	
                    <tr>
                        <td>Confirma senha:</td>
                        <td>
                            <input type='password' name="chk_pwd_usuario" max="8" onChange="checkPassword();" id="chk_passwd"
                                   pattern="^.*(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[^A-Za-z0-9]).*$"
                                   title="A senha deve conter pelo menos: 1 letra maiúscula, 1 letra minúscula, 1 número e uma caracter especial (não alfanumérico)."
                                   required/>
                            <span id="chk_passwd_result"></span>
                        </td>
                    </tr>
                    <tr><td><input type='button' onClick="checkSend();" value='Cadastrar'></td></tr>
                </table>
            </form>
    </body>
</html>
