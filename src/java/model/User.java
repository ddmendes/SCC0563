/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package model;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

/**
 *
 * @author Davi Diório Mendes
 */
public class User {
    private String name;
    private String city;
    private String state;
    private String phone;
    private String login;
    private String passwd;
    private final HashMap<Recipe, Integer> ratings;
    private final HashMap<Recipe, String> comments;
    private final ArrayList<Recipe> recipes;
    private final static HashMap<String, User> users = new HashMap<String, User>();
    
    public User(String name, String city, String state, String phone, String login, String passwd) {
        this.name   = name;
        this.city   = city;
        this.state  = state;
        this.phone  = phone;
        this.login  = login;
        this.passwd = passwd;
        this.recipes = new ArrayList<Recipe>();
        this.ratings = new HashMap<Recipe, Integer>();
        this.comments = new HashMap<Recipe, String>();
        User.users.put(this.login, this);
    }
    
    public String getName() {
        return this.name;
    }
    
    public String getCity() {
        return this.city;
    }
    
    public String getState() {
        return this.state;
    }
    
    public String getPhone() {
        return this.phone;
    }
    
    public String getLogin() {
        return this.login;
    }
    
    public boolean checkPasswd(String passwd) {
        return this.passwd.equals(passwd);
    }
    
    public static boolean checkAvailableLogin(String login) {
        return User.users.get(login) == null;
    }
    
    public static User getUser(String login) {
        return User.users.get(login);
    }
    
    public boolean addRecipe(Recipe r) {
        return this.recipes.add(r);
    }
    
    public String getMyRecipesTableView() {
        OverRecipeBuilder builder = new TableViewRecipe();
        new OverRecipeDirector(recipes).construct(builder);
        return builder.getProduct();
    }
    
    public String getRecipesILikeOverThreeTableView() {
        OverRecipeBuilder builder = new TableViewRecipeRateFiltered(new Double(3.0), this);
        new OverRecipeDirector(new ArrayList(this.ratings.keySet())).construct(builder);
        return builder.getProduct();
    }
    
    public void addComment(Recipe r, String comment) {
        this.comments.put(r, comment);
    }
    
    public void addRating(Recipe r, Integer rate) {
        this.ratings.put(r, rate);
    }
    
    public HashMap<Recipe, Integer> getRatings() {
        return this.ratings;
    }
    
}
