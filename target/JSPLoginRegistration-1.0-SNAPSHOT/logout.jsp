<%-- 
    Document   : logout
    Created on : Aug 2, 2017, 4:39:02 PM
    Author     : Vishal Prasad
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page session="true" %>

<body>
    <%
    // for checking the session is available or not, if not available it will throw exception, "Session already invalidated."
     if (session!= null) {
           session.setAttribute("token",null);
           Cookie cookie = null;
           Cookie[] cookies = null;
         
        // Get an array of Cookies associated with the this domain
        cookies = request.getCookies();
         
        if( cookies != null ) {
           // Cookies Found         
           for (int i = 0; i < cookies.length; i++) {
              cookie = cookies[i];
              cookie.setMaxAge(0);    // Remove Cookies           
           }           
        }
        response.sendRedirect("index.jsp");
     }
    %>


</body>