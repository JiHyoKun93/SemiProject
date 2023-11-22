<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="theme-color" content="#261b39">
<meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">

<!-- map 최종본.. -->

<title>Eggplant : 오시는 길</title>

<link rel="stylesheet" type="text/css" href="<%=cp%>/data/map.css"/>
<link rel="shortcut icon" href="<%=cp %>/image/LogoIcon.png" type="image/png"/>
<link rel="stylesheet" type="text/css" href="//cwcode.asiae.co.kr/asiae_v2/css/company_2021.css?20230120" charset="utf-8" />
<link href="https://hangeul.pstatic.net/hangeul_static/css/nanum-square.css" rel="stylesheet">
<link rel="shortcut icon" href="<%=cp %>/image/LogoIcon.png" type="image/png"/>

<style type="text/css">
body{
    font-family: NanumSquareAceb;
  }

#container .content_header {
    padding: 0px;
    padding-top: 30px;
    text-align: center;
}

#container{
	padding-bottom: 50px;
}
.con_left{
    display: flex;
    align-items: center;
    justify-content: center;
	padding-bottom: 25px;
}
.information{
	width: 500px;
    align-items: center;
    display: flex;
    justify-content: center;
}
.articleCenter {
    display: flex;
    justify-content: center;
    align-items: center;
    gap: 50px;
}

</style>



</head>
<body>

