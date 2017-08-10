<!DOCTYPE html>
<!--
To change this license header, choose License Headers in Project Properties.
To change this template file, choose Tools | Templates
and open the template in the editor.
-->

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
	font-variant: small-caps;
	margin-left: 43%;
}
#surveyfieldset{
	color: #0293FF; /* Blue */
	position: absolute;
	font-variant: small-caps;
	top:50%;
	width : 33%;
	left : 33%;	
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

</style>
<head>
<script type="text/javascript" src="\loginRegistrationResources\countries.js"></script>
</head>
<body>
	   <% if ((session.getAttribute("token") == null) && (session.getAttribute("account_type") != "user")){
            response.sendRedirect("index.jsp");
        }%>
	<img id="banner" src="\loginRegistrationResources\homepage_banner.jpg" alt="Banner Image"/>
	<img id ="logo" src ="\loginRegistrationResources\logo.jpg" alt ="Logo Image"/>
        <h3 id = "welcometext" align="center">Welcome</h3>
      
        
        <fieldset id="surveyfieldset">
		<legend><b> User Information </b></legend>
		<form name="surveyform" id="surveyform" action="addPersonalInfo.jsp" method="get">
                    <fieldset class="group"> 
					<legend>User Interests</legend> 
						<ul class="checkbox"> 
							<br>
							<li><input name="userInterestsCb" type="checkbox" id="cb1" value="Sports" /><label for="cb1">Sports</label></li> 
							<li><input name="userInterestsCb" type="checkbox" id="cb2" value="Reading" /><label for="cb2">Reading</label></li> <br><br>
							<li><input name="userInterestsCb" type="checkbox" id="cb3" value="Music" /><label for="cb3">Music</label></li> 
							<li><input name="userInterestsCb" type="checkbox" id="cb4" value="Painting/Sketching" /><label for="cb4">Painting/Sketching</label></li> <br><br>
							<li><input name="userInterestsCb" type="checkbox" id="cb5" value="Craft" /><label for="cb5">Craft</label></li> 
							<li><input name="userInterestsCb" type="checkbox" id="cb6" value="Computer & Softwares" /><label for="cb6>">Computer & Softwares</label></li> <br><br>
							<li><input name="userInterestsCb" type="checkbox" id="cb7" value="Gaming" /><label for="cb7">Gaming</label></li> 
							<li><input name="userInterestsCb" type="checkbox" id="cb8" value="Blogs" /><label for="cb8">Bloging</label></li> <br><br>
							<li><input name="userInterestsCb" type="checkbox" id="cb9" value="Photography" /><label for="cb9>">Photography</label></li>
							<li><input name="userInterestsCb" type="checkbox" id="cb10" value="Travelling" /><label for="cb10">Traveling</label></li> <br><br>
							<li><input name="userInterestsCb" type="checkbox" id="cb11" value="Fashion" /><label for="cb11">Fashion</label></li> 
							<li><input name="userInterestsCb" type="checkbox" id="cb12" value="others" /><label for="cb12>">Others</label></li><br><br>
						</ul> 
					</fieldset> 
                    
                                        <fieldset class="group"> 
					<legend>Current Address</legend> 
						<ul class="checkbox"> 
							<br>
							<input name="c_address_1"  type="text" id="c_address_line_1" placeholder="Address Line 1" width="100px" /><br>
							<input name="c_address_2" type="text" id="c_address_line_2" placeholder="Address Line 2" /><br>
							<br/><select id="current_country" name="current_country"></select>
							<br /><select name="current_state" id="current_state"></select>
							<br/>
								<script language="javascript">
									populateCountries("current_country", "current_state");
								</script>
							<br><input type="text" id="current_city" name="current_city" placeholder="city" /><br>
							<input name="current_zipcode" type="number" id="current_zipcode" placeholder="Zipcode/Pin Code" /><br>
							<br><div id ="current_zipcode_errors"></div>
						</ul> 
					</fieldset> 
                    
					<input name="samePermanentAddCb" type="checkbox" id="samePermanentAdd" value="same" onclick="javascript:autofillPermanentAddress();" /><label for="cb1">Permanent Address is same as Current Address</label>
		
                                        <fieldset class="group" id="permanent_address_fs"> 
					<legend>Permanent Address</legend> 
						<ul class="checkbox"> 
							<br><input name="p_address_1" type="text" id="p_address_line_1" placeholder="Address Line 1" width="100px" /><br>
							<input name="p_address_2" type="text" id="p_address_line_2" placeholder="Address Line 2" /><br>
							<br/><select id="permanent_country" name="permanent_country"></select>
							<br /><select name="permanent_state" id="permanent_state"></select>
							<br/>
								<script language="javascript">
									populateCountries("permanent_country", "permanent_state");
								</script>
							<br><input name="permanent_city" type="text" id="permanent_city" placeholder="city" /><br>
							<input name="permanent_zipcode" type="number" id="permanent_zipcode" placeholder="Zipcode/Pin Code" /><br>
							<br><div id ="permanent_zipcode_errors"></div>
						</ul> 
					</fieldset>
					
					<input name="noOtherAddCb" type="checkbox" id="no_other_address" value="no other address" onclick="javascript:setVisibilityOtherAddress();" /><label for="cb1">Don't Have Other Address</label>
					 
					<fieldset class="group" id = "other_address_fs"> 
					<legend>Other Address</legend> 
						<ul class="checkbox"> 
							<br><input name="o_address_1" type="text" id="o_address_line_1" placeholder="Address Line 1" width="100px" /><br>
							<input name="o_address_2" type="text" id="o_address_line_2" placeholder="Address Line 2" /><br>
							<br/><select id="other_country" name="other_country"></select>
							<br /><select name="other_state" id="other_state"></select>
							<br/>
								<script language="javascript">
									populateCountries("other_country", "other_state");
								</script>
							<br><input name="otherCity" type="text" id="other_city" placeholder="city" /><br>
							<input name="other_zipcode" type="number" id="other_zipcode" placeholder="Zipcode/Pin Code" /><br>
							<br><div id ="other_zipcode_errors"></div>
						</ul> 
					</fieldset> 
                    
			<input type="button" name = "Submit" id="submit_btn" value = "Submit" onclick="javascript:validateForm();">
			
		</form>
	</fieldset>
        <a href="logout.jsp" name = "logout"  id = "logout_btn" >Logout</a>
