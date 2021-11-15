package model;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import beans.Artist;

public class JdbcArtistDao implements ArtistDao{
	JdbcManager db;	
	public JdbcArtistDao(){		
	db = new JdbcManager();
	}
	
	@Override
	public void add(Artist entity){
		//connect to the database
		Connection con=db.getConn();
		Artist newArtist=entity;
		if (con!=null) {
			try {
			  Statement S1=con.createStatement();	
			  String addQuery=
			"insert into artist(firstname, lastname)values('"+newArtist.getfirstname()+"', '"+newArtist.getlastname()+"')";
	
			try {
				S1.executeUpdate(addQuery);
			}
			finally {
				S1.close();
			}
			}
			catch(Exception e) {
				System.out.println(e);
			}
				
			}
	}

	@Override
	public List<Artist> list(){
		Connection con=db.getConn();
		ArrayList<Artist> artists=new ArrayList<Artist>();
		if(con!=null) {
			try {
				Statement S1=con.createStatement();
				String addQuery=
			"SELECT artistid, firstname, lastname FROM artist";
				try {
					ResultSet result =S1.executeQuery(addQuery);
					try {
					while(result.next()) {
						Artist newArtist=new Artist();
						newArtist.setid(result.getInt(1));
						newArtist.setfirstname(result.getString(2));
						newArtist.setlastname(result.getString(3));
						artists.add(newArtist);
					}}
				finally {
					result.close();
				}}
				finally {
					S1.close();
				}}
				catch (Exception e) {
					System.out.println(e);
				}
			finally {
				db.closeConn(con);
			}}
		return artists;
	}

	@Override
	public Artist find(Integer key){
		Connection con=db.getConn();
		Artist newArtist=null;
		if(con!=null) {
			try {
				Statement S1=con.createStatement();
				String addQuery=
					"SELECT artistid, firstname, lastname FROM artist where artistid=" + key;
				try {
					ResultSet result=S1.executeQuery(addQuery);
					try {
						if (result.next()) {
							newArtist=new Artist(result.getInt(1),result.getString(2), result.getString(3));
									
						}
					} finally { 
						result.close();
					}
					
				} finally {
					S1.close();
				} 
			} catch (Exception e) {
				System.out.println(e);
			} 
		}
		return newArtist;
	}

	@Override
	public void update(Artist entity){
		Connection con=db.getConn();
		if(con!=null) {
			try {
				Statement S1=con.createStatement();
				String updateQuery= 
						"UPDATE artist SET firstname = '"+ entity.getfirstname() + "',lastname='"+ entity.getlastname()+"' WHERE artistid = "+ entity.getid();
				try {
					S1.executeUpdate(updateQuery);
				} finally {
					S1.close();
				} 
			} catch (Exception e) {
					System.out.println(e);
				} 
					
				}
				
			}

	@Override
	public void remove(Integer key){
		Connection con=db.getConn();
		if(con!=null) {
			try {
				Statement S1=con.createStatement();
				Statement S2=con.createStatement();
				
				String deleteQuery= 
					"DELETE FROM Artist WHERE artistid="+key;
				String deleteQuery2=
				    "DELETE FROM Album WHERE artistid="+key;
				try {
				    S2.executeUpdate(deleteQuery2);
					S1.executeUpdate(deleteQuery);
				} finally {
					S1.close();
					S2.close();
				}
			} catch(Exception e) {
				System.out.println(e);
			}
				
			}
	}

	}


