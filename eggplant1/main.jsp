<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
request.setCharacterEncoding("UTF-8");
String cp = request.getContextPath();
%>
<%
  Cookie[] ck  = request.getCookies();

  String popUrl = "";
  String strUrl, str;

  strUrl = "popup.do";
  str    = "window.open('" + strUrl + "', 'Think', ";
  str    = str + "'left=610, ";
  str    = str + "top=10, ";
  str    = str + "width=600, ";
  str    = str + "height=1000, ";
  str    = str + "toolbar=no, ";
  str    = str + "menubar=no, ";
  str    = str + "status=no, ";
  str    = str + "scrollbars=no, ";
  str    = str + "resizable=no')";

  popUrl = str;
  if(ck != null) {
	  for(Cookie c : ck) {
		 if(c.getName().equals("popup") && c.getValue().equals("no")) {
			 popUrl = "";
	         break;
		 }
	}
  }
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>여기를 왜 보세요</title>
<link rel="shortcut icon" href="<%=cp %>/image/LogoIcon.png" type="image/png"/>
<link rel="stylesheet" type="text/css" href="<%=cp%>/data/main.css"/>
<link rel="stylesheet" type="text/css" href="<%=cp%>/data/styleVideo.css"/>

<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<style type="text/css">
body{
font-family: NanumSquareAceb;
}
.col-lg-12 {
	position: relative;
	min-height: 1px;
	padding-right: 15px;
	padding-left: 15px;
	width:100%;
}
.row {
    margin-right: -15px;
    margin-left: -15px;
}
.navbar-transparent {
	background-color: transparent;
	background: transparent;
	border-color: transparent;
}

.hTextContanct{
	padding-top: 8%;
}

.slider{
width: 100%;
padding-top: 5%;
}
.slider input{display: none;}
.testimonials{
	display: flex;
	align-items: center;
	justify-content: center;
	position: relative;
	min-height: 500px;
	perspective: 1000px;
	overflow: hidden;
}
.testimonials .item{
	width: 350px;	
	padding: 30px;
	border-radius: 5px;
	background-color: black;
	position: absolute;
	border:3px solid white;
	top: 0;
	box-sizing: border-box;
	text-align: center;
	transition: transform 0.4s;
	box-shadow: 0 0 10px rgba(0,0,0,0.3);
	user-select: none;
	cursor: pointer;
	    height: 100%;
}
.testimonials .item h1{font-size: 114px; color: white;}
.dots{display: flex; justify-content: center;align-items: center;}
.dots label{
	height: 5px;
	width: 5px;
	border-radius: 50%;
	cursor: pointer;
	background-color: #413B52;
	margin: 7px;
	transition-duration: 0.2s;
}
#t-1:checked ~ .dots label[for="t-1"],
#t-2:checked ~ .dots label[for="t-2"],
#t-3:checked ~ .dots label[for="t-3"],
#t-4:checked ~ .dots label[for="t-4"],
#t-5:checked ~ .dots label[for="t-5"],
#t-6:checked ~ .dots label[for="t-6"]{
	transform: scale(2);
	background-color: #4E11F4;
	box-shadow: 0px 0px 0px 3px #dddddd24;
}

#t-1:checked ~ .dots label[for="t-2"],
#t-2:checked ~ .dots label[for="t-1"],
#t-2:checked ~ .dots label[for="t-3"],
#t-3:checked ~ .dots label[for="t-2"],
#t-3:checked ~ .dots label[for="t-4"],
#t-4:checked ~ .dots label[for="t-3"],
#t-4:checked ~ .dots label[for="t-5"],
#t-5:checked ~ .dots label[for="t-4"],
#t-5:checked ~ .dots label[for="t-6"],
#t-6:checked ~ .dots label[for="t-5"]{
	transform: scale(1.5);
}

