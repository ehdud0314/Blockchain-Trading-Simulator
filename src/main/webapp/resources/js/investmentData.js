$(function() {
	var checkpw = false;
	coinname();
	chart();
	$("#check2").click(function() { // 계좌 비밀번호
		var acntList = $("#frm11").serialize();
		var html3 = "";
		$.ajax({
			url : "bankpw",
			type : "post",
			data : acntList,
			success : function(data) {
				if (data == 1) {
					console.log("맞아요:");
					html3 += "<a style='color: green;'>성공</a>"
					checkpw = true;
					wblist();
					wslist();
					
				} else {
					checkpw = false;
					alert("계좌 비밀번호를 확인해 주세요 ");
					html3 += "<a style='color: red;'>오류</a>"
				}
				$("#su").html(html3);
			}
		})

	});
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
				if (checkpw == false) {
					alert("계좌비밀번호를 입력해주세요");
				} else {
					var dataList = $("#frm22").serialize();
					$.ajax({
						url : "wsInsert",
						type : "post",
						data : dataList,
						dataType : "json",
						success : function(data) { // 전달받은 data를 JSON 문자열 형태로
							// 바꾼다
							alert("ws성공");
							console.log(data);
							wblist();
							wslist();
						},
						error : function(request, status, errorData) {
							alert("ws실패" + "error code : " + request.status
									+ "\n" + "message : "
									+ request.responseText + "\n" + "error : "
									+ errorData);
						}
					});
				}
			});

	$("#sold").on(
			"click",
			function() { // 컨트롤러로 부터 리스트를 받아서 출력한다
				if (checkpw == false) {
					alert("계좌비밀번호를 입력해주세요");
				} else {
					var dataList = $("#frm22").serialize();
					$.ajax({
						url : "sInsert",
						type : "post",
						data : dataList,
						dataType : "json",
						success : function(data) { // 전달받은 data를 JSON 문자열 형태로
							// 바꾼다
							alert("s성공");
							console.log(data);
							wblist();
							wslist();
						},
						error : function(request, status, errorData) {
							alert("s실패" + "error code : " + request.status
									+ "\n" + "message : "
									+ request.responseText + "\n" + "error : "
									+ errorData);
						}
					});
				}

			});
	$("#bought").on(
			"click",
			function() { // 컨트롤러로 부터 리스트를 받아서 출력한다
				if (checkpw == false) {
					alert("계좌비밀번호를 입력해주세요");
				} else {
					var dataList = $("#frm22").serialize();
					$.ajax({
						url : "wbInsert",
						type : "post",
						data : dataList,
						dataType : "json",
						success : function(data) { // 전달받은 data를 JSON 문자열 형태로
							// 바꾼다
							alert("wb성공");
							console.log(data);
							wblist();
							wslist();

						},
						error : function(request, status, errorData) {
							alert("실패" + "error code : " + request.status
									+ "\n" + "message : "
									+ request.responseText + "\n" + "error : "
									+ errorData);
						}
					});
				}
			});
	$("#select_coin_add").on(
			"click",
			function() { // 컨트롤러로 부터 리스트를 받아서 출력한다
				
					var dataList = $("#frm22").serialize();
					$.ajax({
						url : "coinacntInsert",
						type : "post",
						data : dataList,
						dataType : "json",
						success : function(data) { // 전달받은 data를 JSON 문자열 형태로
							// 바꾼다
							alert("성공");
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
	$("#select_coin")
	.on(
			"click",
			function() { // 컨트롤러로 부터 리스트를 받아서 출력한다
				var dataList = $("#frm22").serialize();

				$
						.ajax({
							url : "coinacntlists",
							type : "POST",
							data : dataList,
							dataType : "json",

							success : function(json) {

								var html1 = "<form id='frm23'><table class='table table-striped' ><tr><td>접수번호</td><td>코인종류</td><td>코인개수</td><td>매수가격</td><td>계좌번호</td></tr>";

								console.log(json);
								if (json.length > 0) {
									$
											.each(
													json,
													function(
															entryIndex,
															entry) {
														html1 += "<tr><td>"
																+ entry.cano
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
																+ entry.acntno
																+ "</td>"
																

																+ "<td><button class='del' onclick=\"removeCoinAcnt("
																+ entry.cano
																+ ")\">X</button></td></tr>";
													});
									html1 += "</table></form>"
								} else {
									html1 = "<div>내용이없습니다</div>";
								}

								$("#aj_b").html(html1);

							}

						});
			});
	$("#select_acnt")
	.on(
			"click",
			function() { // 컨트롤러로 부터 리스트를 받아서 출력한다
				var dataList = $("#frm22").serialize();
				
				$
				.ajax({
					url : "acntlists",
					type : "POST",
					data : dataList,
					dataType : "json",
					
					success : function(json) {
						
						var html1 = "<form id='frm23'><table class='table table-striped' ><tr><td>계좌번호</td><td>계좌보유금액</td><td>이메일</td></tr>";
						
						console.log(json);
						if (json.length > 0) {
							$
							.each(
									json,
									function(
											entryIndex,
											entry) {
										html1 += "<tr><td>"
											+ entry.acntno
											+ "</td>"
											+ "<td>"
											+ entry.cybcash
											+ "</td>"
											+ "<td>"
											+ entry.email
											+ "</td></tr>";
									});
							html1 += "</table></form>"
						} else {
							html1 = "<div>내용이없습니다</div>";
						}
						
						$("#aj_b").html(html1);
						
					}
				
				});
			});
	$("#bought").on(
			"click",
			function() { // 컨트롤러로 부터 리스트를 받아서 출력한다
				if (checkpw == false) {
					alert("계좌비밀번호를 입력해주세요");
				} else {
					var dataList = $("#frm22").serialize();
					$.ajax({
						url : "bInsert",
						type : "post",
						data : dataList,
						dataType : "json",
						success : function(data) { // 전달받은 data를 JSON 문자열 형태로
							// 바꾼다
							alert("b성공");
							console.log(data);
							wblist();
							wslist();

						},
						error : function(request, status, errorData) {
							alert("실패" + "error code : " + request.status
									+ "\n" + "message : "
									+ request.responseText + "\n" + "error : "
									+ errorData);
						}
					});
				}
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

																		+ "<td><button class='del' onclick=\"removeBought("
																		+ entry.ubno
																		+ ")\">X</button></td></tr>";
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

																		+ "<td><button class='del' onclick=\"removeSold("
																		+ entry.usno
																		+ ")\">X</button></td></tr>";
															});
											html1 += "</table></form>"
										} else {
											html1 = "<div>내용이없습니다</div>";
										}

										$("#aj_s").html(html1);

									}

								});
					});
	var timer1 = setInterval(function() {
		console.log("1초");
		alltable();
		// orderbook();
		

	}, 1000);

});

