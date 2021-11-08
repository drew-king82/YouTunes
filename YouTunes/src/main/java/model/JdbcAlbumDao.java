package model;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import beans.Album;

public class JdbcAlbumDao implements AlbumDao{
	JdbcManager db;	
	public JdbcAlbumDao(){		
	db = new JdbcManager();
	}
	
	@Override
	public void add(Album entity){
		//connect to the database
		Connection con=db.getConn();
		Album newAlbum=entity;
		if (con!=null) {
			try {
			  Statement S1=con.createStatement();	
			  String addQuery=
			"insert into album(title, price, genre, url)values('"+newAlbum.gettitle()+"', '"+newAlbum.getprice()+"', '"+newAlbum.getgenre()+"', '"+newAlbum.geturl()+"')";
	
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
	public List<Album> list(){
		Connection con=db.getConn();
		ArrayList<Album> albums=new ArrayList<Album>();
		if(con!=null) {
			try {
				Statement S1=con.createStatement();
				String addQuery=
			"SELECT id, title, price, genre, img url FROM album";
				try {
					ResultSet result =S1.executeQuery(addQuery);
					try {
					while(result.next()) {
						Album newAlbum=new Album();
						newAlbum.setid(result.getLong(1));
						newAlbum.settitle(result.getString(2));
						newAlbum.setprice(result.getDouble(3));
						newAlbum.setgenre(result.getString(4));
						newAlbum.seturl(result.getString(5));
						albums.add(newAlbum);
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
		return albums;
	}

	@Override
	public Album find(Long key){
		Connection con=db.getConn();
		Album newAlbum=null;
		if(con!=null) {
			try {
				Statement S1=con.createStatement();
				String addQuery=
					"SELECT albumid, firstname, lastname FROM album where albumid=" + key;
				try {
					ResultSet result=S1.executeQuery(addQuery);
					try {
						if (result.next()) {
							newAlbum=new Album(result.getString(2), result.getDouble(3), result.getString(4), result.getString(5), result.getLong(6));
									
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
		return newAlbum;
	}

	@Override
	public void update(Album entity){
		Connection con=db.getConn();
		if(con!=null) {
			try {
				Statement S1=con.createStatement();
				String updateQuery= 
						"UPDATE album SET title = '"+ entity.gettitle() + "',price='"+ entity.getprice()+"', genre='"+ entity.getgenre()+"', url='"+ entity.geturl()+"', WHERE albumId = "+ entity.getid();
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
	public void remove(Long key){
		Connection con=db.getConn();
		if(con!=null) {
			try {
				Statement S1=con.createStatement();
				String deleteQuery= 
					"DELETE FROM Album WHERE id='"+key;
				try {
					S1.executeUpdate(deleteQuery);
				} finally {
					S1.close();
				}
			} catch(Exception e) {
				System.out.println(e);
			}
				
			}
	}

	}


