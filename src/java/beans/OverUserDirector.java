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
public class OverUserDirector {
    
    private final List<User> users;
    
    public OverUserDirector(List<User> users) {
        this.users = users;
    }
    
    public void construct(OverUserBuilder builder) {
        for(User u : users) {
            builder.buildPart(u);
        }
    }
    
}
