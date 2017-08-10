<%-- 
    Document   : changeAccountType
    Created on : Aug 9, 2017, 11:57:33 PM
    Author     : Vishal Prasad
--%>
<%@ page import="java.sql.*"%>
<%@ page session="true" %>
<%
    // for checking the session is available or not, if not available it will throw exception, "Session already invalidated."
    Connection con = null;
    ResultSet rs = null;
    Statement st = null;
    String userdetailsid = (String) session.getAttribute("userdetailsid");
    out.print("User Id Received: " + userdetailsid);
//     try{
    Class.forName("com.mysql.jdbc.Driver");
    con = DriverManager.getConnection("jdbc:mysql://localhost:3306/testdata", "root", "mindfire");
    rs = con.createStatement().executeQuery("select * from users where userid=" + userdetailsid + ";");
    if (rs != null) {
        while (rs.next()) {
            if (rs.getBoolean("account_status") == false) {
                st = con.createStatement();
                int r = st.executeUpdate("UPDATE users SET account_status = true WHERE userid = " + userdetailsid + ";");
                response.sendRedirect("adminhome.jsp");
            } else {
                st = con.createStatement();
                int r = st.executeUpdate("UPDATE users SET account_status = false WHERE userid = " + userdetailsid + ";");
                response.sendRedirect("adminhome.jsp");
            }
        }
    }
//    }
//    catch (SQLException sqle){
//        out.print("Oops...Something went wrong. SQL Exception: "+sqle);
//    }
//    finally{
//        if(con != null)
//        con.close();
//        response.sendRedirect("adminhome.jsp");
//    }
%>