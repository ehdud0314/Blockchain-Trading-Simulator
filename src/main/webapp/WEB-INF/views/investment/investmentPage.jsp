<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<link
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css"
	rel="stylesheet" />

<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<link
	href="${pageContext.request.contextPath}/resources/css/investment.css"
	rel="stylesheet" type="text/css" />
<link
	href="${pageContext.request.contextPath}/resources/css/pinpad.css"
	rel="stylesheet" type="text/css" />
<script type="text/javascript" src="https://www.google.com/jsapi"></script>
<script
	src="${pageContext.request.contextPath}/resources/js/pinpad.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/js/investmentData.js"></script>
<script type="text/javascript">
function removeWaitBought(ubno) {
	alert("지우러 들어는 왔다"+ubno);
	$.ajax({
		url : "wbdelete",
		type : "post",
		data : {"ubno" : ubno}, 
		success : function(data) { // 전달받은 data를 JSON 문자열 형태로 바꾼다
			if(data>0){
				alert("성공");
				console.log(data);
			}else{
				alert("실패");
				console.log(data);
			}
			
		},
		error : function(request, status,errorData) {
			alert("실패"+ "error code : "+ request.status
					+ "\n"+ "message : "+ request.responseText
					+ "\n"+ "error : "+ errorData);
		}
	});
}
function removeBought(ubno) {
	alert("지우러 들어는 왔다"+ubno);
	$.ajax({
		url : "bdelete",
		type : "post",
		data : {"ubno" : ubno}, 
		success : function(data) { // 전달받은 data를 JSON 문자열 형태로 바꾼다
			if(data>0){
				alert("성공");
				console.log(data);
			}else{
				alert("실패");
				console.log(data);
			}
			
		},
		error : function(request, status,errorData) {
			alert("실패"+ "error code : "+ request.status
					+ "\n"+ "message : "+ request.responseText
					+ "\n"+ "error : "+ errorData);
		}
	});
}
function removeWaitSold(usno) {
	alert("지우러 들어는 왔다"+usno);
	$.ajax({
		url : "wsdelete",
		type : "post",
		data : {"usno" : usno}, 
		success : function(data) { // 전달받은 data를 JSON 문자열 형태로 바꾼다
			if(data>0){
				alert("성공");
				console.log(data);
			}else{
				alert("실패");
				console.log(data);
			}
			
		},
		error : function(request, status,errorData) {
			alert("실패"+ "error code : "+ request.status
					+ "\n"+ "message : "+ request.responseText
					+ "\n"+ "error : "+ errorData);
		}
	});
}
function removeSold(usno) {
	alert("지우러 들어는 왔다"+usno);
	$.ajax({
		url : "sdelete",
		type : "post",
		data : {"usno" : usno}, 
		success : function(data) { // 전달받은 data를 JSON 문자열 형태로 바꾼다
			if(data>0){
				alert("성공");
				console.log(data);
			}else{
				alert("실패");
				console.log(data);
			}
			
		},
		error : function(request, status,errorData) {
			alert("실패"+ "error code : "+ request.status
					+ "\n"+ "message : "+ request.responseText
					+ "\n"+ "error : "+ errorData);
		}
	});
}

</script>

