
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">
<!DOCTYPE html>

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
            width: 100%;
            font-variant: small-caps;
        }
        #login_btn {
            border: none;
            color: white;
            padding: 15px 32px;
            text-align: center;
            text-decoration: none;
            display: inline-block;
            font-size: 16px;
            background-color: white;
            color: black;
            border: 2px solid #0293ff; 
            border-radius: 8px;
            margin-top: 20%;
            margin-left:47%;
            transition-duration: 0.4s
        }
        #login_btn:hover {
            background-color: #0293ff; 
            color: white;
        }
        #login_btn:onclick {
            background-color: #0293ff; 
            color: white;
        }

    </style>
</head>
<body>
    <img id="banner" src="\loginRegistrationResources\success_banner.jpg" alt="Banner Image"/>
    <img id ="logo" src ="\loginRegistrationResources\logo.jpg" alt ="Logo Image"/>
    <h3 id = "welcometext" align="center">Successfully Registered</h3>
    <form action="index.jsp">
        <input type="submit" name = "login" id="login_btn" value = "Login" onclick="index.jsp"><br><br>
    </form>
</body>
</html>
