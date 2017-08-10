<%-- 
    Document   : addPersonalInfo
    Created on : Aug 4, 2017, 12:39:29 PM
    Author     : Vishal Prasad
--%>

<%@ page import="java.sql.*"%>
<%@ page session="true" %>
<% if ((session.getAttribute("token") == null) && (session.getAttribute("account_type") != "user")) {
         response.sendRedirect("index.jsp");
     }%>
<%
    String[] userInterest = request.getParameterValues("userInterestsCb");
    String c_address_1 = request.getParameter("c_address_1");
    String c_address_2 = request.getParameter("c_address_2");
    String c_country = request.getParameter("current_country");
    String c_state = request.getParameter("current_state");
    String c_city = request.getParameter("current_city");
    String c_zipcode = request.getParameter("current_zipcode");

    String userInterests = "";
    if (userInterest != null) {
        for (int i = 0; i < userInterest.length; i++) {
            userInterests = userInterests + "    " + userInterest[i];
        }
    }

    String samePermanentAdd = request.getParameter("samePermanentAddCb");

    String p_address_1 = request.getParameter("p_address_1");
    String p_address_2 = request.getParameter("p_address_2");
    String p_country = request.getParameter("permanent_country");
    String p_state = request.getParameter("permanent_state");
    String p_city = request.getParameter("permanent_city");
    String p_zipcode = request.getParameter("permanent_zipcode");

    String noOtherAdd = request.getParameter("noOtherAddCb");

    String o_address_1 = request.getParameter("o_address_1");
    String o_address_2 = request.getParameter("o_address_2");
    String o_country = request.getParameter("other_country");
    String o_state = request.getParameter("other_state");
    String o_city = request.getParameter("other_city");
    String o_zipcode = request.getParameter("other_zipcode");

    Class.forName("com.mysql.jdbc.Driver");

    Connection con = null;

    try {
        con = DriverManager.getConnection("jdbc:mysql://localhost:3306/testdata", "root", "mindfire");
        Statement st = con.createStatement();
        ResultSet rs;
        int r = st.executeUpdate("Create table if not exists personalInfo ("
                + "userid int not null primary key,"
                + "userInterests varchar(250),"
                + "c_address_1 varchar(100) not null,"
                + "c_address_2 varchar(100) not null,"
                + "c_country varchar(50) not null,"
                + "c_state varchar(50) not null,"
                + "c_city varchar(50) not null,"
                + "c_zipcode varchar(10) not null,"
                + "hasSamePermanentAddress boolean not null,"
                + "hasOtherAddress boolean not null)");

        r = st.executeUpdate("Create table if not exists permanentAddress ("
                + "userid int not null primary key,"
                + "p_address_1 varchar(100) not null,"
                + "p_address_2 varchar(100) not null,"
                + "p_country varchar(50) not null,"
                + "p_state varchar(50) not null,"
                + "p_city varchar(50) not null,"
                + "p_zipcode varchar(10) not null)");

        r = st.executeUpdate("Create table if not exists otherAddress ("
                + "userid int not null primary key,"
                + "o_address_1 varchar(100) ,"
                + "o_address_2 varchar(100) ,"
                + "o_country varchar(50) ,"
                + "o_state varchar(50),"
                + "o_city varchar(50) ,"
                + "o_zipcode varchar(10))");

        rs = con.createStatement().executeQuery("select * from personalInfo where userid='" + session.getAttribute("userid") + "';");
        while (rs.next()) {
            out.print("Index 1: " + rs.getString(1));
        }

//    if(rs==null) { 
//        
        if (samePermanentAdd == null) {
            r = st.executeUpdate("INSERT INTO personalInfo " + "VALUES ('" + session.getAttribute("userid") + "','" + userInterests + "','" + c_address_1 + "','"
                    + c_address_2 + "','" + c_country + "','" + c_state + "','" + c_city + "','" + c_zipcode + "',false,true)");
            out.print(r);

            r = r = st.executeUpdate("INSERT INTO permanentAddress " + "VALUES ('" + session.getAttribute("userid") + "','" + p_address_1 + "','"
                    + p_address_2 + "','" + p_country + "','" + p_state + "','" + p_city + "','" + p_zipcode + "')");
            out.print(r);
        } else {
            r = st.executeUpdate("INSERT INTO personalInfo " + "VALUES ('" + session.getAttribute("userid") + "','" + userInterests + "','" + c_address_1 + "','"
                    + c_address_2 + "','" + c_country + "','" + c_state + "','" + c_city + "','" + c_zipcode + "',true,true)");
            out.print(r);

        }

        r = st.executeUpdate("INSERT INTO otherAddress " + "VALUES ('" + session.getAttribute("userid") + "','" + o_address_1 + "','"
                + o_address_2 + "','" + o_country + "','" + o_state + "','" + o_city + "','" + o_zipcode + "')");
        out.print(r);
//    }else{
//        //todo : Redirect to already registered/edit response page
//    }
//    rs = st.executeQuery("select * from employee;");
        if (r > 0) {

            //session.setAttribute("userid", userid);
            //out.println("welcome " + firstName +" "+" "+lastName);
            //out.println("<a href='logout.jsp'>Log out</a>");
            response.sendRedirect("SucessfulRegistration.jsp");
        } else {
            //out.println("Not Matched");
        }
    } catch (SQLException sqle) {
        out.print("Oops...Something went wrong. SQL Exception: " + sqle);
    } finally {
        if (con != null) {
            con.close();
        }
    }
%>