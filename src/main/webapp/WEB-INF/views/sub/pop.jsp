<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="shortcut icon" href="${pageContext.request.contextPath}/resources/assets/favicon.ico" type="image/x-icon" />
<link rel="icon" href="${pageContext.request.contextPath}/resources/assets/favicon.ico" type="image/x-icon" />
<meta charset="UTF-8">
<title>BTS</title>
</head>
<style>
#icon1 {
	width: 50px;
	height: 50px;
	border-radius: 50%;
	position: fixed;
	top: 70px;
	right: 5px;
}
.before1{
	border: 1px solid rgb(140, 102, 200);
	background: white;
	color: rgb(140, 102, 200);
}
.after{
	background-color: rgb(140, 102, 200);
	color: white;
}

#icon1:hover {
	background-color: rgb(140, 102, 200);
	color: white;
}

.chatt {
	z-index : 9998;
	position: fixed;
	top: 120px;
	right: 5px;
	border: 1px solid rgb(140, 102, 200);
	border-radius: 5px;
}
</style>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<body>
<input type="button" id="icon1" value="Chat" class="before1">
<iframe src="Chatting" width="500px" height="500px" class="chatt"></iframe>
<script>
	$(function() {
		 $(".chatt").css("display", "none") 
		var show = function() {
			$(".chatt").toggle();
		}
		$("#icon1").on("click", show);

	})
</script>
</body>
</html>