#t-1:checked ~ .testimonials label[for="t-3"],
#t-2:checked ~ .testimonials label[for="t-4"],
#t-3:checked ~ .testimonials label[for="t-5"],
#t-4:checked ~ .testimonials label[for="t-6"],
#t-5:checked ~ .testimonials label[for="t-1"],
#t-6:checked ~ .testimonials label[for="t-2"]{
	transform: translate3d(600px, 0, -180px) rotateY(-25deg);
	z-index: 2;
}

#t-1:checked ~ .testimonials label[for="t-2"],
#t-2:checked ~ .testimonials label[for="t-3"],
#t-3:checked ~ .testimonials label[for="t-4"],
#t-4:checked ~ .testimonials label[for="t-5"],
#t-5:checked ~ .testimonials label[for="t-6"],
#t-6:checked ~ .testimonials label[for="t-1"]{
	transform: translate3d(300px, 0, -90px) rotateY(-15deg);
	z-index: 3;
}

#t-2:checked ~ .testimonials label[for="t-1"],
#t-3:checked ~ .testimonials label[for="t-2"],
#t-4:checked ~ .testimonials label[for="t-3"],
#t-5:checked ~ .testimonials label[for="t-4"],
#t-6:checked ~ .testimonials label[for="t-5"],
#t-1:checked ~ .testimonials label[for="t-6"]{
	transform: translate3d(-300px, 0, -90px) rotateY(15deg);
	z-index: 3;
}

#t-3:checked ~ .testimonials label[for="t-1"],
#t-4:checked ~ .testimonials label[for="t-2"],
#t-5:checked ~ .testimonials label[for="t-3"],
#t-6:checked ~ .testimonials label[for="t-4"],
#t-2:checked ~ .testimonials label[for="t-6"],
#t-1:checked ~ .testimonials label[for="t-5"]{
	transform: translate3d(-600px, 0, -180px) rotateY(25deg);
	
}

#t-1:checked ~ .testimonials label[for="t-1"],
#t-2:checked ~ .testimonials label[for="t-2"],
#t-3:checked ~ .testimonials label[for="t-3"],
#t-4:checked ~ .testimonials label[for="t-4"],
#t-5:checked ~ .testimonials label[for="t-5"],
#t-6:checked ~ .testimonials label[for="t-5"],
#t-6:checked ~ .testimonials label[for="t-6"]{
	
	z-index: 4;
}


.containerAbout {
  width: 90%;
  max-width: 1100px;
  margin: auto;
}

/* Nav */
.main-nav {
  display: flex;
  align-items: center;
  justify-content: space-between;
  height: 60px;
  padding: 20px 0;
  font-size: 13px;
}

.main-nav .logo {
  width: 110px;
}

.main-nav ul {
  display: flex;
}

.main-nav ul li {
  padding: 0 10px;
}

.main-nav ul li a {
  padding-bottom: 2px;
}

.main-nav ul li a:hover {
  border-bottom: 2px solid #262626;
}

.main-nav ul.main-menu {
  flex: 1;
  margin-left: 20px;
}

.showcase {
  width: 100%;
  height: 400px;
  background: url('<%=cp %>/image/banner2.png') no-repeat center center/cover;
  display: flex;
  flex-direction: column;
  align-items: center;
  text-align: center;
  justify-content: flex-end;
  padding-bottom: 50px;
  margin-bottom: 20px;
}

.showcase {
	width: 100%;
    height: 300px;
    background: url(/semiProject/image/banner2.png) no-repeat center center/cover;
    display: flex;
    flex-direction: column;
    align-items: center;
    text-align: center;
    justify-content: flex-end;
    padding-bottom: 50px;
}


.showcase h2, .showcase p {
  margin-bottom: 10px;
  font-size: 22px;
}

/* Home cards */
.home-cards {
  display: grid;
  grid-template-columns: repeat(4, 1fr);
  grid-gap: 20px;
  margin-bottom: 40px;
}

.home-cards img {
  width: 100%;
  margin-bottom: 20px;
}

.home-cards h3 {
  margin-bottom: 5px;
}

.home-cards a {
  display: inline-block;
  padding-top: 10px;
  color: #0067b8;
  text-transform: uppercase;
  font-weight: bold;
}

