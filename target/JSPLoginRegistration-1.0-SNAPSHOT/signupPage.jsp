<%-- 
    Document   : signupPage
    Created on : Jul 28, 2017, 3:07:37 PM
    Author     : Vishal Prasad
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page session="true" %>
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

#signupForm{
	color: #0293FF; /* Blue */
	align: center;
	position: absolute;
	font-variant: small-caps;
	top:50%;
	width : 30%;
	left : 35%;	
	margin-bottom: 100px;
}

input[type="text"] {
  display: block;
  margin-top: 10;
  font-family: sans-serif;
  font-size: 15px;
  color:#0293FF;
  padding: 12px 20px;
  argin: 8px 0;
}
input[type="text"]:focus {
  border: solid 1px blue;
  box-shadow: 0 0 5px 1px #02aaff;
}


input[type="Password"] {
  display: block;
  margin-top: 10;
  font-family: sans-serif;
  font-size: 15px;
  color:#0293FF;
  padding: 12px 20px;
  margin: 8px 0;
}
input[type="Password"]:focus {
  border: solid 1px blue;
  box-shadow: 0 0 5px 1px #02aaff;
}

input[type="number"] {
  display: block;
  margin-top: 10;
  font-family: sans-serif;
  font-size: 15px;
  color:#0293FF;
  padding: 12px 20px;
  margin: 8px 0;
}
input[type="number"]:focus {
  border: solid 1px blue;
  box-shadow: 0 0 5px 1px #02aaff;
}

input[type="date"] {
  display: block;
  margin-top: 10;
  font-family: sans-serif;
  font-size: 15px;
  color:#0293FF;
  padding: 12px 20px;
  margin: 8px 0;
}
input[type="date"]:focus {
  border: solid 1px blue;
  box-shadow: 0 0 5px 1px #02aaff;
}

input[type="radio"]{
  width     : 2em;
  margin    : 0;
  padding   : 10px;
  font-size : 1em;
}

#submit_btm {
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
    transition-duration: 0.4s
}
#submit_btm:hover {
    background-color: #0293ff; 
    color: white;
}

#reset_btn{
	border: none;
    color: white;
    padding: 15px 32px;
    text-align: center;
    display: inline-block;
    font-size: 12px;
	background-color: white;
    color: black;
	border-radius: 8px;
	transition-duration: 0.4s
}
#reset_btn:hover {
    background-color: #0293ff; 
    color: white;
}

</style>
</head>
<body>
	<img id="banner" src="\loginRegistrationResources\online_register_banner.jpg" alt="Banner Image"/>
	<img id ="logo" src ="\loginRegistrationResources\logo.jpg" alt ="Logo Image"/>
	<h3 id = "welcometext" align="center">Register with MySite</h3>
	<fieldset id="signupForm">
            <legend><b> Registration </b></legend>
    <form name="signupForm" id="form" action="signup.jsp" method="get">
    <table align="center" cellpadding="5" cellspacing="0">
        <tr>
            <td>First Name:</td>
            <td><input type="text" name="firstName" id="firstName" placeholder="required"></td>
        </tr>
		 <tr>
            <td>Middle Name:</td>
            <td><input type="text" name="middleName" id="middleName" placeholder="optional"></td>
        </tr>
        <tr>
            <td>Last Name:</td>
            <td><input type="text" name="lastName" id="lastName" placeholder="required"></td>
        </tr>
		<tr>
            <td>Email:</td>
            <td><input type="text" name="eMail" id="eMail" placeholder="required"></td>
        </tr>
		<tr>
            <td>Mobile No:</td>
            <td><input type="number" name="mobileNo" id="mobileNo" placeholder="required"></td>
        </tr>
        <tr>
            <td>Password:</td>
            <td><input type="password" name="pass" id="pass" placeholder="atleast 6 characters."></td>
        </tr>
		<tr>
            <td>Confirm Password:</td>
            <td><input type="password" name="cnfrmpass" id="cnfrmpass" placeholder="required"></td>
        </tr>
		<tr>
            <td>Alternate Contact No:</td>
            <td><input type="number" name="alternateMobileNo" id="alternateMobileNo" placeholder="optional"></td>
        </tr>
       
        <tr>
            <td>DOB:</td>
            <td><input type="date" name="dob" id="dob" placeholder="required"></td>
        </tr>
		<tr>
			<td></td>
		</tr>
        <tr>
            <td>Gender:</td>
            <td><input type="radio" name="Gender" value="Male" checked="checked">Male
                <input type="radio" name="Gender" value="Female">Female
            </td>
        </tr>
		<tr>
			<td></td>
		</tr>
		<tr>
			<td></td> 
		</tr>
        <tr>
            <td>
                <input type="button" value="Submit" id="submit_btm" onclick="javascript:validateForm();">
            </td>
            <td>    
                <input type="Reset" value="Reset" id="reset_btn">
            </td>
        </tr>
    </table>
</form>
	</fieldset>

	<Script language="javascript">

    var isErr = false;

    function validateForm() {
        if (firstName.value == "") {
            isErr = true;
            alert("Please enter your first name");
            firstName.focus();
			
        }else if (!firstName.value.match(/^[A-Za-z]+$/)) {
            isErr = true;
            alert("First name can not contain numbers or Special Characters...");
            firstName.focus();
			
        }else if ((middleName.value.length > 0) && (!middleName.value.match(/^[A-Za-z]+$/))) {
            isErr = true;
            alert("Middle name can not contain numbers or Special Characters...");
            middleName.focus();
			
		}else if (lastName.value == "") {
            isErr = true;
            alert("Please enter your last name");
            lastName.focus();
			
        } else if (!lastName.value.match(/^[A-Za-z]+$/)) {
            isErr = true;
            alert("Last name can not contain numbers or Special Characters...");
            lastName.focus();
			
        }else if (eMail.value == "") {
            isErr = true;
            alert("Please enter your Email");
            eMail.focus();
			
        }else if (!eMail.value.match(/^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/)) {
            isErr = true;
            alert("Please enter valid Email");
            eMail.focus();
			
        }else if (mobileNo.value == "") {
            isErr = true;
            alert("Please enter mobile no.");
            mobileNo.focus();
			
        }else if (mobileNo.value.length != 10) {
            isErr = true;
            alert("Please enter a valid Mobile No.");
            mobileNo.focus();
			
        } else if (pass.value == "") {
            isErr = true;
            alert("Please enter a Password");
            pass.focus();
			
        } else if (pass.value.length < 6) {
            isErr = true;
            alert("Password must contain atleast 6 characters.");
            pass.focus();
			
        }else if (cnfrmpass.value == "") {
            isErr = true;
            alert("Please confirm your Password");
            cnfrmpass.focus();
			
        }else if ((cnfrmpass.value.length>0) && (cnfrmpass.value != pass.value)) {
            isErr = true;
            alert("Password Mis-match. Reconfirm your Password.");
            cnfrmpass.focus();
			
        } else if ((alternateMobileNo.value.length>0) && alternateMobileNo.value.length!=10) {
            isErr = true;
            alert("Please enter a valid alternate Mobile No.");
            alternateMobileNo.focus();
			
        }else if (dob.value == "") {
            isErr = true;
            alert("Please enter your date of birth");
            dob.focus();
        
	} 
        if (!isErr) {
            debugger;
            //document.getElementById(form).submit();
            document.forms["form"].submit();
            alert("Form Submitted...");
            return true;
        }
        return false;
    }

</Script>
</body>
</html> 