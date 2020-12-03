/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DATA;


import ConnectMysql.MySQLConnect;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import DTO.account;

/**
 *
 * @author Admin
 */
public class AccountDAO {
    private  MySQLConnect mySQL = new MySQLConnect();
    public AccountDAO() {
    }
    public ArrayList<account> list()
    {
        ArrayList<account> accl = new ArrayList<>();
        try {
           
            String sql = "SELECT * FROM crew ";
            ResultSet rs = mySQL.executeQuery(sql);
            while(rs.next())
            {
                String id_crew= rs.getString("id_crew");
                String name_crew = rs.getString("name_crew");
                String id_account = rs.getString("id_account");              
                String username = rs.getString("username");
                String img = rs.getString("img");
                String password = rs.getString("password");
                int status_account = rs.getInt("status_account");                
                account acc = new account(id_crew, name_crew, id_account, username, img,password,status_account);
                accl.add(acc);
            }
            rs.close();
            mySQL.disConnect();
            
        } catch (SQLException ex) {
            Logger.getLogger(account.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        return accl;
    }

    public void set(account acc) {
            MySQLConnect mySQL = new MySQLConnect();
            String sql = "UPDATE account SET ";
            sql += "name_crew='"+acc.getCrewName()+"', ";
            sql += "username='"+acc.getUsername()+"', ";
            sql += "password='"+acc.getPassword()+"', ";
            sql += "img='"+acc.getImg()+"', ";
            sql += " WHERE id_crew='"+acc.getId_crew()+"'";
            sql += "status_account='"+acc.getStatus_account()+"' ";
            sql += " WHERE id_account='"+acc.getId_account()+"'";
            System.out.println(sql);
            
            mySQL.executeUpdate(sql);
    }

    public void add(account acc) {
        MySQLConnect mySQL = new MySQLConnect();
         String sql = "INSERT INTO crew VALUES (";
                sql += "'"+acc.getId_crew()+"',";
                sql += "'"+acc.getId_account()+"',";
                sql += "'"+acc.getCrewName()+"',";
                sql += "'"+acc.getUsername()+"',";
                sql += "'"+acc.getPassword()+"',";
                sql += "'"+acc.getImg()+"',";              
                sql += "'1')";
         System.out.println(sql);
         mySQL.executeUpdate(sql);
    }
    
    public void delete(String getId_account)
    {
        MySQLConnect mySQL = new MySQLConnect();
        String sql = "UPDATE crew SET status_account = 0 WHERE id_account='"+getId_account+"'";
        mySQL.executeUpdate(sql);
        System.out.println(sql);
    }
    public void refesh(String getId_account)
    {
        MySQLConnect mySQL = new MySQLConnect();
        String sql = "UPDATE crew SET status_account = 1 WHERE id_account='"+getId_account+"'";
        mySQL.executeUpdate(sql);
        System.out.println(sql);
    }
}
