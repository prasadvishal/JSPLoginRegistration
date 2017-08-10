<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <%@ page session="true" %>
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
            width: 100%;
            font-variant: small-caps;
        }

        #errormsg{

            font-size: 48px;
            color: #ff0202 ;
            text-align: center;
            margin-top: -80px;
            position: absolute;
            top: 50%;
            width: 100%;
            font-size: small;
            font-variant: small-caps;
        }

        #loginfieldset{
            color: #0293FF; /* Blue */
            align: center;
            position: absolute;
            font-variant: small-caps;
            top:50%;
            width : 20%;
            left : 40%;	
        }

        input[type="text"] {
            display: block;
            margin-top: 10;
            width: 100%;
            font-family: sans-serif;
            font-size: 15px;
            color:#0293FF;
        }
        input[type="text"]:focus {
            border: solid 1px blue;
            box-shadow: 0 0 5px 1px #02aaff;
        }


        input[type="Password"] {
            display: block;
            margin-top: 10;
            width: 100%;
            font-family: sans-serif;
            font-size: 15px;
            color:#0293FF;
        }
        input[type="Password"]:focus {
            border: solid 1px blue;
            box-shadow: 0 0 5px 1px #02aaff;
        }

        #login_btn {
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
        #login_btn:hover {
            background-color: #0293ff; 
            color: white;
        }

        #signup_btn{
            border: none;
            color: white;
            width: 50%;
            padding: 15px 32px;
            text-align: center;
            display: inline-block;
            font-size: 12px;
            background-color: white;
            color: black;
            border-radius: 8px;
            transition-duration: 0.4s;
            align-content: center;
        }
        #signup_btn:hover {
            background-color: #0293ff; 
            color: white;
        }

    </style>
</head>
<body>
    <% if (session.getAttribute("token") != null) {
            response.sendRedirect("userhome.jsp");
        } else if (session.getAttribute("error_msg") == null) {
            session.setAttribute("error_msg", "");
        }
    %>
    <img id="banner" src="\loginRegistrationResources\login_banner.jpg" alt="Banner Image"/>
    <img id ="logo" src ="\loginRegistrationResources\logo.jpg" alt ="Logo Image"/>
    <h3 id = "welcometext" align="center">Welcome To MySite</h3>
    <h6 id = "errormsg" align="center"><%= session.getAttribute("error_msg")%></h6>

    <fieldset id="loginfieldset">
        <legend><b> Login </b></legend>
        <form name="loginform" id="loginform" action="login.jsp" method="get">
            <br>Email/Mobile No.:<br>
            <input type="text" name="login_username" id="login_username" ><br><br>
            Password:<br>
            <input type="Password" name="login_password" id="login_password"><br><br>

            <input type="button" name = "login" id="login_btn" value = "Login" onclick="javascript:validateForm();"><br><br>

            <a href="signupPage.jsp" name = "signup"  id = "signup_btn" >Sign Up</a>

        </form>
    </fieldset>

    <Script language="javascript">

        var isErr = false;

        function validateForm() {
            if (login_username.value == "") {
                isErr = true;
                login_username.setCustomValidity("Please Enter Email/Mobile No.");
                //login_username.focus();

            } else if (login_password.value == "") {
                isErr = true;
                login_password.setCustomValidity("Please Enter Password.");
                //login_password.focus();		
            }
            if (!isErr) {
                debugger;
                //document.getElementById(form).submit();
                document.forms["loginform"].submit();

                return true;
            }
            return false;
        }

    </Script>

</body>
</html>