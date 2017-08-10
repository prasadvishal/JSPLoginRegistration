<%-- 
    Document   : signup
    Created on : Aug 1, 2017, 11:57:06 AM
    Author     : Vishal Prasad
--%>

<%@ page import="java.sql.*"%>
<%@ page session="true" %>
<%
    String firstName = request.getParameter("firstName"); 
    String middleName = request.getParameter("middleName");
    String lastName = request.getParameter("lastName");
    String email = request.getParameter("eMail");
    String mobileNo = request.getParameter("mobileNo");
    String password = request.getParameter("pass");
    String altMobileNo = request.getParameter("alternateMobileNo");
    String dob = request.getParameter("dob");
    String gender = request.getParameter("Gender");
   
    Class.forName("com.mysql.jdbc.Driver");
    Connection con = null;
    try{
    con = DriverManager.getConnection("jdbc:mysql://localhost:3306/testdata","root", "mindfire");
    Statement st = con.createStatement();
    ResultSet rs;
    int r = st.executeUpdate("Create table if not exists users ("
            + "userid int not null AUTO_INCREMENT primary key,"
            + "f_name varchar(15) not null,"
            + "m_name varchar(15) ,"
            + "l_name varchar(15) not null,"
            + "email varchar(30) not null ,"
            + "mobile_no varchar(12) not null unique,"
            + "p_word varchar(25) not null,"
            + "alt_contact_no varchar(12),"
            + "dob varchar(15) not null,"
            + "gender varchar(10) not null)");
    out.print(""+r);
    
    r = st.executeUpdate("INSERT INTO users " + "VALUES (null,'"+ firstName + "','"+ middleName +"','"
            + lastName+"','"+email+"','"+mobileNo+"','"+password+"','"+altMobileNo+"','"+
            dob+"','"+gender+"',false,true)");
    out.print(r);
//    rs = st.executeQuery("select * from employee;");
    if (r > 0) {
        
        //session.setAttribute("userid", userid);
        //out.println("welcome " + firstName +" "+" "+lastName);
        //out.println("<a href='logout.jsp'>Log out</a>");
        response.sendRedirect("SucessfulRegistration.jsp");
    } else {
        out.println("Not Matched");
    } 
    }
     catch (SQLException sqle){
        out.print("Oops...Something went wrong. SQL Exception: "+sqle);
    }
    finally{
        if(con != null)
        con.close();
    }   
%>