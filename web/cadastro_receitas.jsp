<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Cadastro de receitas</title>
    </head>
    <body>
        <table>
            <td>
                <a href="index.jsp">Home</a>
                <a href="minhas_receitas.jsp">Minhas Receitas</a> 
                <a href="login.jsp">Sair</a>
            </td>
        </table>

        <br><h1>Nova Receita:</h1>
        <form action="cadastro_receitas.jsp">
            <table>
                <tr><td><b>*Nome:<input type="text" width:"48" heigth="48"></td></tr>
                <tr><td>
                        <b>*Categoria:
                            <input list="ctg_receitas" name="categoria_receita" size="8">
                            <datalist id="ctg_receitas">
                                <option value="Doce">
                                <option value="Salgado">
                                <option value="Aperitivos">
                                <option value="Bebidas">
                            </datalist>
                    </td>
                </tr>
                <tr><td><b>*Ingredientes:</td></tr>
                <tr>
                    <th>Nome-Ingrediente</th>
                    <th>Quantidade</th>
                    <th>Unidade</th>
                </tr>
                <tr>
                    <td><input type="text" width="100%"></td>
                    <td><input type=""></td>
                    <td><input type="text"></td>
                    <td><input type="button" value="add more"></td>
                </tr>
                <tr><td><b>*Valor Nutricional:<input type="number" value="0" min="0" size="2"></td></tr>
                <tr><td><b>Dicas:<input type="text" size="30"></td></tr>	
                <tr><td><b>*Tempo de preparo: <input type="number" value="0" min="0" size="2"></b> minutos</td></tr>	
                <tr><td><b>Media de notas: <input type="number" value="0" min="0" size="2"></td></tr>
                <tr>
                    <td><b>Status:
                            <input list="status" name="status_receita" size="8">
                            <datalist id="status">
                                <option value="Disponivel">
                                <option value="Indisponivel">
                            </datalist>
                    </td>
                </tr>
                <tr>
                    <td>
                        <input type="submit" value="Cadastrar">
                        <a href="index.jsp">Cancelar</a>
                    </td>
                </tr>	
            </table>
        </form>		
    </body>
</html>
