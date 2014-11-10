/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package beans;

import java.util.List;

/**
 *
 * @author Davi Diório Mendes
 */
public class OverRecipeDirector {
    
    private final List<Recipe> recipes;
    
    public OverRecipeDirector(List recipes) {
        this.recipes = recipes;
    }
    
    public void construct(OverRecipeBuilder builder) {
        for(Recipe r : recipes) {
            builder.buildPart(r);
        }
    }
}
