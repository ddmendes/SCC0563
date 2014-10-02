/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package model;

import java.util.HashMap;

/**
 *
 * @author Davi Diório Mendes
 */
public class TableViewRecipeRateFiltered implements OverRecipeBuilder {
    
    private final Double floor;
    private final HashMap<Recipe, Integer> rates;
    private final StringBuilder sb;
    
    public TableViewRecipeRateFiltered(Double filter, User user) {
        this.floor = filter;
        this.rates = user.getRatings();
        this.sb = new StringBuilder();
        this.sb.append("<table><tr><th>Categoria</th><th>Receita</th><th>Sua Avaliação</th></tr>");
    }

    @Override
    public void buildPart(Recipe r) {
        Integer rate = rates.get(r);
        if(rate > floor) {
            this.sb.append("<tr><td>" + r.getCategory() + "</td><td>" + r.getName() + "</td><td>" + rate + "</td></tr>");
        }
    }

    @Override
    public String getProduct() {
        return this.sb.toString() + "</table>";
    }
}
