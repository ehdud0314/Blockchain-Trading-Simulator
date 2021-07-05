

function newsContent() {
	
	var newsId= parseInt($('#news_id').val());
	var newsKeyword = $('#news_keyword').val();
//	console.log("newsId : "+newsId+" type : "+ typeof(newsId));
	
	$.ajax({
		url : 'https://www.cryptohub.or.kr/api/v1/news',
		type : "POST",
		cache : false,
		data : {
			token : "$2y$10$hUvFjpPSDU5Gx6vp20vhGOg6Nuib3IZBzZk4cR5f.uGbRtMKN.S2m",
			page : 1,
			limit : 100
		},
		success : function(data) {
//			console.log("data.data.length : " + data.data.length);
			
			var index;
			
			for (var i = 0; i < data.data.length; i++) {
				if(data.data[i].id == newsId) {
					index = i;
					break;
				}
			}
			
//			console.log("index : " + index);
			
			$('.title').append(data.data[index].title);
			$('.byline_pubdate').append(data.data[index].byline+'<br>송고&nbsp;'+data.data[index].pubdate+'<span class="update">최종수정&nbsp;'+data.data[index].updated_at+'</span><button id="toList"><img src="resources/assets/img/news_back_arrow.svg" width="30px"/></button>');
			
			$('.content').append(data.data[index].content);
			
			$('#toList').click(function() {
//				console.log("검색키워드: " + newsKeyword);
				location.href = "nlist?news_keyword="+newsKeyword;
			});
		} //TODO 에러페이지
	});
};



newsContent();