var coinList = null;
var changecoin = "BTC"; // default

function alltable() {
	console.log("table함수 들어옴");
	var display = new Array();
	var onedisplay = new Array();
	var html = "";
	var thisCoin = null;
	$
			.ajax({
				url : 'https://api.bithumb.com/public/ticker/ALL_KRW',
				type : "get",
				cache : false,
				datatype : "json",
				success : function(data) {
					var search = $("#searchcoin").val().toString();
					search = search.toUpperCase();
					$("#searchcoin").on('keyup', function() {
						// change keyup paste
						console.log("입력받은 search값 " + search);
					});
					if (search == "") {
						console.log("search 아무것도 안입력했음");

						for (var i = 0; i < coinList.length; i++) {
							display[i] = [
									data['data'][coinList[i]]['closing_price'] * 1,
									data['data'][coinList[i]]['fluctate_rate_24H'] * 1,
									data['data'][coinList[i]]['acc_trade_value_24H'] * 1 ]
						}
						html = "<table class='table table-striped' id='cointable' ><tr><td>코인명</td><td>현재가</td><td>등락률(24H)</td><td>거래대금</td></tr>";
						for (var i = 0; i < coinList.length; i++) {
							thisCoin = i;
							// console.log(coinList[i] + "의 정보는 다음과 같다" +
							// display[i]);
							html += "<tr><td><a href=# onclick='changename("
									+ thisCoin + ");'>" + coinList[i]
									+ "</a></td><td>" + display[i][0]
									+ "</td><td>" + display[i][1] + "%"
									+ "</td><td>" + display[i][2]
									+ "</td></tr>";

						}
						html += "</table>"
						$("#cointable_div").html(html);
					} else {
						console.log(search + "검색한 서치값");
						var onechange = "";

						onedisplay[0] = [
								data['data'][search]['closing_price'] * 1,
								data['data'][search]['fluctate_rate_24H'] * 1,
								data['data'][search]['acc_trade_value_24H'] * 1 ]
						html = "<table class='table table-striped' ><tr><td>코인명</td><td>현재가</td><td>등락률(24H)</td><td>거래대금</td></tr>";

						html += "<tr><td><a href=# onclick='changename(\""
								+ search + "\");'>" + search + "</a></td><td>"
								+ onedisplay[0][0] + "</td><td>"
								+ onedisplay[0][1] + "%" + "</td><td>"
								+ onedisplay[0][2] + "</td></tr>";

						html += "</table>"
						$("#cointable_div").html(html);
					}

				}
			});
};
function wblist() { // 컨트롤러로 부터 리스트를 받아서 출력한다
	var dataList = $("#frm22").serialize();

	$
			.ajax({
				url : "ajwblists",
				type : "POST",
				data : dataList,
				dataType : "json",

				success : function(json) {

					var html1 = "<span>미채결 매수주문내역</span><form id='frm23'><table class='table table-striped' ><tr><td>접수번호</td><td>코인종류</td><td>코인개수</td><td>매수가격</td><td>매수날짜</td><td>계좌번호</td></tr>";

					console.log(json);
					if (json.length > 0) {
						$
								.each(
										json,
										function(entryIndex, entry) {
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

													+ "<td><button class='del' onclick=\"removeWaitBought("
													+ entry.ubno
													+ ")\">X</button><input type='hidden' name='wbno' value='"
													+ entry.ubno
													+ "'></input></td></tr>";
										});
						html1 += "</table></form>"
					} else {
						html1 = "<div>내용이없습니다</div>";
					}

					$("#aj_wb").html(html1);

				}

			});
}
function wslist() { // 컨트롤러로 부터 리스트를 받아서 출력한다
	var dataList = $("#frm22").serialize();

	$
			.ajax({
				url : "ajwslists",
				type : "POST",
				data : dataList,
				dataType : "json",

				success : function(json) {

					var html1 = "<br><span>미채결 매도주문내역</span><form id='frm23'><table class='table table-striped' ><tr><td>접수번호</td><td>코인종류</td><td>코인개수</td><td>매수가격</td><td>매수날짜</td><td>계좌번호</td></tr>";

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

													+ "<td><button class='del' onclick=\"removeWaitSold("
													+ entry.usno
													+ ")\">X</button></td></tr>";
										});
						html1 += "</table></form>"
					} else {
						html1 = "<div>내용이없습니다</div>";
					}

					$("#aj_ws").html(html1);

				}

			});
}
function chart() {

	new TradingView.widget({
		"width" : 600,
		"height" : 490,
		"symbol" : "BITHUMB:" + changecoin + "KRW",
		"interval" : "5",
		"timezone" : "Asia/Seoul",
		"theme" : "light",
		"style" : "1",
		"locale" : "kr",
		"toolbar_bg" : "#f1f3f6",
		"enable_publishing" : true,
		"withdateranges" : true,
		"allow_symbol_change" : true,
		"container_id" : "tradingview_3fe73"
	});
}

