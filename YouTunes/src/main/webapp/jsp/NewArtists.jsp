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
    <input type="hidden" name="action" value="artistNew" /> 

            <fieldset>
                <legend>New Artists</legend>
                <label for="firstname">First Name</label>
                <input type="text" id= "firstname" name="firstname"/>
                <label for="lastname">Last Name</label>
                <input type="text" id="lastname" name="lastname"/> 
                <input type="submit" value="submit">
            </fieldset>
        </form>
	<a href="Youtunes?action=artistList">list artists</a>
	
	  <div> <%@include file= "Footer.jsp" %></div>
  	  <div> <%@include file= "Scriptfooter.jsp" %></div>
  
</body>
</html>