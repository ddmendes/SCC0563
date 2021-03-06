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
public class TableViewRecipe implements OverRecipeBuilder {

    private StringBuilder sb;
    
    public TableViewRecipe() {
        sb = new StringBuilder();
        sb.append("<table><tr><th>Categoria</th><th>Receita</th><th>Nota</th></tr>");
    }
    
    @Override
    public void buildPart(Recipe r) {
        if(r.isAvailable()) {
            sb.append("<tr><td>" + r.getCategory() + "</td><td><a href='detalhe_receita.jsp?recipe_id=" + Recipe.getIdOf(r) + "'>" + r.getName() + "</a></td><td>" + r.getGrade() + "</td></tr>");
        }
    }

    @Override
    public String getProduct() {
        return sb.toString().concat("</table>");
    }

}
