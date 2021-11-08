<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="beans.Artist" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Iterator" %>

<jsp:useBean id="artistDao" scope="application" class="model.JdbcArtistDao" />

<!DOCTYPE html>


<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="css/ytunes.css">

<title>Insert title here</title>
</head>
<body>

<jsp:include page="TopNav.jsp"/>

 <div align="center">
 
        <table border="1">
          <thead>
            <tr>
                <th>ID</th>
                <th>First Name</th>
                <th>Last Name</th>
                <th>Actions</th>
            </tr>
          </thead>
            <% 
            	List<Artist> artists=artistDao.list();
            	Iterator<Artist> iterator=artists.iterator();
            	while (iterator.hasNext()){
            		Artist artist=(Artist)iterator.next();
            		%>
           
            
                <tr>
                    <td><%=artist.getid()%></td>
                    <td><%=artist.getfirstname()%></td>
                    <td><%=artist.getlastname()%></td>
					<td>
					    <a href="YouTunes/Youtunes?action=artistDetail&id=<%=artist.getid()%>">Update</a>
					    <a href="Youtunes?action=artistDelete&id=<%=artist.getid()%>">Update</a>
					    
                </tr>
		<%}%>
        </table>
        
    </div>
    <jsp:include page="Footer.jsp"/>
    <jsp:include page="Scriptfooter.jsp"/>
</body>

</html>