.home-cards a:hover i {
  margin-left: 10px;
}

.xbox .content {
  width: 40%;
  padding: 50px 0 0 30px;
}

.xbox p, .carbon p {
  margin: 10px 0 20px;
}


</style>

</head>
<body onload="<%=popUrl%>" id="page-body" data-spy="scroll" data-target=".navbar-fixed-top">
	<section id="main">
	<div class="sp-container">
		<div class="sp-content">
			<div class="sp-globe"></div>
			<h2 class="frame-1">Enjoy  Guarantee  Great</h2>
			<h2 class="frame-2">Practice  Like  Aattracted  Need  Trust</h2>
			<h2 class="frame-3">당신의 미래를 함께</h2>
			<h2 class="frame-4">더 나은 내일을 위한 은행</h2>
			<h2 class="frame-5">
				<span>EGG</span>
				<span>PLANT</span>
				<span>BANK</span>
			</h2>
		</div>
	</div>
	<div class="scroll-downs">
		<div class="mousey">
			<div class="scroller"><p class="scroller-text">scroll<p></div>
		</div>
	</div>
	<video id="video_p" class="video-js vjs-default-skin" preload="auto" autoplay loop muted> 
	<source src="<%=cp%>/eggplant1/videos/2.mp4" type="video/mp4" /> </video>
	</section>
	<!-- Navigation -->
    <nav class="navbar navbar-default navbar-transparent navbar-fixed-top" role="navigation">
        <div class="container">
            <div class="navbar-header page-scroll">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-ex1-collapse">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
            </div>
			
            <!-- Collect the nav links, forms, and other content for toggling -->
            <div class="collapse navbar-collapse navbar-ex1-collapse">
            <header id="header" class="menu hidden">
            <div class="hbody"> <a href="<%=cp %>/eggplant/main.do"><img src="<%=cp%>/image/sideLogo.png" style="width: 150px; height: 50px; display: inline-block; position: relative;" /></a>
				<ul id="menu">
					<c:if test="${empty customInfo}">
					<li class="menu_item1 title-li"><a href="<%=cp %>/eggplant/login.do" class="link">뱅킹</a></li>
					<li class="menu_item1"><a href="<%=cp %>/eggplant/card.do" class="link">카드</a></li>
					<li class="menu_item1"><a href="<%=cp %>/eggplant/login.do" class="link">상품 서비스</a></li>
					<li class="menu_item1"><a onclick="sendExchange();" class="link">환율</a></li>
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
				</div>
				</header>
            </div>
            <!-- /.navbar-collapse -->
        </div>
        <!-- /.container -->
    </nav>

    <!-- Intro Section -->
    <section id="intro" class="intro-section">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">

				<div class="textContainer">
					<div class="moveText">
						<div class='console-container'>
							<span id='text'>안녕하십니까.</span>
							<div class='console-underscore' id='console'></div>
						</div>

					</div>
				</div>


			</div>
            </div>
        </div>
    </section>

    <!-- About Section -->
    <section id="about" class="about-section">
       
 <div class="menu-btn">
    <i class="fas fa-bars fa-2x"></i>
  </div>

  <div class="containerAbout">
    <!-- Nav -->
    <nav class="main-nav">
      <img src="">


      <ul class="right-menu">
        <li>
          <a href="#">
            <i class="fas fa-search"></i>
          </a>
        </li>
        <li>
          <a href="#">
            <i class="fas fa-shopping-cart"></i>
          </a>
        </li>
      </ul>
    </nav>

    <!-- Showcase -->
    <div class="showcase">
      <h2>OUR EGGPLANT BANK</h2>
      <p>
       한 사람, 한 사람을 위해 시작한 은행이 더 많은 사람들이 찾는 모두의 은행이 되었습니다.<br/>
       한 사람에서 시작해 모두가 찾는 은행이 될 때까지, 여러분과 함께 하겠습니다.      
      </p>
	</div>
    <!-- Home cards 1 -->
    <section class="home-cards">
      <div>
        <img src="<%=cp %>/image/송금.png" alt="" width="50px" />
        <h3>이체</h3>
        <p style="color: #828181;">
          원하시는 시간에, 원하시는 분에게 송금하세요. 저희 EGGPLANT BANK만의 특별한 보안으로 안전하게!
        </p>
      </div>
      <div>
        <img src="<%=cp %>/image/대출.png" alt="" width="70px">
        <h3>환율 조회</h3>
        <p style="color: #828181;">
          여행이 주는 설레임, 최대 95% 환율 우대! 저희 EGGPLANT BANK의 실시간 환율 조회 서비스를 이용해보세요.
        </p>
      </div>
      <div>
        <img src="<%=cp %>/image/환율.png" alt="">
        <h3>대출</h3>
        <p style="color: #828181;">
          한도는 더 높게! 금리는 더 낮게! 복잡한 대출 너무 어려우셨다고요? 저희 EGGPLANT BANK에서 실시간 대출가능 금액을 확인하세요.
        </p>
      </div>
      <div>
        <img src="<%=cp %>/image/게시판.png" alt="" width="100px" >
        <h3>게시판</h3>
        <p style="color: #828181;">
          저희 EGGPLANT BANK에 궁금하신 점이 있으시다면 AI채팅봇 '여러가지'와 자주 묻는 질문게시판을 이용해서 궁금한 점을 해결하세요! 
        </p>
      </div>
    </section>
    </section>

    <!-- Services Section -->
  <section id="service">
  
  <div>
    <div class="services-content">
  <c:if test="${empty customInfo}">
  <div class="services-item">
    <h1>뱅킹</h1>
    <font size="4"><p>이체 및 예약 이체</p></font>
   <a href='<%=cp %>/eggplant/login.do'> <img src="<%=cp %>/image/banking.jpg" alt="Image 1"></a>
  </div>
 </c:if>
 
 <c:if test="${not empty customInfo}">
 <div class="services-item">
    <h1>뱅킹</h1>
    <font size="4"><p>이체 및 예약 이체</p></font>
   <a href='<%=cp %>/eggplant/reservation.do'> <img src="<%=cp %>/image/banking.jpg" alt="Image 1"></a>
  </div>
 </c:if>
 
 
 
  <c:if test="${empty customInfo}">
  <div class="services-item">
    <h1>상품 서비스</h1>
   <font size="4"><p>대출</p></font>
    <a href='<%=cp %>/eggplant/login.do'><img src="<%=cp %>/image/loan.jpg" alt="Image 1"></a>
  </div>
  </c:if>
 
 
 
 <c:if test="${not empty customInfo}">
  <div class="services-item">
    <h1>상품 서비스</h1>
   <font size="4"><p>대출</p></font>
    <a href='<%=cp %>/eggplant/loan.do'><img src="<%=cp %>/image/loan.jpg" alt="Image 1"></a>
  </div>
  </c:if>
  <div class="services-item">
    <h1>환율</h1>
    <font size="4"><p>실시간 환율 정보</p></font>
    <a onclick="sendExchange();"><img src="<%=cp %>/image/exchange.jpg" alt="Image 1"></a>
  </div>
  <div class="services-item">
    <h1>고객센터</h1>
    <font size="4"><p>Q&A 및 챗봇 상담</p></font>
     <a href='<%=cp %>/eggplant/board.do'> <img src="<%=cp %>/image/qa2.jpg" alt="Image 1"></a>
  </div>