</body>
<Script language="javascript">

function autofillPermanentAddress(){
if (document.getElementById("samePermanentAdd").checked) {
    document.getElementById("p_address_line_1").value = document.getElementById("c_address_line_1").value;
	document.getElementById("p_address_line_2").value = document.getElementById("c_address_line_2").value;
	document.getElementById("permanent_city").value = document.getElementById("current_city").value;
	document.getElementById("permanent_state").value = document.getElementById("current_state").value;
	document.getElementById("permanent_country").value = document.getElementById("current_country").value;
	document.getElementById("permanent_zipcode").value = document.getElementById("current_zipcode").value;

	document.getElementById("permanent_address_fs").disabled = true;
  } else {
    document.getElementById("permanent_address_fs").disabled = false;
  }

}

function setVisibilityOtherAddress(){
  if (document.getElementById("no_other_address").checked) {
    document.getElementById("other_address_fs").disabled = true;
  } else {
    document.getElementById("other_address_fs").disabled = false;
  }
}

    function validateForm() {
	var isErr = false;
	//no validations for city, as some special chars and numbers are included in city names.
	//document.getElementById("other_address_fs").disabled = true;
        if (current_zipcode.value == "") {
            isErr = true;
            document.getElementById('current_zipcode_errors').innerHTML=" Please enter Zipcode/Pin code. ";
            current_zipcode.focus();
			
        }else if ((current_zipcode.value.length<5)||(current_zipcode.value.length>6)) {
            isErr = true;
            document.getElementById('current_zipcode_errors').innerHTML=" Please enter valid Zipcode/Pin code. ";
            current_zipcode.focus();
			
        }else if (current_city.value == "") {
            isErr = true;
			document.getElementById('current_zipcode_errors').innerHTML="Please Enter Your City.";
            current_city.focus();
			
        }else if (permanent_zipcode.value == "") {
            isErr = true;
			document.getElementById('current_zipcode_errors').innerHTML="";
            document.getElementById('permanent_zipcode_errors').innerHTML=" Please enter Zipcode/Pin code. ";
            permanent_zipcode.focus();
			
        }else if ((permanent_zipcode.value.length<5)||(permanent_zipcode.value.length>6)) {
            isErr = true;
			document.getElementById('current_zipcode_errors').innerHTML="";
            document.getElementById('permanent_zipcode_errors').innerHTML=" Please enter valid Zipcode/Pin code. ";
            permanent_zipcode.focus();
			
        }else if (permanent_city.value == "") {
            isErr = true;
			document.getElementById('current_city').innerHTML="";
			document.getElementById('permanent_zipcode_errors').innerHTML="Please Enter Your City.";
            permanent_city.focus();
			
        }else if ((other_zipcode.value == "")&&(document.getElementById("other_address_fs").disabled == false)) {
            isErr = true;
			document.getElementById('permanent_zipcode_errors').innerHTML="";
            document.getElementById('other_zipcode_errors').innerHTML=" Please enter Zipcode/Pin code. ";
            other_zipcode.focus();
			
        }else if(document.getElementById("other_address_fs").disabled == false)
		{
		if ((other_zipcode.value.length<5)||(other_zipcode.value.length>6)) {
            isErr = true;
			document.getElementById('permanent_zipcode_errors').innerHTML="";
            document.getElementById('other_zipcode_errors').innerHTML=" Please enter valid Zipcode/Pin code. ";
            other_zipcode.focus();
			}
			
        }else if ((other_city.value == "")&&(document.getElementById("other_address_fs").disabled == false)) {
            isErr = true;
			document.getElementById('other_city').innerHTML="";
			document.getElementById('other_zipcode_errors').innerHTML="Please Enter Your City.";
            other_city.focus();
			
        }
        if (!isErr) {
			document.getElementById('current_zipcode_errors').innerHTML="";
			document.getElementById('permanent_zipcode_errors').innerHTML="";
			
			document.getElementById('other_zipcode_errors').innerHTML="";
            surveyform.submit();
            alert("Form Submitted...");
            return true;
        }
        return false;
    }

</Script>
</html>
