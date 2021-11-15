package youtunes;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import beans.Album;
import beans.Artist;
import model.JdbcAlbumDao;
import model.JdbcArtistDao;

/**
 * Servlet implementation class Youtunes
 */
@WebServlet("/Youtunes/*")
public class Youtunes extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Youtunes() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(request,response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request,
		      HttpServletResponse response) throws ServletException, IOException {
		    String base = "/jsp/";
		    String url = base + "Index.jsp";
		    String action = request.getParameter("action");
		    if (action != null) {
		        switch (action) {
		        case "artistList":
		          url = base + "artistList.jsp";
		          break;
		        case "artistAdd":
		        url = base + "NewArtists.jsp";
		          break;
		        case "artistUpdate":
		          artistUpdate(request,response);
		          url = base + "artistList.jsp";
		          break;
		        case "artistDetail":
			      url = base + "ArtistDetails.jsp";
			      break;
		        case "artistNew":
		          artistAdd(request, response);
			      url = base + "artistList.jsp";
			      break;
		        case "artistDelete":
		          artistRemove(request, response);
		          url = base + "artistList.jsp";
		          break;
		        case "albumlist":
			      url = base + "Index.jsp";
			      break;
		        case "albumadd":
			      url = base + "NewAlbums.jsp";
			      break;
		    	case "albumNew":
		    	  albumAdd(request,response);
		    	  url = base + "index.jsp";
		    	  break;
		        case "updateAlbum":
		          albumUpdate(request, response);
			      url = base + "Index.jsp";
			      break;
		        case "albumDetail":
				  url = base + "AlbumDetails.jsp";
				  break;
		        case "albumDelete":
		          albumDelete(request, response);
			      url = base + "Index.jsp";
			      break;
		        case "About":
			      url = base + "About.jsp";
			      break;
		        case "ContactUs":
			      url = base + "ContactUs.jsp";
			      break;
		        }
		      }
		    RequestDispatcher requestDispatcher =
		    	      getServletContext().getRequestDispatcher(url);
		    	    requestDispatcher.forward(request, response);
		    	    }
	
	private void artistUpdate(HttpServletRequest request, HttpServletResponse response) throws ServletException,IOException{
		//define fields
		String id= request.getParameter("artistid"); 
		String firstname= request.getParameter("firstname");
		String lastname= request.getParameter("lastname");
		
		//create new artist object
		Artist updateArtist=new Artist();
		updateArtist.setid(Integer.parseInt(id));
		updateArtist.setfirstname(firstname);
		updateArtist.setlastname(lastname);
		
	
		//create new JdbcArtistDao object
		JdbcArtistDao updateJAD=new JdbcArtistDao();
		
		//Call JdbcArtistDao update method, passing artist object as parameter
		updateJAD.update(updateArtist);
		
		//Print result to user
		System.out.println("The artist has been updated.");
		}

		private void artistAdd(HttpServletRequest request, HttpServletResponse response) throws ServletException,IOException{
		//define fields
		
		String firstname= request.getParameter("firstname");
		String lastname= request.getParameter("lastname");	
			
		//create new JdbcArtistDao object
		JdbcArtistDao addJAD=new JdbcArtistDao();
		
		//Create a new Artist object, using first and last name defined in fields
		Artist addArtist= new Artist(firstname, lastname);
				
		//call JdbcArtistDao add method, passing Artist object as parameter
		addJAD.add(addArtist);
		
		//Print result to user
		System.out.println("The new artist has been added.");
		}

		private void artistRemove(HttpServletRequest request, HttpServletResponse response) throws ServletException,IOException{
		//define field to identify artist
		String id= request.getParameter("artistid"); 
		
				
		//create JdbcArtistDao object
		JdbcArtistDao removeJAD=new JdbcArtistDao();
		
		//call JdbcArtistDao method remove, passing id as parameter
		removeJAD.remove(Integer.parseInt(id));
		
		//Print result to user
		System.out.println("The new artist has been deleted.");
		}	
		
		private void albumUpdate(HttpServletRequest request, HttpServletResponse response) throws ServletException,IOException{
			//define fields
			String id= request.getParameter("albumid"); 
			String title= request.getParameter("title");
			String price= request.getParameter("price");
			String genre= request.getParameter("genre");
			String url= request.getParameter("img_url");
			String artistid= request.getParameter("artistid");
			
			//create new album object
			Album updateAlbum=new Album();
			updateAlbum.setid(Integer.parseInt(id));
			updateAlbum.settitle(title);
			updateAlbum.setprice(Double.parseDouble(price));
			updateAlbum.setgenre(genre);
			updateAlbum.seturl(url);
			updateAlbum.setArtistid(Integer.parseInt(artistid));
		
			//create new JdbcAlbumDao object
			JdbcAlbumDao updateJAD=new JdbcAlbumDao();
			
			//Call JdbcAlbumDao update method, passing artist object as parameter
			updateJAD.update(updateAlbum);
			
			//Print result to user
			System.out.println("The album has been updated.");
			}

		private void albumAdd(HttpServletRequest request, HttpServletResponse response) throws ServletException,IOException{
			//define fields
			
			String title= request.getParameter("title");
			Double price= Double.parseDouble(request.getParameter("price"));
			String genre= request.getParameter("genre");
			String url= request.getParameter("url");
			Integer artistid= Integer.parseInt(request.getParameter("artistid"));
				
			//create new JdbcAlbumDao object
			JdbcAlbumDao addJAD=new JdbcAlbumDao();
			
			//Create a new Artist object, using first and last name defined in fields
			Album addAlbum= new Album(title, price, genre, url, artistid);
					
			//call JdbcAlbumDao add method, passing Artist object as parameter
			addJAD.add(addAlbum); 
			//Print result to user
			System.out.println("The new album has been added.");
			}

			private void albumDelete(HttpServletRequest request, HttpServletResponse response) throws ServletException,IOException{
			//define field to identify album
			String id= request.getParameter("albumid"); 
			
					
			//create JdbcAlbumDao object
			JdbcAlbumDao removeJAD=new JdbcAlbumDao();
			
			//call JdbcAlbumDao method remove, passing albumid as parameter
			removeJAD.remove(Integer.parseInt(id));
			
			//Print result to user
			System.out.println("The new album has been deleted.");
			}
	}