</div>
</section>

    <!-- Contact Section -->
	<section id="contact" class="contact-section">
	
	<div class="test">
	 <h1 class="hTextContanct">독수리 5조 소개</h1>
	<div class="slider">
	<input type="radio" name="testimonial" id="t-1">
	<input type="radio" name="testimonial" id="t-2">
	<input type="radio" name="testimonial" id="t-3" checked>
	<input type="radio" name="testimonial" id="t-4">
	<input type="radio" name="testimonial" id="t-5">
	<input type="radio" name="testimonial" id="t-6">
	<div class="testimonials">
		<label class="item" for="t-1">
			<video class="video-js vjs-default-skin videoEgg" preload="auto" autoplay loop muted style="width: 10px; height: 10px; background-color: black;">
			   	 <source src="<%=cp%>/eggplant1/videos/JHG2.mov" type="video/mp4" />
			  	</video>
		</label>
		<label class="item" for="t-2">
			<video class="video-js vjs-default-skin videoEgg" preload="auto" autoplay loop muted style="width: 10px; height: 10px; background-color: black;">
			   	 <source src="<%=cp %>/eggplant1/videos/EJS9.MOV" type="video/mp4" />
			  	</video>
		</label>
		<label class="item" for="t-3">
			<video class="video-js vjs-default-skin videoEgg" preload="auto" autoplay loop muted style="width: 10px; height: 10px; background-color: black;">
			   	 <source src="<%=cp %>/eggplant1/videos/JSM2.mov" type="video/mp4" />
			  	</video>
		</label>
		<label class="item" for="t-4">
			<video class="video-js vjs-default-skin videoEgg" preload="auto" autoplay loop muted style="width: 10px; height: 10px; background-color: black;">
			   	 <source src="../eggplant1/videos/LES4.mov" type="video/mp4" />
			  	</video>
		</label>
		<label class="item" for="t-5">
			<video class="video-js vjs-default-skin videoEgg" preload="auto" autoplay loop muted style="width: 10px; height: 10px; background-color: black;">
			   	 <source src="<%=cp %>/eggplant1/videos/LSW3.mov" type="video/mp4" />
			  	</video>
		</label>
		<label class="item" for="t-6">
			<video class="video-js vjs-default-skin videoEgg" preload="auto" autoplay loop muted style="width: 10px; height: 10px; background-color: black;">
			   	 <source src="<%=cp %>/eggplant1/videos/KYJ10.MOV" type="video/mp4" />
			  	</video>
		</label>
	</div>
	<br/>
	<div class="dots">
		<label for="t-1"></label>
		<label for="t-2"></label>
		<label for="t-3"></label>
		<label for="t-4"></label>
		<label for="t-5"></label>
		<label for="t-6"></label>
	</div>
