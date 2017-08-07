package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DbConnection {
    //static String db = "amss";
    static String db = "base_final";
    static String login = "root";
    static String password = "Valeria";
    static String url = "jdbc:mysql://localhost:3306/"+db;
    
    Connection conn = null;
    
    public DbConnection(){
        try{
            Class.forName("com.mysql.jdbc.Driver");
            conn = DriverManager.getConnection(url, login, password);
            if(conn != null){
                System.out.println("Conneting database ["+conn+"] OK");
            }
        }catch(SQLException e){
            System.out.println("Excepcion conexion: "+e.getMessage());
        }catch(ClassNotFoundException e){
            System.out.println("Excepcion driver"+e.getMessage());
        }
    }
    
    public Connection getConnection(){
        return conn;
    }
    
    public void disconnect(){
        System.out.println("Closing database: ["+conn+"] OK");
        if(conn!=null){
            try{
                conn.close();
            }catch(SQLException e){
                System.out.println(e);
            }
        }
    }    
}