<meta charset="UTF-8">
<title>InvestmentPage</title>
</head>
<body>
	<div id="wrapper">
		<jsp:include page="../main/header.jsp"></jsp:include>
		<div id="container">
			<!-- 위젯, 코인 목록 테이블 -->
			<table id="widgetTB">
				<tr>
					<td>
						<!-- TradingView Widget BEGIN -->
						<div class="tradingview-widget-container">
							<div id="tradingview_3fe73"></div>
							<div class="tradingview-widget-copyright">
								TradingView 제공 <a
									href="https://kr.tradingview.com/symbols/BTCKRW/?exchange=BITHUMB"
									rel="noopener" target="_blank"><span class="blue-text">BTS
										차트</span></a>
							</div>
							<script type="text/javascript"
								src="https://s3.tradingview.com/tv.js"></script>
						</div> <!-- TradingView Widget END -->
					</td>
					<td><input type="text" id="searchcoin" value=""
						style="width: 100%; display: 'block'">
						<div id="cointable_div"></div></td>
				</tr>
			</table>

			<br>
			<div id="alltable">
				<table id="all_t" class='table table-striped'>
					<tr>
						<td>
							<table>
								<tr>
									<td>현재가</td>
									<td>수량</td>
									<td>누적수량</td>
								</tr>
								<tr>
									<td>11111</td>
									<td>11111</td>
									<td>1111</td>
								</tr>
								<tr>
									<td>22222</td>
									<td>22222</td>
									<td>22222</td>
								</tr>
								<tr>
									<td>333333</td>
									<td>333333</td>
									<td>333333</td>
								</tr>
								<tr>
									<td>44444</td>
									<td>44444</td>
									<td>44444</td>
								</tr>
								<tr>
									<td>55555</td>
									<td>55555</td>
									<td>55555</td>

								</tr>
							</table>
						</td>



						<td>
							<table>
								<tr>
									<td><button value="" id="bought_b">매수</button>
										<button value="" id="sold_b">매도</button>
										<button value="" id="ajwb">ajwb</button>
										<button value="" id="ajws">ajws</button>
										<button value="" id="ajb">ajb</button>
										<button value="" id="ajs">ajs</button></td>
										<!-- <button value="" id="noaj" onclick="location.href='wblists'">결과나와라</button> -->
								</tr>
							</table>
							<form id="frm22">
								<table>
									<tr>
										<td><input id="cash" placeholder="보유 KRW"> <br>
											<input id="cash" placeholder="매도가능 코인"></td>

									</tr>
									<tr>
										<th colspan="1">코인종류</th>
									</tr>
									<tr>
										<td colspan="1"><input name="coin" id="coin" type="text"
											value="BTC" readonly="readonly" style="text-align: center;"></td>
									</tr>

									<tr>
										<th colspan="1">가격</th>
									</tr>
									<tr>
										<td colspan="1"><input id="price_b" type="text"
											name="buyprice"> <input id="price_s" type="text"
											name="sellprice"></td>

									</tr>
									<tr>
										<th colspan="1">수량</th>

									</tr>
									<tr>
										<td colspan="1"><input id="cnt_b" type="text"
											name="buycnt"><input id="cnt_s" type="text"
											name="sellcnt"></td>
									</tr>
									<tr>
										<th colspan="1">총액</th>

									</tr>
									<tr>
										<td colspan="1"><input id="totalprice" type="text"
											value="0"></td>
									</tr>
									<tr>
										<td colspan="1"><input id="acntno" name="acntno"
											type="text" value="b12345678"></td>
									</tr>


									<tr>
										<td colspan="1"><button value="10%">10%</button>
											<button value="25%">25%</button>
											<button value="50%">50%</button>
											<button value="100%">100%</button></td>
									</tr>
									<tr>
										<td colspan="1"><button id="bought" type="button">매수</button>
											<button id="sold" type="button">매도</button></td>

									</tr>

								</table>


							</form>

						</td>
						<td>
							<table>

								<tr>
									<th colspan="1">회원계좌번호 : <a>불러와</a><input class="password2" type="password"
										placeholder="비밀번호"></th>

								</tr>
								<tr>
									<th colspan="1">미체결주문 </th>
								</tr>
								<tr> 
									<td><div id="aj_wb"></div></td>
									<td><div id="aj_ws"></div></td>
								</tr>
								<!-- 글이 없을 경우 -->

							<%-- 	<c:if test="${empty wblists }">
									<tr>
										<td align="center">미체결 내역이 없습니다.</td>
									</tr>
								</c:if>
								<c:if test="${!empty wblists }">
									<c:forEach items="${wblists }" var="vo" varStatus="status">

										<tr>
											<td align="center">${vo.coin}</td>
											<td align="center">${vo.ubno}</td>
											<td align="center">${vo.buyprice}</td>
											<td align="center">${vo.buycnt}</td>
											<td align="center">${vo.wbdate}</td>
											<td align="center">${vo.acntno}</td>
											<td align="center"><button>삭제</button></td>
										</tr>
									</c:forEach>
								</c:if> --%>
								<tr>
									<th colspan="1">체결주문</th>
								</tr>
								<tr>

									<td><div id="aj_b"></div></td>
									<td><div id="aj_s"></div></td>
								</tr>

							</table>
						</td>
					</tr>
				</table>
			</div>
		</div>


	<jsp:include page="../main/footer.jsp"></jsp:include>
	</div>
