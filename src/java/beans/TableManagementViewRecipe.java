/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package beans;

/**
 *
 * @author Davi Diório Mendes
 */
public class TableManagementViewRecipe implements OverRecipeBuilder{

    private final StringBuilder sb;
    
    public TableManagementViewRecipe() {
        sb = new StringBuilder("<table><tr><th>Categoria</th><th>Receita</th><th>Avaliação Média</th><th>Status</th><th>Editar</th><th>Remover</th></tr>");
    }
    
    @Override
    public void buildPart(Recipe r) {
        int rId = Recipe.getIdOf(r);
        sb.append("<tr><td>").append(r.getCategory()).append("</td><td>").append(r.getName()).append("</td><td><progress max='5' value='").append(r.getGrade()).append("'></progress>").append(r.getGrade()).append("</td><td>");
        sb.append((r.isAvailable()) ? "Ativa" : "Inativa").append("</td><td><a href='cadastro_receitas.jsp?edit=").append(rId).append("'>E</a></td><td><a href='gerenciamento.jsp?rem_rec=").append(rId).append("'>R</a></td></tr>");
    }

    @Override
    public String getProduct() {
        return sb.append("</table>").toString();
    }

}
