/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package beans;

public class TableViewUser implements OverUserBuilder{
    
    private final StringBuilder sb;
    
    public TableViewUser() {
        sb = new StringBuilder("<table><tr><th>Nome</th><th>Login</th><th>Remover</th></tr>");
    }

    @Override
    public void buildPart(User u) {
        sb.append("<tr><td>").append(u.getName()).append("</td><td>").append(u.getLogin()).append("</td><td><a href='gerenciamento.jsp?rem_user=").append(u.getLogin()).append("'>R</a></td></tr>");
    }

    @Override
    public String getProduct() {
        return sb.toString() + "</table>";
    }
    
}