<form action="" name="myForm" method="post">
  
  <div id="containerMain">
    <div id=pageHeader>
				<section class="hbody"> 
				<a href="<%=cp %>/eggplant/main.do"><img src="<%=cp%>/image/sideLogo.png" style="width: 150px; height: 50px; display: inline-block; position: relative;" /></a>
				<ul id="menu">
					<c:if test="${empty customInfo}">
					<li class="menu_item1 title-li"><a href="<%=cp %>/eggplant/login.do" class="link">뱅킹</a></li>
					<li class="menu_item1"><a href="<%=cp %>/eggplant/card.do" class="link">카드</a></li>
					<li class="menu_item1"><a href="<%=cp %>/eggplant/login.do" class="link">상품 서비스</a></li>
					<li class="menu_item1"><a href="<%=cp %>/eggplant/login.do" class="link">환율</a></li>
					<li class="menu_item1"><a href="<%=cp %>/eggplant/board.do" class="link">고객 센터</a></li>
					<li class="menu_item1"><a href="<%=cp %>/eggplant/map.do" class="link">오시는 길</a></li>
					<li class="menu_item2"><a href="<%=cp %>/eggplant/login.do" class="link">로그인</a></li>
					</c:if>
					<c:if test="${not empty customInfo}">
					<li class="menu_item1 title-li"><a href="<%=cp %>/eggplant/accountCheck.do" class="link">뱅킹</a></li>
					<li class="menu_item1"><a href="<%=cp %>/eggplant/card.do" class="link">카드</a></li>
					<li class="menu_item1"><a href="<%=cp %>/eggplant/loan.do" class="link">상품 서비스</a></li>
					<li class="menu_item1"><a onclick="sendExchange();" class="link">환율</a></li>
					<li class="menu_item1"><a href="<%=cp %>/eggplant/board.do" class="link">고객 센터</a></li>
					<li class="menu_item1"><a href="<%=cp %>/eggplant/map.do" class="link">오시는 길</a></li>
					<li class="menu_item3">${customInfo.userName}님 환영합니다.</li>
					<li class="menu_item1"><a href="<%=cp %>/eggplant/mypage.do" class="link">MyPage</a></li>
					<li class="menu_item2"><a href="<%=cp %>/eggplant/logout.do" class="link">로그아웃</a></li>
					</c:if>
				</ul>
				</section>
			</div>
    <div id="pageArticle">
    <main id="container" class="container layout_type01">
      <section class="content_header">
        <h2>연락처 / 주소</h2>
      </section>
          </main>
      <div>
        <article class="con_left">
          <p class="map_address" style="font-size: 22pt; padding-right: 50px;">
            서울특별시 강남구 역삼동&nbsp;테헤란로 124,&nbsp;&nbsp;4층
          </p>
          <a href="https://map.naver.com/v5/directions/-/14141106.440653425,4508862.342751,%EC%95%84%EC%9D%B4%ED%8B%B0%EC%9C%8C,36666135,PLACE_POI/-/transit?c=15,0,0,0,dh" 
          target="_blank" class="btn_styde01" title="가는길찾기">
            가는 길 찾기
          </a>
        </article>
      <!-- 오시는길 -->
      <section class="inner map_inner">
      <div class="articleCenter">
        <!-- 지도api 영역 -->
        <article class="map_wrap">
          <div class="map_bx" id="map" style="width: 800px; height: 500px; margin-left: 200px;"></div>
          <a href="https://map.naver.com/v5/directions/-/14141106.440653425,4508862.342751,%EC%95%84%EC%9D%B4%ED%8B%B0%EC%9C%8C,36666135,PLACE_POI/-/transit?c=15,0,0,0,dh" target="_blank"></a>
        </article>
        
        	<div class="information">
        <article class="con_right">
          <h4 class="con_sub_tit" style="font-size: 15pt;">지하철역</h4>
          <ol>
            <li>
              <img src="<%=cp %>/image/Subway.png" style="width: 20px;"> &nbsp; 2호선 <strong>역삼역 3번출구</strong> 도보 5분 거리
            </li>
            <li>
              <img src="<%=cp %>/image/Subway.png" style="width: 20px;"> &nbsp; 2호선 · 신분당선 <strong>강남역 1번출구</strong> 도보 4분 거리
            </li>
          </ol>
          <h4 class="con_sub_tit" style="font-size: 15pt;">버스정류장</h4>
          <ul>
            <li>
              <p></i><strong><img src="<%=cp %>/image/Bus.png" style="width: 20px;"> &nbsp; 강남역, 역삼세무서</strong> 146, 341, 360, 740, N13, N61</p>
            </li>
            <li>
              <p>
                <strong><img src="<%=cp %>/image/Bus.png" style="width: 20px;"> &nbsp; 강남역, 12번출구</strong>
                1100, 1700, 2000, 2000-1, 3002, 3007, <br/>
                3200, 3300, 3400, 7007, 9303, 8001
              </p>
            </li>
          </ul>
        </article>
       </div>
        </div>
        
        <!--// 지도api 영역 -->
      </section>
      
	</div>
  </div>
		<div id="pageFooter">
			<div class="content_p">
			<p>5조 조장 정상명씨의 애착인형에서 영감을 얻은 EGGPLANT BANK 입니다</p>
			<p>주소 : 강남구 테헤란로 삼원타워 4층 ITWILL 6강의실 맨뒷자리<p>
			<p>TEL : 010-2023-0726</p>
			</div>
		</div>
  </div>
  
  <script src="<%=cp%>/data/eggplantLink.js"></script>
  <script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=henz1zsech"></script>
  <script>
    var elluce = new naver.maps.LatLng(37.498763, 127.031720);
    var map = new naver.maps.Map('map', {
      center: elluce,
      zoom: 17,
      minZoom: 8,
      zoomControl: true,
      zoomControlOptions: {
        position: naver.maps.Position.TOP_RIGHT
      }
    });
    var marker = new naver.maps.Marker({
      icon: {
        url: "./icon/heart-icon.png",
        scaledSize: new naver.maps.Size(30, 37),
        origin: new naver.maps.Point(0, 0),
      },
      position: elluce,
      map: map
    });

    var contentString = [
      '<div class="iw_inner" style="padding:2px; margin: 2px 0px 8px 0px; width: 150px; height: 50px; text-align: center;">',
      '   <p style="font-size: 1.2rem; margin: 0;">Eggplant Bank</p>',
      '   <p style="font-size: 0.8rem; margin: 3;">서울특별시 강남구 역삼동<br/>테헤란로 124, 4층</p>',
      '</div>'
    ].join('');

    var infowindow = new naver.maps.InfoWindow({
      content: contentString,
      maxWidth: 200,
      height: 50,
      backgroundColor: "white",
      borderColor: "black",
      borderWidth: 2,
      disableAnchor: true,
      textAlign: "center",
      margin: "auto",
      pixelOffset: new naver.maps.Point(0, -5)
    });

    naver.maps.Event.addListener(marker, "click", function(e) {
      if (infowindow.getMap()) {
        infowindow.close();
      } else {
        infowindow.open(map, marker);
      }
    });

    infowindow.open(map, marker);
  </script>
</form>
</body>
</html>
