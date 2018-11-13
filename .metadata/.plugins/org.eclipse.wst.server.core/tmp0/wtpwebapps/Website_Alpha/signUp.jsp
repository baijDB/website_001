<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" type="text/css" href="signUp.css">
<title>Sign Up</title>
</head>
<body>

	<div class="outest_container" id="outest">
			<div class="form_ele">User Name:<input type="text" name="uname"></div>
			<div class="form_ele">Re-enter name:<input type="text" name="uname_re"></div>
			<div class="form_ele">User Password:<input type="password" name="upass"></div>
			<div class="form_ele">Re-enter password:<input type="password" name="upass_re">
				<img onclick="submit()" src="10.png">
			</div>
			<div class="form_ele" id="hidden_status">Hidden Part</div>
	</div>

	<script type="text/javascript" >

		function submit(){
			console.log("Submitting");
			uid = document.getElementsByName("uname")[0].value;
			upass = document.getElementsByName("upass")[0].value;

			uid_re = document.getElementsByName("uname_re")[0].value;
			upass_re = document.getElementsByName("upass_re")[0].value;
			if(uid == uid_re && upass == upass_re && uid !=="" && upass !== "")
			{
				var xhr = new XMLHttpRequest();
				xhr.open("GET","signUp.do?uid="+uid+"&upass="+upass);
				xhr.onreadystatechange = function()
				{
	            	if(xhr.readyState==4 && xhr.status == 200)
	            	{
		                console.info(xhr.responseText);
		                var responseString = xhr.responseText;
		                var status = document.getElementById("hidden_status");
		                status.style.visibility = "visible";
		                status.innerHTML= responseString;
		            }
   		 		}
    			xhr.send(null);
			}
			else{
				var status = document.getElementById("hidden_status");
		        status.style.visibility = "visible";
		        status.innerHTML= "Please make sure your two passwords and usernames are same";
			}

		
		}

	</script>
	
</body>
</html>