package youtunes;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import beans.Artist;
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
		          artistAdd(request, response);
		          url = base + "NewArtists.jsp";
		          break;
		        case "artistDetail":
		          artistUpdate(request,response);
		          url = base + "ArtistDetails.jsp";
		          break;
		        case "artistDelete":
		          artistRemove(request, response);
		          url = base + "artistList.jsp";
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
		updateArtist.setid(Long.parseLong(id));
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
		
		//call JdbcArtistDao method remove, passing artistid as parameter
		removeJAD.remove(Long.parseLong(id));
		
		//Print result to user
		System.out.println("The new artist has been added.");
		}	
	}
