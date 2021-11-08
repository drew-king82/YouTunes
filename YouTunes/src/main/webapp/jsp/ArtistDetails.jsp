<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="beans.Artist" %>
<jsp:useBean id="artistDao" scope="application" class="model.JdbcArtistDao" />   
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
	 String artistid=request.getParameter("artistid");
	 Artist artist=artistDao.find(Long.parseLong(artistid));
	 if(artist!=null){
		 
	
 
 %>

    <form>
    <input type="hidden" name="action" value="updateArtist" /> 
    <input type="hidden" name="artistid" value="<%=artist.getid()%>"/>
            <fieldset>
                <legend>New Artists</legend>
                <label for="firstname">First Name</label>
                <input type="text" id= "firstname" name="firstname" value="<%=artist.getfirstname()%>"/> <br/>
                <label for="lastname">Last Name</label>
                <input type="text" id="lastname" name="lastname" value="<%=artist.getlastname()%>"/> <br/>
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