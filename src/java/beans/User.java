/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package beans;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.HashMap;

/**
 *
 * @author Davi Diório Mendes
 */
public class User implements Serializable{
    private String name;
    private String city;
    private String state;
    private String phone;
    private String login;
    private String passwd;
    private HashMap<Recipe, Integer> ratings;
    private HashMap<Recipe, String> comments;
    private ArrayList<Recipe> recipes;
    private static HashMap<String, User> users = new HashMap<String, User>();
    
    public User() {}
    
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
    
    public void setName(String name){
        this.name = name;
    }
    
    public String getCity() {
        return this.city;
    }
    
    public void setCity(String city){
        this.city = city;
    }
    
    public String getState() {
        return this.state;
    }
    
    public void setState(String state){
        this.state = state;
    }
    
    public String getPhone() {
        return this.phone;
    }
    
    public void setPhone(String phone){
        this.phone = phone;
    }
    
    public String getLogin() {
        return this.login;
    }
    
    public void setLogin(String login){
        users.remove(this.login);
        this.login = login;
        users.put(login, this);
        
    }
    
    public void setPasswd(String actPasswd, String newPasswd) {
        if(checkPasswd(actPasswd)) {
            this.passwd = newPasswd;
        }
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
    
    public static String getUserTableView() {
        OverUserBuilder builder = new TableViewUser();
        new OverUserDirector(new ArrayList<User>(users.values())).construct(builder);
        return builder.getProduct();
    }
    
    public static void remove(String login) {
        User u = users.get(login);
        if(u != null) {
            //remove comments
            for(Recipe r : u.comments.keySet()) {
                r.removeComment(u);
            }
            for(Recipe r : u.recipes) {
                r.remove();
            }
            users.remove(login);
        }
    }
    
    public static void unlinkRecipe(Recipe r) {
        for(User u : users.values()) {
            u.recipes.remove(r);
            u.ratings.remove(r);
            u.comments.remove(r);
        }
    }
}