<script>
$(function() {

	$("#sold_b").click(function() {

		$("#sold_b").css("background", "blue");
		$("#bought_b").css("background", "white");
		$("#cnt_b").hide();
		$("#price_b").hide();
		$("#bought").hide();
		$("#cnt_s").show();
		$("#price_s").show();
		$("#sold").show();
	});
	$("#bought_b").click(function() {

		$("#bought_b").css("background", "red");
		$("#sold_b").css("background", "white");
		$("#cnt_s").hide();
		$("#price_s").hide();
		$("#sold").hide();
		$("#cnt_b").show();
		$("#price_b").show();
		$("#bought").show();
	});

	$("#cnt_b").keyup(function() {
		var sum = 0;
		console.log("눌림눌림");
		var a = $("#price_b").val();
		var b = $("#cnt_b").val();
		sum = a * b;
		$("#totalprice").val(sum);
	});
	$("#cnt_s").keyup(function() {
		var sum = 0;
		console.log("눌림눌림");
		var a = $("#price_s").val();
		var b = $("#cnt_s").val();
		sum = a * b;
		$("#totalprice").val(sum);
	});
	$("#sold").on(
			"click",
			function() { // 컨트롤러로 부터 리스트를 받아서 출력한다
				var dataList = $("#frm22").serialize();
				$.ajax({
					url : "wsInsert",
					type : "post",
					data : dataList,
					dataType : "json",
					success : function(data) { // 전달받은 data를 JSON 문자열 형태로 바꾼다
						alert("ws성공");
						console.log(data);
					},
					error : function(request, status, errorData) {
						alert("ws실패" + "error code : " + request.status
								+ "\n" + "message : "
								+ request.responseText + "\n" + "error : "
								+ errorData);
					}
				});
			});
	$("#sold").on(
			"click",
			function() { // 컨트롤러로 부터 리스트를 받아서 출력한다
				var dataList = $("#frm22").serialize();
				$.ajax({
					url : "sInsert",
					type : "post",
					data : dataList,
					dataType : "json",
					success : function(data) { // 전달받은 data를 JSON 문자열 형태로 바꾼다
						alert("s성공");
						console.log(data);
					},
					error : function(request, status, errorData) {
						alert("s실패" + "error code : " + request.status
								+ "\n" + "message : "
								+ request.responseText + "\n" + "error : "
								+ errorData);
					}
				});
			});
	$("#bought").on(
			"click",
			function() { // 컨트롤러로 부터 리스트를 받아서 출력한다
				var dataList = $("#frm22").serialize();
				$.ajax({
					url : "wbInsert",
					type : "post",
					data : dataList,
					dataType : "json",
					success : function(data) { // 전달받은 data를 JSON 문자열 형태로 바꾼다
						alert("wb성공");
						console.log(data);

					},
					error : function(request, status, errorData) {
						alert("실패" + "error code : " + request.status
								+ "\n" + "message : "
								+ request.responseText + "\n" + "error : "
								+ errorData);
					}
				});
			});
	$("#bought").on(
			"click",
			function() { // 컨트롤러로 부터 리스트를 받아서 출력한다
				var dataList = $("#frm22").serialize();
				$.ajax({
					url : "bInsert",
					type : "post",
					data : dataList,
					dataType : "json",
					success : function(data) { // 전달받은 data를 JSON 문자열 형태로 바꾼다
						alert("b성공");
						console.log(data);

					},
					error : function(request, status, errorData) {
						alert("실패" + "error code : " + request.status
								+ "\n" + "message : "
								+ request.responseText + "\n" + "error : "
								+ errorData);
					}
				});
			});
	$("#ajwb")
			.on(
					"click",
					function() { // 컨트롤러로 부터 리스트를 받아서 출력한다
						var dataList = $("#frm22").serialize();
						
						$
								.ajax({
									url : "ajwblists",
									type : "POST",
									data : dataList,
									dataType : "json",

									success : function(json) {
										
										var html1 = "<form id='frm23'><table class='table table-striped' ><tr><td>접수번호</td><td>코인종류</td><td>코인개수</td><td>매수가격</td><td>매수날짜</td><td>계좌번호</td></tr>";
										
										
										console.log(json);
										if (json.length > 0) {
											$
													.each(
															json,
															function(
																	entryIndex,
																	entry) {
																html1 += "<tr><td>"
																		+ entry.ubno
																		+ "</td>"
																		+ "<td>"
																		+ entry.coin
																		+ "</td>"
																		+ "<td>"
																		+ entry.buycnt
																		+ "</td>"
																		+ "<td>"
																		+ entry.buyprice
																		+ "</td>"
																		+ "<td>"
																		+ entry.wbdate
																		+ "</td>"
																		+ "<td>"
																		+ entry.acntno
																		+ "</td>"
																		
																		+ "<td><button class='del' onclick=\"removeWaitBought(" + entry.ubno+ ")\">X</button><input type='hidden' name='wbno' value='"+entry.ubno+"'></input></td></tr>";
															});
											html1 += "</table></form>"
										} else {
											html1 = "<div>내용이없습니다</div>";
										}

										$("#aj_wb").html(html1);
										
										
										
/* 											$("#del").on("click",function() { // 컨트롤러로 부터 리스트를 받아서 출력한다
															 var dataList1 = $("#frm23").serialize(); 
															$.ajax({
																		url : "wbdelete",
																		type : "get",
																		data : dataList1, 
																		dataType : "json",
																		success : function(data) { // 전달받은 data를 JSON 문자열 형태로 바꾼다
																			alert("성공");
																			console.log(data);
																		},
																		error : function(request, status,errorData) {
																			alert("실패"+ "error code : "+ request.status
																					+ "\n"+ "message : "+ request.responseText
																					+ "\n"+ "error : "+ errorData);
																		}
																	});
														}); */
									}

								});
					});
	$("#ajws")
			.on(
					"click",
					function() { // 컨트롤러로 부터 리스트를 받아서 출력한다
						var dataList = $("#frm22").serialize();
						
						$
								.ajax({
									url : "ajwslists",
									type : "POST",
									data : dataList,
									dataType : "json",

									success : function(json) {
										
										var html1 = "<form id='frm23'><table class='table table-striped' ><tr><td>접수번호</td><td>코인종류</td><td>코인개수</td><td>매수가격</td><td>매수날짜</td><td>계좌번호</td></tr>";
										
										
										console.log(json);
										if (json.length > 0) {
											$
													.each(
															json,
															function(
																	entryIndex,
																	entry) {
																html1 += "<tr><td>"
																		+ entry.usno
																		+ "</td>"
																		+ "<td>"
																		+ entry.coin
																		+ "</td>"
																		+ "<td>"
																		+ entry.sellcnt
																		+ "</td>"
																		+ "<td>"
																		+ entry.sellprice
																		+ "</td>"
																		+ "<td>"
																		+ entry.wsdate
																		+ "</td>"
																		+ "<td>"
																		+ entry.acntno
																		+ "</td>"
																		
																		+ "<td><button class='del' onclick=\"removeWaitSold(" + entry.usno+ ")\">X</button></td></tr>";
															});
											html1 += "</table></form>"
										} else {
											html1 = "<div>내용이없습니다</div>";
										}

										$("#aj_ws").html(html1);
	
									}

								});
					});
	$("#ajb")
			.on(
					"click",
					function() { // 컨트롤러로 부터 리스트를 받아서 출력한다
						var dataList = $("#frm22").serialize();
						
						$
								.ajax({
									url : "ajblists",
									type : "POST",
									data : dataList,
									dataType : "json",

									success : function(json) {
										
										var html1 = "<form id='frm23'><table class='table table-striped' ><tr><td>접수번호</td><td>코인종류</td><td>코인개수</td><td>매수가격</td><td>매수날짜</td><td>계좌번호</td></tr>";
										
										
										console.log(json);
										if (json.length > 0) {
											$
													.each(
															json,
															function(
																	entryIndex,
																	entry) {
																html1 += "<tr><td>"
																		+ entry.ubno
																		+ "</td>"
																		+ "<td>"
																		+ entry.coin
																		+ "</td>"
																		+ "<td>"
																		+ entry.buycnt
																		+ "</td>"
																		+ "<td>"
																		+ entry.buyprice
																		+ "</td>"
																		+ "<td>"
																		+ entry.bdate
																		+ "</td>"
																		+ "<td>"
																		+ entry.acntno
																		+ "</td>"
																		
																		+ "<td><button class='del' onclick=\"removeBought(" + entry.ubno+ ")\">X</button></td></tr>";
															});
											html1 += "</table></form>"
										} else {
											html1 = "<div>내용이없습니다</div>";
										}

										$("#aj_b").html(html1);
	
									}

								});
					});
	$("#ajs")
			.on(
					"click",
					function() { // 컨트롤러로 부터 리스트를 받아서 출력한다
						var dataList = $("#frm22").serialize();
						
						$
								.ajax({
									url : "ajslists",
									type : "POST",
									data : dataList,
									dataType : "json",

									success : function(json) {
										
										var html1 = "<form id='frm23'><table class='table table-striped' ><tr><td>접수번호</td><td>코인종류</td><td>코인개수</td><td>매수가격</td><td>매수날짜</td><td>계좌번호</td></tr>";
										
										
										console.log(json);
										if (json.length > 0) {
											$
													.each(
															json,
															function(
																	entryIndex,
																	entry) {
																html1 += "<tr><td>"
																		+ entry.usno
																		+ "</td>"
																		+ "<td>"
																		+ entry.coin
																		+ "</td>"
																		+ "<td>"
																		+ entry.sellcnt
																		+ "</td>"
																		+ "<td>"
																		+ entry.sellprice
																		+ "</td>"
																		+ "<td>"
																		+ entry.sdate
																		+ "</td>"
																		+ "<td>"
																		+ entry.acntno
																		+ "</td>"
																		
																		+ "<td><button class='del' onclick=\"removeSold(" + entry.usno+ ")\">X</button></td></tr>";
															});
											html1 += "</table></form>"
										} else {
											html1 = "<div>내용이없습니다</div>";
										}

										$("#aj_s").html(html1);
	
									}

								});
					});

	

});
</script>
<script type="text/javascript">
//pinpad 생성
new pinpad({
	ref : {
		el : '.password2'
	},
	immediate : false,
	maxLength : 4,
	close : '<i class="far fa-times-circle"></i>',
	desc : 'ACCOUNT PASSWORD',
	passcode : true,
	letterReplace : {
		'del' : '<i class="fas fa-times delete"></i>',
		'done' : '<i class="fas fa-check done"></i>',
	}
});

</script>
</body>
</html>