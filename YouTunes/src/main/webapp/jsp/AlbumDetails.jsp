<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="beans.Album" %>
<jsp:useBean id="albumDao" scope="application" class="model.JdbcAlbumDao" />   
<!DOCTYPE html>

<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="css/ytunes.css">
<script type = "text/javascript">
let albums = document.getElementById("albums");
albums.onsubmit function()
{
	let albumid=document.getElementById("albumid").value}
    let title=document.getElementById("title").value}
	let price=document.getElementById("price").value}
	let genre=document.getElementById("genre").value}
	let img_url=document.getElementById("img_url").value}
	let ArtistId=document.getElementById("ArtistId").value}
	}
</script>


</head>
<body>
<jsp:include page="TopNav.jsp"/>
   <%
   try{
	 String albumid=request.getParameter("albumid");
	 Album album=albumDao.find(Integer.parseInt(albumid));
	 if(album!=null){
		 
	
 
 %>

    <form id="albums">
    <input type="hidden" name="action" value="updateAlbum" /> 
    <input type="hidden" name="albumid" value="<%=album.getid()%>"/>

             <fieldset>
                <legend>New Albums</legend>
                <label for="albumid">Id</label>
                <input type="text" id="albumid" value="<%=album.getid()%>"/><br/>
                <label for="title">Title</label>
                <input type=text id= "title" name="title" value="<%=album.gettitle()%>"/> <br/>
                <label for="price">price</label>
                <input type="text" id="price" name="price" value="<%=album.getprice()%>"/> <br/>
                
                <label for="genre">Genre</label>
                <input type=text id= "genre" name="genre" value="<%=album.getgenre()%>"/> <br/>
                <label for="img_url">Img Url</label>
                <input type=text id= "img_url" name="img_url" value="<%=album.geturl()%>"/><br/>
                <label for="ArtistId">ArtistId</label>
                <input type=text id= "ArtistId" name="ArtistId" value="<%=album.getArtistid()%>"/> <br/>
                
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