</div>
	</div>

	</section>




<script src="<%=cp%>/data/eggplant.js"></script>
<script src="<%=cp%>/data/eggplantLink.js"></script>
<script src="http://vjs.zencdn.net/c/video.js"></script>
<script type="text/javascript">

let wheelLocked = false;
let idx = 0;
let m = -100;
function moveIDx(m){
	let idLength = ['main', 'intro', 'about', 'service', 'contact'];
	  if (idLength.length - 1 < idx) {
	    idx = idLength.length - 1;
	  }
	  let targetPosition = document.querySelector('#' + idLength[idx]).offsetTop
		window.scrollTo({ top: (targetPosition), left: 0, behavior: 'smooth' });
		
	}

	window.addEventListener("wheel", function(e) {
		   // 휠 잠금 상태인 경우 이벤트를 무시
	      if (wheelLocked) {
	    	e.preventDefault();
	        return;
	      }
			
	      if (e.deltaY === -100) {
	    	  // 휠 위로 
	    	  wheelLocked = true;
	        idx--;
	    	m = 100;
	      } else if (e.deltaY === 100) {
	    	  // 휠 아래로
	    	  wheelLocked = true;
	        idx++;
	    	m = -100;
	      }

	      if (idx < 0) {
	        idx = 0;
	      }
	      // 예시로 moveIDx 함수를 호출하고 idx 값을 전달하는 로직을 넣습니다.
	      moveIDx(m);

	      // 휠 이벤트 핸들러에서 휠 동작을 잠시 잠금
	      setTimeout(() => {
		        wheelLocked = false;
		      }, 500);
	      
	},{ passive: false });
	

</script>

</body>
</html>
