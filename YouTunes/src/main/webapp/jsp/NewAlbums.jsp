<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="../css/ytunes.css">

<title>Insert title here</title>

</head>
<body>
<jsp:include page="TopNav.jsp"/>

        <form>
    <input type="hidden" name="action" value="artistAdd" /> 

            <fieldset>
                <legend>New Albums</legend>
                <label for="title">Title</label>
                <input type=text id= "title" name="title"/>
                <label for="price">price</label>
                <input type="text" id="price" name="price"/> 
                
                <label for="genre">Genre</label>
                <input type=text id= "genre" name="genre"/> 
                <label for="img_url">Img Url</label>
                <input type=text id= "img_url" name="img_url"/>
                <label for="ArtistId">ArtistId</label>
                <input type=text id= "ArtistId" name="ArtistId"/>
                
                <input type="submit" value="submit">
            </fieldset>
        </form>
	<a href="Youtunes?action=albumList">list albums</a>
	
	  <div> <%@include file= "Footer.jsp" %></div>
  	  <div> <%@include file= "Scriptfooter.jsp" %></div>
  
</body>
</html>