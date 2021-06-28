<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="https://www.google.com/jsapi"></script>
<script src="${pageContext.request.contextPath}/resources/js/data.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/js/newsList.js"></script>
<link href="${pageContext.request.contextPath}/resources/css/main.css"
	rel="stylesheet" type="text/css" />
<meta charset="UTF-8">
<script type="text/javascript">
function go() {
	location.href = "<%=request.getContextPath()%>/investmentpage";
	}
</script>
</head>
<jsp:include page="../main/header.jsp"></jsp:include>
<body>
	<div id="wrapper">
		<div id="container">
			<table style="width: 100%" class="shadow">
				<tr>
					<td id="c1">
<!-- 						<div id="chart"> -->
							<div id="chart_div"></div>
<!-- 						</div> -->
					</td>
					<td id="c2">
						<div id="table">
							<div id="cointable_div"></div>
						</div>
					</td>
				</tr>
			</table>
			<table>
				<tr>
					<td colspan="2">
						<button id="cointable_btn" onclick="go();">거래소바로가기</button>
					</td>
				</tr>
			</table>
			<div id="new">
				<div class="headLine">
					<marquee class="scroll" onmouseover="this.stop();"
						onmouseout="this.start();">
						<!-- newsList.js의 newsHeadLine() 함수 참조 -->
					</marquee>
				</div>
			</div>
		</div>
		<jsp:include page="../main/footer.jsp"></jsp:include>
	</div>
</body>
</html>