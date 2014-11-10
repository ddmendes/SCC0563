/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package beans;

import java.io.Serializable;

/**
 *
 * @author Davi Diório Mendes
 */
public class Ingredient implements Serializable{
    
    private String name;
    private Double amount;
    private String unit;
    
    public Ingredient() {}
    
    public Ingredient(String name, Double amount, String unit) {
        this.name = name;
        this.amount = amount;
        this.unit = unit;
    }
    
    public String getName() {
        return this.name;
    }
    
    public Double getAmount() {
        return this.amount;
    }
    
    public String getUnit() {
        return this.unit;
    }
}
