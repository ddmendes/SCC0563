/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package beans;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

/**
 *
 * @author Davi Diório Mendes
 */
public class Recipe implements Serializable{

    
    
    private String name;
    private String category;
    private ArrayList<Ingredient> ingredients;
    private Integer nutritionValue;
    private String tips;
    private Integer cookingTime;
    private Double grade;
    private Integer rateAmount;
    private boolean available;
    private final HashMap<User, String> comments;
    private static final ArrayList<Recipe> recipes = new ArrayList<Recipe>();
    
    public Recipe(String name, String category, ArrayList<Ingredient> ingredients, Integer nutritionValue, String tips, Integer cookingTime, boolean available) {
        this.name = name;
        this.category = category;
        this.ingredients = ingredients;
        this.nutritionValue = nutritionValue;
        this.tips = tips;
        this.cookingTime = cookingTime;
        this.grade = new Double(0.0);
        this.rateAmount = new Integer(0);
        this.available = available;
        this.comments = new HashMap<User, String>();
        Recipe.recipes.add(this);
    }
    
    public String getName() {
        return this.name;
    }
    
    public String getCategory() {
        return this.category;
    }
    
    public List<Ingredient> getIngredients() {
        return this.ingredients;
    }
    
    public Integer getNutritionValue() {
        return this.nutritionValue;
    }
    
    public String getTips() {
        return this.tips;
    }
    
    public Integer getCookingTime() {
        return this.cookingTime;
    }
    
    public Double getGrade() {
        return this.grade;
    }
    
    public boolean isAvailable() {
        return this.available;
    }
    
    public void addRate(Integer r) {
        this.grade = (rateAmount * grade + r.doubleValue()) / (rateAmount + 1);
        this.rateAmount++;
    }
    
    public void addComment(User u, String comment) {
        this.comments.put(u, comment);
    }
    
    public void removeComment(User u) {
        this.comments.remove(u);
    }
    
    public HashMap<User, String> getComments() {
        return this.comments;
    }
    
    public void remove() {
        User.unlinkRecipe(this);
        Recipe.recipes.remove(this);
    }
    
    public static Recipe getRecibeById(int id) {
        return Recipe.recipes.get(id);
    }

    public static String getCategoryNameGradeTableView() {
        TableViewRecipe builder =  new TableViewRecipe();
        new OverRecipeDirector(recipes).construct(builder);
        
        return builder.getProduct();
    }
    
    public static int getIdOf(Recipe r) {
        return Recipe.recipes.indexOf(r);
    }
    
    public static String getManagementTableView() {
        OverRecipeBuilder builder = new TableManagementViewRecipe();
        new OverRecipeDirector(recipes).construct(builder);
        return builder.getProduct();
    }
    
}
