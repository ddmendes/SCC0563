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
                        <td>
                            <select name="estado">
                                <option value="AC">AC</option>
                                <option value="AL">AL</option>
                                <option value="AP">AP</option>
                                <option value="AM">AM</option>
                                <option value="BA">BA</option>
                                <option value="CE">CE</option>
                                <option value="DF">DF</option>
                                <option value="ES">ES</option>
                                <option value="GO">GO</option>
                                <option value="MA">MA</option>
                                <option value="MT">MT</option>
                                <option value="MS">MS</option>
                                <option value="MG">MG</option>
                                <option value="PA">PA</option>
                                <option value="PB">PB</option>
                                <option value="PR">PR</option>
                                <option value="PE">PE</option>
                                <option value="PI">PI</option>
                                <option value="RJ">RJ</option>
                                <option value="RN">RN</option>
                                <option value="RS">RS</option>
                                <option value="RO">RO</option>
                                <option value="RR">RR</option>
                                <option value="SC">SC</option>
                                <option value="SP">SP</option>
                                <option value="SE">SE</option>
                                <option value="TO">TO</option>
                            </select>
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
                    <tr>
                        <td><input type='button' onClick="checkSend();" value='Cadastrar'></td>
                    </tr>
                </table>
            </form>
    </body>
</html>
