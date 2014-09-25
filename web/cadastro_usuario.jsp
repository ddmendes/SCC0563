<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Cadastro de usuario</title>
        <link rel="stylesheet" href="style.css">
        <script>
            var passwdMatch = false;
            function checkPassword() {
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
        <header>
            <h1>Recipes 563</h1>
            <h2>Cadastro de Usuário</h2>
        </header>
        <nav>
            <ul>
                <li><a href="index.jsp">Home</a></li>
                <li><a href="login.jsp">Login</a></li>
            </ul>
        </nav>
        
        <div class="page-content">

            <form action="login.jsp" id="form">
                <div class="input-group">
                    <div class="input-line">
                        <label for="name">Nome:</label>
                        <input type='text' name="name" maxlength="35" pattern="[\w\s]+" title="Utilize somente letras e espaços, sem acentos." required />
                    </div>
                    <div class="input-line">
                        <label for="city">Cidade:</label>
                        <input type='text' name="city" pattern="[\w\s]+" title="Utilize somente letras e espaços, sem acentos." required />
                    </div>
                    <div class="input-line">
                        <label for="state">Estado:</label>
                        <select name="state">
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
                    </div>
                    <div class="input-line">
                        <label for="phone">Telefone:</label>
                        <input type='tel' name="phone" placeholder="(00)00000-0000" pattern="\(\d{2}\)\d{4,5}-\d{4}" title="Utilize o número no formato (00)00000-0000" required />
                    </div>
                    <div class="input-line">
                        <label for="login">Login:</label>
                        <input type='email' name="login" maxlength="35" required />
                    </div>
                    <div class="input-line">
                        <label for="passwd">Senha:</label>
                        <input type='password' name="pwd_usuario" maxlength="8" id="passwd"
                                   pattern="^.*(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[^A-Za-z0-9]).*$"
                                   title="A senha deve conter pelo menos: 1 letra maiúscula, 1 letra minúscula, 1 número e uma caracter especial (não alfanumérico)."
                                   required/>
                    </div>
                    <div class="input-line">
                        <label for="chk_passwd">Confirmar senha:</label>
                        <input type='password' name="chk_pwd_usuario" maxlength="8" onChange="checkPassword();" id="chk_passwd"
                                   pattern="^.*(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[^A-Za-z0-9]).*$"
                                   title="A senha deve conter pelo menos: 1 letra maiúscula, 1 letra minúscula, 1 número e uma caracter especial (não alfanumérico)."
                                   required/>
                        <span id="chk_passwd_result"></span>
                    </div>
                </div>
                <div><input type='button' onClick="checkSend();" value='Cadastrar'></div>
            </form>
        </div>
    </body>
</html>
