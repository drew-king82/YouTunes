package model;
import java.sql.Connection;
import java.sql.DriverManager;

public class JdbcManager {
  private String jdbcUrl = "jdbc:mysql://localhost:3306/YouTunes?useSSL=false";
  private String jdbcUserName = "youtunes_user";
  private String jdbcPassword = "music";
  
  public JdbcManager() {
  
  try {
	  Class.forName("com.mysql.jdbc.Driver");  
  }
  catch(Exception e) {
	  System.out.println(e);
  }
  }
  public Connection getConn() {
	  Connection Conn=null;
	  try {
		  Conn=DriverManager.getConnection(jdbcUrl, jdbcUserName, jdbcPassword);
		  
	  }
	  catch (Exception e){
		  System.out.println(e);
	  }
	  return Conn;
  }
  public void closeConn(Connection Conn) {
	  try {
		  Conn.close();
	  }
	  catch(Exception e) {
		  System.out.println(e);
	  }
  }
}
