<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="beans.Album" %>
<jsp:useBean id="albumDao" scope="application" class="model.JdbcAlbumDao" />   
<!DOCTYPE html>

<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="../css/ytunes.css">

<title>Insert title here</title>

</head>
<body>
<jsp:include page="TopNav.jsp"/>
   <%
   try{
	 String albumid=request.getParameter("albumid");
	 Album album=albumDao.find(Long.parseLong(albumid));
	 if(album!=null){
		 
	
 
 %>

    <form>
    <input type="hidden" name="action" value="updateAlbum" /> 
    <input type="hidden" name="albumid" value="<%=album.getid()%>"/>

             <fieldset>
                <legend>New Albums</legend>
                <label for="title">Title</label>
                <input type=text id= "title" name="title" value="<%=album.gettitle()%>"/>
                <label for="price">price</label>
                <input type="text" id="price" name="price" value="<%=album.getprice()%>"/> 
                
                <label for="genre">Genre</label>
                <input type=text id= "genre" name="genre" value="<%=album.getgenre()%>"/> 
                <label for="img_url">Img Url</label>
                <input type=text id= "img_url" name="img_url" value="<%=album.geturl()%>"/>
                <label for="ArtistId">ArtistId</label>
                <input type=text id= "ArtistId" name="ArtistId" value="<%=album.getArtistid()%>"/>
                
                <input type="submit" value="submit">
            </fieldset>
        </form>
        <%
        }} catch(Exception e){
          System.out.println(e);
        }
        %>

  <div> <%@include file= "Footer.jsp" %></div>
  <div> <%@include file= "Scriptfooter.jsp" %></div>
  
</body>
</html>