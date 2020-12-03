/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package BUS;

import DTO.account;
import DATA.AccountDAO;
import java.util.ArrayList;

/**
 *
 * @author Admin
 */
public class AccountBUS {
    public ArrayList<account> accl ;
    public AccountBUS(int i)
    {
        listAccount();
    }
    
    public AccountBUS()
    {
        
    }
    public account get(String id_account)
    {
        for(account acc : accl )
        {
            if(acc.getId_account().equals(id_account))
            {
                return acc;
            }
        }
        return null;
    }
    public void listAccount()
    {
        AccountDAO crewDAO = new AccountDAO();
        accl = new ArrayList<>();
        accl = crewDAO.list();
    }
    public void addACCOUNT(account a)
    {
        accl.add(a);
        AccountDAO accountDAO = new AccountDAO();
        accountDAO.add(a);
    }

    public void deleteACCOUNT(String id_account)
    {
        for(account acc : accl )
        {
            if(acc.getId_account().equals(id_account))
            {
                accl.remove(acc);
                AccountDAO accountDAO = new AccountDAO();
                accountDAO.delete(id_account);
                return;
            }
        }
    }
    public void refeshCREW(String id_account)
    {
        for(account acc : accl )
        {
            if(acc.getId_account().equals(id_account))
            {
                accl.remove(acc);
                AccountDAO accountDAO = new AccountDAO();
                accountDAO.refesh(id_account);
                return;
            }
        }
    }
    public void setCREW(account s)
    {
        for(int i = 0 ; i < accl.size() ; i++)
        {
            if(accl.get(i).getId_account().equals(s.getId_account()))
            {
                accl.set(i, s);
                AccountDAO accDAO = new AccountDAO();
                accDAO.set(s);
                return;
            }
        }
    }
    public boolean check(String id_account)
    {
        for(account acc : accl)
        {
            if(acc.getId_account().equals(id_account))
            {
                return true;
            }
        }
        return false;
    }
    public ArrayList<account> search(String id_account,String id_crew,String crewName,String username,String password)
    {
        ArrayList<account> search = new ArrayList<>();
        id_account = id_account.isEmpty()?id_account = "": id_account;
        id_crew = id_crew.isEmpty()?id_crew = "": id_crew;
        crewName = crewName.isEmpty()?crewName = "": crewName;
        username = username.isEmpty()?username = "": username;
        password = password.isEmpty()?password = "": password;
        for(account acc : accl)
        {
            if( acc.getId_account().contains(id_account) && 
                acc.getId_crew().contains(id_crew) &&  
                acc.getCrewName().contains(crewName) &&
                acc.getUsername().contains(username) &&
                acc.getPassword().contains(password))
            {
                search.add(acc);
            }
        }
        return search;
    }
    public ArrayList<account> getList() {
        listAccount();
        return accl;
    }

   
}