function toname(name) {
	document.getElementById("coin").value = name;
};

function changename(listNum) {
	var checkstring = typeof (listNum);

	if (checkstring == 'number') {
		changecoin = coinList[listNum];
		console.log("changename함수");

	} else {
		changecoin = listNum;
		console.log(listNum);

	}
	console.log(changecoin);
	toname(changecoin);
	chart();
};

function coinname() {
	console.log("coin name함수")

	$.ajax({
		url : 'https://api.bithumb.com/public/ticker/ALL_KRW',
		type : "get",
		cache : false,
		datatype : "json",
		success : function(data) {
			coinList = Object.keys(data['data']);
			console.log(coinList);

		}
	});
};
function removeWaitBought(ubno) {
	alert("지우러 들어는 왔다" + ubno);
	$.ajax({
		url : "wbdelete",
		type : "post",
		data : {
			"ubno" : ubno
		},
		success : function(data) { // 전달받은 data를 JSON 문자열 형태로 바꾼다
			if (data > 0) {
				alert("성공");
				console.log(data);
			} else {
				alert("실패");
				console.log(data);
			}

		},
		error : function(request, status, errorData) {
			alert("실패" + "error code : " + request.status + "\n" + "message : "
					+ request.responseText + "\n" + "error : " + errorData);
		}
	});
}
function removeBought(ubno) {
	alert("지우러 들어는 왔다" + ubno);
	$.ajax({
		url : "bdelete",
		type : "post",
		data : {
			"ubno" : ubno
		},
		success : function(data) { // 전달받은 data를 JSON 문자열 형태로 바꾼다
			if (data > 0) {
				alert("성공");
				console.log(data);
			} else {
				alert("실패");
				console.log(data);
			}

		},
		error : function(request, status, errorData) {
			alert("실패" + "error code : " + request.status + "\n" + "message : "
					+ request.responseText + "\n" + "error : " + errorData);
		}
	});
}
function removeWaitSold(usno) {
	alert("지우러 들어는 왔다" + usno);
	$.ajax({
		url : "wsdelete",
		type : "post",
		data : {
			"usno" : usno
		},
		success : function(data) { // 전달받은 data를 JSON 문자열 형태로 바꾼다
			if (data > 0) {
				alert("성공");
				console.log(data);
			} else {
				alert("실패");
				console.log(data);
			}

		},
		error : function(request, status, errorData) {
			alert("실패" + "error code : " + request.status + "\n" + "message : "
					+ request.responseText + "\n" + "error : " + errorData);
		}
	});
}
function removeSold(usno) {
	alert("지우러 들어는 왔다" + usno);
	$.ajax({
		url : "sdelete",
		type : "post",
		data : {
			"usno" : usno
		},
		success : function(data) { // 전달받은 data를 JSON 문자열 형태로 바꾼다
			if (data > 0) {
				alert("성공");
				console.log(data);
			} else {
				alert("실패");
				console.log(data);
			}

		},
		error : function(request, status, errorData) {
			alert("실패" + "error code : " + request.status + "\n" + "message : "
					+ request.responseText + "\n" + "error : " + errorData);
		}
	});
}

// function orderbook() {
// console.log("orderbook함수");
// var orderdisplay = new Array();
//
// $.ajax({
// url :
// 'https://cors-anywhere.herokuapp.com/https://api.bithumb.com/public/orderbook/BTC_KRW',
// crossOrigin : true,
// type : "get",
// cache : false,
// datatype : "json",
// success : function(data) {
// console.log(data);
// var a = data['data']['bids'].length - 1; // 길이 알아옴
// for (var i = 0; i < a; i++) {
// orderdisplay[i] = [ data['data']['bids'][i]['price']*1,
// data['data']['bids'][i]['quantity']*1]
// console.log(orderdisplay[i]);
// }
// }
// });
// };
