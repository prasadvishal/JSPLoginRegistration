<%-- 
    Document   : adminhome
    Created on : Aug 9, 2017, 3:12:42 PM
    Author     : Vishal Prasad
--%>

<!DOCTYPE html>
<%@ page import="java.sql.*"%>
<%@ page session="true" %>
<html>
    <style>
        #banner {
            position: absolute;
            top: 0px;
            left: 0px;
            right: 0px;
            width: 100%;
            height: 200px;
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

        #welcometext{

            font-size: 48px;
            color: #0293FF;
            text-align: center;
            margin-top: -130px;
            position: absolute;
            top: 50%;
            font-variant: small-caps;
            margin-left: 43%;
        }
        #surveyfieldset{
            color: #0293FF; /* Blue */
            position: absolute;
            font-variant: small-caps;
            top:50%;
            width : 60%;
            left : 20%;
            margin-bottom: 10%;
        }

        #logout_btn {
            border: none;
            color: white;
            padding: 15px 32px;
            text-align: center;
            text-decoration: none;
            display: inline-block;
            font-size: 16px;
            background-color: white;
            color: black;
            border: 2px solid #FF2802; 
            border-radius: 8px;
            margin-top: 16%;
            margin-left:90%;
            transition-duration: 0.4s
        }
        #logout_btn:hover {
            background-color: #FF2802; 
            color: white;
        }
        #logout_btn:onclick {
            background-color: #FF2802; 
            color: white;  
        }

        #submit_btn {
            border: none;
            color: white;
            width: 100%;
            padding: 15px 32px;
            text-align: center;
            text-decoration: none;
            display: inline-block;
            font-size: 16px;
            background-color: white;
            color: black;
            border: 2px solid #0293ff; 
            border-radius: 8px;
            transition-duration: 0.4s
        }
        #submit_btn:hover {
            background-color: #0293ff; 
            color: white;
        }

        input[type="text"] {
            display: block;
            margin-top: 10px;
            margin-left:5%;
            margin-right:7%;
            font-family: sans-serif;
            font-size: 15px;
            color:#0293FF;
            padding: 12px 20px;
            width: 80% ;
        }
        input[type="text"]:focus {
            border: solid 1px blue;
            box-shadow: 0 0 5px 1px #02aaff;
        }
        input[type="number"] {
            display: block;
            margin-top: 10px;
            margin-left:5%;
            margin-right:7%;
            font-family: sans-serif;
            font-size: 15px;
            color:#0293FF;
            padding: 12px 20px;
            width: 80% ;
        }
        input[type="number"]:focus {
            border: solid 1px blue;
            box-shadow: 0 0 5px 1px #02aaff;
        }
        #permanent_country,#permanent_state,
        #current_country,#current_state,
        #other_country, #other_state {
            display: block;
            margin-top: 10px;
            margin-left:5%;
            margin-right:7%;
            font-family: sans-serif;
            font-size: 15px;
            color:#0293FF;
            padding: 12px 20px;
            width: 80% ;
        }
        #current_zipcode_errors, #permanent_zipcode_errors, #other_zipcode_errors{
            display: block;
            text-align: center;
            margin-top: 10px;
            margin-left:5%;
            margin-right:7%;
            font-family: sans-serif;
            font-size: 15px;
            color:#FF0000;
            padding: 12px 20px;
            width: 80% ;
        }
        input[type="number"]:focus {
            border: solid 1px blue;
            box-shadow: 0 0 5px 1px #02aaff;
        }
        fieldset.group  { 
            margin: 0; 
            padding: 0; 
            margin-bottom: 1.25em; 
            padding: .125em; 
        } 

        fieldset.group legend { 
            margin: 0; 
            padding: 0; 
            font-weight: bold; 
            margin-left: 20px; 
            font-size: 100%; 
            color: black; 
        } 


        ul.checkbox  { 
            margin: 0; 
            padding: 0; 
            margin-left: 20px; 
            list-style: none; 
        } 

        ul.checkbox li input { 
            margin-right: .25em; 
        } 

        ul.checkbox li { 
            border: 1px transparent solid; 
        } 

        ul.checkbox li label { 
            margin-left: 20px;
        } 
        ul.checkbox li:hover, 
        ul.checkbox li.focus  { 
            background-color: #96cbff; 
            border: 1px gray solid; 
            width: 12em; 
            transition-duration: 0.3s;
            color: black;
        } 
        ul.checkbox li { 
            border: 1px transparent solid; 
            display:inline-block;
            width:12em;
        }

        #userstable {
            font-family: "Trebuchet MS", Arial, Helvetica, sans-serif;
            border-collapse: collapse;
            width: 100%;
        }

        #userstable td, #customers th {
            border: 1px solid #ddd;
            padding: 8px;
        }

        #userstable tr:nth-child(even){background-color: #f2f2f2;}

        #userstable tr:hover {background-color: #ddd;}

        #userstable th {
            padding-top: 12px;
            padding-bottom: 12px;
            text-align: left;
            background-color: #0293FF;
            color: white;
        }

    </style>
    <head>
        <script type="text/javascript" src="\loginRegistrationResources\countries.js"></script>
    </head>
    <body>
        <% if ((session.getAttribute("token") == null) && (session.getAttribute("account_type") != "admin")) {
                response.sendRedirect("index.jsp");
            }%>
        <img id="banner" src="\loginRegistrationResources\homepage_banner.jpg" alt="Banner Image"/>
        <img id ="logo" src ="\loginRegistrationResources\logo.jpg" alt ="Logo Image"/>
        <h3 id = "welcometext" align="center">Welcome</h3>
        <a href="logout.jsp" name = "logout"  id = "logout_btn" >Logout</a>

        <form name ="useridform" id="useridform" action="userdetails.jsp">
            <input type="hidden" id="hiddenField" name="userdetailsid"/>
        </form>
        <fieldset id="surveyfieldset">
            <legend><b> Users </b></legend>
            <%
                Connection con = null;
                ResultSet rs = null;
                try {
                    Class.forName("com.mysql.jdbc.Driver");
                    con = DriverManager.getConnection("jdbc:mysql://localhost:3306/testdata", "root", "mindfire");
                    rs = con.createStatement().executeQuery("select * from users;");
                    if (rs != null) {
            %>
            <TABLE id="userstable" cellpadding="15" border="1">
                <tr>
                    <th>User Id</th>
                    <th>First Name</th>
                    <th>Middle Name</th>
                    <th>Last Name</th>
                    <th>Email</th>
                    <th>Mobile</th>
                    <th>Alternate No.</th>
                    <th>Date of Birth</th>
                    <th>Gender</th>
                    <th>Account Active</th>
                </tr>
                <%
                    while (rs.next()) {
                %>
                <tr>
                    <td><%=rs.getInt("userid")%></td>
                    <td><%=rs.getString("f_name")%></td>
                    <td><%=rs.getString("m_name")%></td>
                    <td><%=rs.getString("l_name")%></td>
                    <td><%=rs.getString("email")%></td>
                    <td><%=rs.getString("mobile_no")%></td>
                    <td><%=rs.getString("alt_contact_no")%></td>
                    <td><%=rs.getString("dob")%></td>
                    <td><%=rs.getString("gender")%></td>
                    <td><%=rs.getBoolean("account_status")%></td>
                </tr>
                <% }
                        }
                    } catch (SQLException sqle) {
                        out.print("Oops...Something went wrong. SQL Exception: " + sqle);
                    } finally {
                        if (rs != null) {
                            rs.close();
                        }
                    }
                %>

        </fieldset>
    </body>
    <Script language="javascript">
        //    function showdetails() {
        //        session.setAttribute("detailsForUserId","3");
        //        //response.sendRedirect("userdetails.jsp"); 
        //        out.print("User details for userid: "+id);
        //    }
        var table = document.getElementById("userstable");
        if (table != null) {
            for (var i = 0; i < table.rows.length; i++) {
                for (var j = 0; j < table.rows[i].cells.length; j++)
                    table.rows[i].onclick = function () {
                        tableText(this);
                    };
            }
        }

        function tableText(tableCell) {
            //session.setAttribute("userdetailsid",tableCell.cells[0].innerHTML);
            //alert(tableCell.cells[0].innerHTML);
            var v = (tableCell.cells[0].innerHTML);
            document.getElementById("hiddenField").value = v;
            document.forms["useridform"].submit();

        }

    </Script>

</html>
