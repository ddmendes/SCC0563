/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package model;

/**
 *
 * @author Davi Diório Mendes
 */
public class Ingredient {
    
    private String name;
    private Double amount;
    private String unit;
    
    public Ingredient(String name, Double amount, String unit) {
        this.name = name;
        this.amount = amount;
        this.unit = unit;
    }
}
