<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN"
  "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<jsp:useBean id="AlbumDao" scope="application" class="model.JdbcAlbumDao" />
<%@ page import="beans.Album" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Iterator" %>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
  <title>Welcome</title>
  <link rel="stylesheet" href="/YouTunes/css/ytunes.css" type="text/css"/>

<title> YouTunes</title>
</head>
<body><div>
<%@include file= "TopNav.jsp" %>
</div>

<a href="Youtunes?action=albumadd">New Album</a>

<div align="center">
        <table border="1">
        <tr>
            <% List<Album> albums=AlbumDao.list();
            	int counter=1;
            	Iterator<Album> iterator=albums.iterator();
  
            	while (iterator.hasNext()){
            		Album album=(Album)iterator.next();
            		String image=(album.geturl().toString());
            		if (counter < 4){
            			%>

          		 	<td>
          		 	<img src="<%=image%>" alt="image" height="75" width="75"><br/>
                    <%=album.gettitle()%><br/>
                    $<%=album.getprice()%><br/>
                    <%=album.getgenre()%><br/>
				    <a href="Youtunes?action=albumDetail&albumid=<%=album.getid()%>">Update</a>
				    <a href="Youtunes?action=albumDelete&albumid=<%=album.getid()%>">Delete</a>
					</td>    
		<% counter++; }
		if(counter==4){%>
		</tr><tr> <%
		counter=1;
		}}%>
        </table>
        
    </div>
  <div> <%@include file= "Footer.jsp" %></div>
  <div> <%@include file= "Scriptfooter.jsp" %></div>
</body>
</html>
