<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>이체 완료</title>
<link rel="stylesheet" type="text/css" href="<%=cp %>/data/reservation_ok.css" />
<link href="http://vjs.zencdn.net/c/video-js.css" rel="stylesheet" />
<link rel="shortcut icon" href="<%=cp %>/image/LogoIcon.png" type="image/png"/>
</head>
<body>

	<form action="" name="myForm" method="post">
	
		<div id="container">
			<div id=pageHeader>
				<section class="hbody"> 
				<img src="<%=cp %>/image/sideLogo.png" style="width: 150px; height: 50px; display: inline-block; position: relative;" />
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
			<div id="mainArticle">

				<div class="email-container row">
					<div class="col-sm-6 blue z-depth-2">
						<img class="logo" src="<%=cp%>/image/mainLogo.png" />
						<h6 class="brand--subHeading">계좌이체 완료</h6>
					</div>
					<div class="col-sm-6 white z-depth-2">
						<p class="brand-icon textRight header">${sendTime }</p>
						<div class="divider"></div>
						<ul class="collection">
							<li class="collection--item">
								<p class="item--name">타 겟</p> <b class="item--cost">${targetName }</b>
							</li>
							<li class="collection--item">
								<p class="item--name">금 액</p> <b class="item--cost">${sendSaving }</b>
							</li>
							<li class="collection--item">
								<p class="total">잔 액</p>
								<p class="total--cost">${afterSavings }</p>
							</li>
						</ul>
					</div>
				</div>
				<div class="button_div">
				<button class="button button--isi button--text-thick button--text-upper button--size-s" onclick="sendAccount();"><i class="button__icon icon icon-box"></i><span>돌아가기</span></button>
				</div>
			</div>
			<input type="hidden" name="userAccount" value="${userAccount }">
			<input type="hidden" name="search" value="">
				<div id="pageFooter">
					<div class="content_p">
						<p>5조 조장 정상명씨의 애착인형에서 영감을 얻은 EGGPLANT BANK 입니다</p>
						<p>주소 : 강남구 테헤란로 삼원타워 4층 ITWILL 6강의실 맨뒷자리
						<p>
						<p>TEL : 010-2023-0726</p>
					</div>
				</div>
			</div>
			
</form>
<script src="<%=cp%>/data/eggplantLink.js"></script>
<script type="text/javascript">
	function sendAccount() {
		f = document.myForm;
		f.action = "<%=cp%>/eggplant/accountCheck.do";
		f.submit();
	}
	
</script>

</body>
</html>