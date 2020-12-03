/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DTO;

/**
 *
 * @author Admin
 */
public class account {
    String id_account;
    String username;
    String password;
    String id_crew;
    String crewName;
    int status_account;
    String img;

    public account() {
        
    }
//Constructor
    public account(String id_account, String username, String password, String id_crew, String crewName,String img, int status_account) {
        this.id_account = id_account;
        this.username = username;
        this.password = password;
        this.id_crew = id_crew;
        this.crewName = crewName;
        this.status_account = status_account;
        this.img = img;
    }

    
//Getter $ Setter
    public String getId_account() {
        return id_account;
    }

    public String getUsername() {
        return username;
    }

    public String getPassword() {
        return password;
    }

    public String getId_crew() {
        return id_crew;
    }

    public String getCrewName() {
        return crewName;
    }

    public int getStatus_account() {
        return status_account;
    }
    public String getImg() {
        return img;
    }

    public void setImg(String img) {
        this.img = img;
    }

    public void setId_account(String id_account) {
        this.id_account = id_account;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public void setId_crew(String id_crew) {
        this.id_crew = id_crew;
    }

    public void setCrewName(String crewName) {
        this.crewName = crewName;
    }

    public void setStatus_account(int status_account) {
        this.status_account = status_account;
    }
    
    
}
