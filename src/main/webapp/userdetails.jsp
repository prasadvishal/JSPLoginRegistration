<%-- 
    Document   : userdetails
    Created on : Aug 9, 2017, 5:29:29 PM
    Author     : Vishal Prasad
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page session="true" %>
<html>
    <style>
        #userdetailsfieldset{
            color: #0293FF; /* Blue */
            align: center;
            font-variant: small-caps;
            width : 60%;
            margin-left: 20%;
            margin-top: 5%;
        }
        #userdetailsheaderfieldset{
            color: #0293FF; /* Blue */
            align: center;
            font-variant: small-caps;
            width : 60%;
            margin-left: 20%;
            margin-top: 20%;
        }
        #banner {
            position: absolute;
            top: 0px;
            left: 0px;
            right: 0px;
            width: 100%;
            height: 30%;
            z-index: -1;
        }

        #logo {
            position: absolute;
            top: 125px;
            left: 50px;
            right: 0px;
            width: 150px;
            height: 150px;
            z-index: -1;
        }
        #userid{

            font-size: 30px;
            color: #0293FF;
            text-align: center;
            margin-top: -130px;
            position: absolute;
            top: 50%;
            font-variant: small-caps;
            margin-left: 43%;
        }

        #change_status_btn {
            border: none;
            color: white;
            padding: 15px 32px;
            text-align: center;
            position: relative;
            text-decoration: none;
            display: inline-block;
            font-size: 16px;
            background-color: white;
            color: black;
            border: 2px solid #FF2802; 
            border-radius: 8px;
            margin-top: -40%;
            margin-left:85%;
            transition-duration: 0.4s
        }
        #change_status_btn:hover {
            background-color: #FF2802; 
            color: white;
        }
        #change_status_btn:onclick {
            background-color: #FF2802; 
            color: white;  
        }

    </style>
    <!DOCTYPE html>

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <% if ((session.getAttribute("token") == null) && (session.getAttribute("account_type") != "admin")) {
                response.sendRedirect("index.jsp");
            }%>
        <%String userdetailsid = request.getParameter("userdetailsid");
            session.setAttribute("userdetailsid", userdetailsid);%>
        <%Connection con = null;
            ResultSet user_rs = null, personalinfo_rs = null, permanentadd_rs = null, otheradd_rs = null;
            Boolean isAccountActive = true;
            try {
                Class.forName("com.mysql.jdbc.Driver");

                con = DriverManager.getConnection("jdbc:mysql://localhost:3306/testdata", "root", "mindfire");
                user_rs = con.createStatement().executeQuery("select * from users where userid = '" + userdetailsid + "';");
                personalinfo_rs = con.createStatement().executeQuery("select * from personalinfo where userid = '" + userdetailsid + "';");
                permanentadd_rs = con.createStatement().executeQuery("select * from permanentAddress where userid = '" + userdetailsid + "';");
                otheradd_rs = con.createStatement().executeQuery("select * from otherAddress where userid = '" + userdetailsid + "';");%>

        <img id="banner" src="\loginRegistrationResources\homepage_banner.jpg" alt="Banner Image"/>
        <img id ="logo" src ="\loginRegistrationResources\logo.jpg" alt ="Logo Image"/>

        <h1 id="userid">userid: <%=request.getParameter("userdetailsid")%> </h1>

        <fieldset id="userdetailsheaderfieldset" >
            <legend><b> Personal Information </b></legend>
            <%while (user_rs.next()) {%>
            <h3>Name: <%=user_rs.getString("f_name") + " " + user_rs.getString("m_name") + " " + user_rs.getString("l_name")%></h3><br>
            <h4>Email: <%=user_rs.getString("email")%></h4><br>
            <h4>Mobile No: <%=user_rs.getString("mobile_no")%></h4><br>
            <h4>Alternate No.: <%=user_rs.getString("alt_contact_no")%></h4><br>
            <h4>Date Of Birth: <%=user_rs.getString("dob")%></h4><br>
            <h4>Gender: <%=user_rs.getString("gender")%></h4><br>
            <% isAccountActive = user_rs.getBoolean("account_status");%>
            <h4>Account Active: <%=isAccountActive%><%}%></h4><br><br>
        </fieldset>
        <% if (isAccountActive) {%>
        <a href="changeAccountType.jsp" name = "change_status_btn"  id = "change_status_btn" >Deactivate Account</a> 
        <%} else {%><a href="changeAccountType.jsp" name = "change_status_btn"  id = "change_status_btn" >Activate Account</a><%}%>

        <fieldset id="userdetailsfieldset">
            <legend><b> Interests </b></legend>
            <% while (personalinfo_rs.next()) {%>
            <%=personalinfo_rs.getString("userInterests")%> <%};%>
        </fieldset>

        <fieldset id="userdetailsfieldset">
            <legend><b> Current Address </b></legend>
            <% personalinfo_rs = null;
                personalinfo_rs = con.createStatement().executeQuery("select * from personalinfo where userid = '" + userdetailsid + "';");
                while (personalinfo_rs.next()) {%>
            <%=personalinfo_rs.getString("c_address_1") + " " + personalinfo_rs.getString("c_address_2") + " "
                    + personalinfo_rs.getString("c_city") + " "
                    + personalinfo_rs.getString("c_state") + " " + personalinfo_rs.getString("c_country") + " "
                    + personalinfo_rs.getString("c_zipcode")%> <%}%>
        </fieldset>

        <fieldset id="userdetailsfieldset">
            <legend><b> Permanent Address </b></legend>
            <%if (permanentadd_rs != null) {%>
            <% while (permanentadd_rs.next()) {%>
            <%=permanentadd_rs.getString("p_address_1") + " " + permanentadd_rs.getString("p_address_2") + " "
                    + permanentadd_rs.getString("p_city") + " " + permanentadd_rs.getString("p_state") + " "
                    + permanentadd_rs.getString("p_country") + " " + permanentadd_rs.getString("p_zipcode")%> <%}
                    } else {%>
            <%="Same As Current Address"%><%}%>
        </fieldset>

        <fieldset id="userdetailsfieldset">
            <legend><b> Other Address </b></legend>
            <%if (otheradd_rs != null) {%>
            <% while (otheradd_rs.next()) {%>
            <%=otheradd_rs.getString("o_address_1") + " " + otheradd_rs.getString("o_address_2") + " "
                    + otheradd_rs.getString("o_city") + " " + otheradd_rs.getString("o_state") + " "
                    + otheradd_rs.getString("o_country") + " " + otheradd_rs.getString("o_zipcode")%>
            <%}
            } else {%>
            <%="Not Available"%>

        </fieldset>

        <%}
            } catch (Exception e) {
            } finally {
                if (con != null) {
                    con.close();
                }
            }%> 

    </body>
</html>