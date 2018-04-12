<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<html>	
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<script src="https://code.jquery.com/jquery-3.3.1.min.js" integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8=" crossorigin="anonymous"></script>
</head>
<body>
	<button onClick="logout()" class="btn">Logout</button>
	<div>
		<h3>Facebook profile:</h3>
		<div>Name: <span id="user"></span></div>
		<div>Email: <span id="email"></span></div>
		<div><h3>Liked Pages:</h3>
			<span id="likes">
			</span>
		</div>
	</div>
	<script>
		if(window.location.hash == '#_=_'){
			history.replaceState
				? history.replaceState(null,null,window.location.href.split('#')[0])
				: window.location.hash = '';
		}
		$.get("/user", function(data){
			console.log(data);
			$("#user").html(data.userAuthentication.details.name);
			$("#email").html(data.userAuthentication.details.email);
			jQuery.each(data.userAuthentication.details.likes.data,function(i,val){
				$("#likes").append(val.name+'<br>');
			});
		});
		var logout = function() {
			$.post("/logout",function(){
				window.location = "/";
			});
			return true;
		}
	</script>
</body>

</html>