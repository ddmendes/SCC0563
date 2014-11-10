
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Cadastro de receitas</title>
        <link rel="stylesheet" href="style.css">
        <script>
            var i = 2;
            function addMoreIngr() {
                var list = document.getElementById("ingr_list");
                
                list.innerHTML += "<div class='input-line'><input type='text' placeholder='Ingrediente' name='ingr_name"+i+"' class='ing-name' /><input type='number' step='any' placeholder='0' name='ingr_amnt"+i+"' class='ing-amnt' /><select name='ingr_unt"+i+"' class='ing-unt'><option value='Colher'>Colher(es)</option><option value='Xícara'>Xícara(s)</option><option value='Gramas'>Gramas</option><option value='Unidade'>Unidade(s)</option></select></div>";
                i++;
            }
        </script>
    </head>
    <body>
        <header>
            <h1>Recipes 563</h1>
            <h2>Nova Receita:</h2>
        </header>
        <nav>
            <ul>
                <li><a href="index.jsp">Home</a></li>
                <li><a href="minhas_receitas.jsp">Minhas Receitas</a></li>
                <li><a href="login.jsp">Sair</a></li>
            </ul>
        </nav>
        <div class="page-content">
            <form action="receita.jsp">
                <div class="input-group">
                    <div class='input-line'>
                        <label for="recipe_name">Nome:</label>
                        <input type="text" name="recipe_name" />
                    </div>
                    <div class="input-line">
                        <label for="recipe_category">Categoria:</label>
                        <select name="recipe_category">
                            <option value="Doce">Doce</option>
                            <option value="Salgado">Salgado</option>
                            <option value="Aperitivos">Aperitivos</option>
                            <option value="Bebidas">Bebidas</option>
                        </select>
                    </div>
                </div>
                <h3>Ingredientes:</h3>
                <div class="input-list">
                    <div class="input-line">
                        <input type="text" placeholder="Ingrediente" name="ingr_name1" class="ing-name" />
                        <input type="number" step="any" placeholder="0" name="ingr_amnt1" class="ing-qnt" />
                        <select name="ingr_unt1" class="ing-unt">
                            <option value="Colher">Colher(es)</option>
                            <option value="Xícara">Xícara(s)</option>
                            <option value="Gramas">Gramas</option>
                            <option value="Unidade">Unidade(s)</option>
                        </select>
                    </div>
                    <div id="ingr_list">
                    </div>
                    <div class="input-line">
                        <input type="button" value="add more" onClick="addMoreIngr();">
                    </div>
                </div>
                
                <div class="input-group">
                    <div class="input-line">
                        <label for="nutritional_value">Valor nutricional:</label>
                        <input type="number" name="nutritional_value" />
                    </div>
                    <div class="input-line">
                        <label for="tips">Dicas:</label>
                        <textarea name="tips"></textarea>
                    </div>
                    <div class="input-line">
                        <label for="cooking_time">Tempo de preparo(min):</label>
                        <input type="number" name="cooking_time" />
                    </div>
                    <div class="input-line">
                        <label>Nota:</label>
                        <progress max="5" value="0">0</progress>
                    </div>
                    <div class="input-line">
                        <label for="available">Disponível:</label>
                        <input type="checkbox" name="available" value="true" checked/>
                    </div>
                </div>
                <div>
                    <input type="submit" value="Enviar" />
                </div>
            </form>	
        </div>
        <script>
            <c:if test="${param.recipe_insertion='ok'}">
                alert("Receita inserida com sucesso!");
            </c:if>
        </script>
    </body>
</html>
