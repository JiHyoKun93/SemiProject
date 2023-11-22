<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>룰렛</title>

<link href="https://hangeul.pstatic.net/hangeul_static/css/nanum-square.css" rel="stylesheet">

  
  <meta charset="UTF-8">
  	

    <link rel="apple-touch-icon" type="image/png" href="https://cpwebassets.codepen.io/assets/favicon/apple-touch-icon-5ae1a0698dcc2402e9712f7d01ed509a57814f994c660df9f7a952f3060705ee.png">

    <meta name="apple-mobile-web-app-title" content="CodePen">

    <link rel="shortcut icon" type="image/x-icon" href="https://cpwebassets.codepen.io/assets/favicon/favicon-aec34940fbc1a6e787974dcd360f2c6b63348d4b1f4e06c77743096d55480f33.ico">

    <link rel="mask-icon" type="image/x-icon" href="https://cpwebassets.codepen.io/assets/favicon/logo-pin-b4b4269c16397ad2f0f7a01bcdf513a1994f4c94b8af2f191c09eb0d601762b1.svg" color="#111">



  
  <title>CodePen - roulette jquery event source이벤트 소스.</title>
    <link rel="canonical" href="https://codepen.io/pong777/pen/zVvjjg">
  
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/5.0.0/normalize.min.css">

  
  
<style>
@font-face { font-family: 'GmarketSansMedium'; src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2001@1.1/GmarketSansMedium.woff') format('woff'); font-weight: normal; font-style: normal; }


.eggButton {
  width: 140px;
  height: 45px;
  font-family: NanumSquareAceb;
  font-size: 15px;
  text-transform: uppercase;
  letter-spacing: 2.5px;
  font-weight: 500;
  color: #000;
  background-color: #fff;
  border: none;
  border-radius: 45px;
  /* box-shadow: 0px 8px 15px rgba(0, 0, 0, 0.1); */
  transition: all 0.3s ease 0s;
  cursor: pointer;
  outline: none;
  }

.eggButton:hover {
  background-color: #F5D6FF;
  color: #fff;
  transform: translateY(-3px);
}

#wrap{  background-color:#ffffff;  position: relative; overflow: hidden;}
#wrap #gameContainer{width:508px; height:671px; text-align: center; position: relative;margin:0px auto;}
#wrap #gameContainer h1{}
#wrap #gameContainer .obj{position: absolute;}
#wrap #gameContainer .board_start{  
    padding: 1px;
    background: #B8CDFF;
    text-align: center;
    vertical-align: middle; 
  line-height: 150px; 
  border: 1px solid #fff;
    color: #fff;   
    background: #B8CDFF;
    text-align: center;
    vertical-align: middle;
    font-weight: bold;
    font-family:'NanumSquare';
    font-size: 25px;
    margin-left: 10px;
    margin-top: 8px;
position:absolute; left:165px; top:210px;z-index:9; width:150px; border-radius:100px;}
#wrap #gameContainer .board_start
img{width:100%;}
#wrap #gameContainer .board_bg{width:508px; height:508px; top:40px; left:0px; z-index: 2;}
#wrap #gameContainer .board_bg img{width:100%;}
#wrap #gameContainer .board_on{width:508px; height:508px; top:40px; left:0px; z-index: 3; background-image: url('//img.babathe.com/upload/specialDisplay/htmlImage/2019/test/roulette_circle_bg.png');    background-size: 508px;
}
#wrap #gameContainer .board_on img{position:absolute; width:100px;top:115px; height:100px;}
#wrap #gameContainer .board_on img:nth-child(1){    left: 55px;  transform: rotate( -60deg );  top: 120px;}
#wrap #gameContainer .board_on img:nth-child(2){left: 62px;  transform: rotate( -113deg );  top: 286px;  }
#wrap #gameContainer .board_on img:nth-child(3){  left: 208px;  top: 372px; transform: rotate(-180deg);}  
#wrap #gameContainer .board_on img:nth-child(4){left: 351px; top: 286px;  transform: rotate(-245deg);}
#wrap #gameContainer .board_on img:nth-child(5){ left: 351px;  top: 125px;  transform: rotate(-292deg);   }
#wrap #gameContainer .board_on img:nth-child(6){  left: 205px;  top: 42px;  transform: rotate(5deg); }  

#wrap #gameContainer .obj.board_arrow{width:90px; height:105px; top:0px; left:195px; z-index: 5;}
#wrap #gameContainer .char1{width:259px; height:246px; top:400px; left:90px; z-index: 1;}
#wrap #gameContainer .char2{width:175px; height:198px; top:449px; left:600px; z-index: 1;}
#wrap #gameContainer .char3{width:112px; height:108px; top:540px; left:550px; z-index: 3;}
#wrap #gameContainer .txt1{width:420px; height:30px; bottom:20px; left:260px; z-index: 3;}

.popup {display: none; position: fixed; left: 50%; z-index: 99999; text-align: center; background:#fff; font-size:20px; color:#000;}
#fade {display: none;background: #000;position: fixed;left: 0;top: 0;width: 100%;height: 100%;opacity: .60;z-index: 9999;}
#popup_gift{width:475px; height:505px; top:120px;}
#popup_gift .lottery_present {text-align:center;}
#popup_gift .lottery_present img{ display:block; margin: 50px auto 30px;}

#popup_fail{width:475px; height:505px; top:120px;}
.popup  .close{ display:inline-block; width:150px; hegiht:50px; line-height:50px; color:#fff; background:#333; margin: 30px 0 0;}
</style>

  <script>
  window.console = window.console || function(t) {};
</script>


</head>

<body translate="no">

<br/><br/><br/><br/>
<div style="text-align: center;">
<font style="font-family:'NanumSquareExtraBold'; font-size: 20pt;">'시작' 버튼을 눌러 </font>
<font style="font-family:'NanumSquareExtraBold'; font-size: 20pt;" color="#97ABEB">에그머니</font>
<font style="font-family:'NanumSquareExtraBold'; font-size: 20pt;">를 받아보세요!</font>
<br/><br/>
<font color="#BABABA" style="font-family:'NanumSquare';">(에그머니는 랜덤기능을 통해 동일한 확률로 지급됩니다.)</font>
</div>

<br/><br/>

  <div id="wrap">
<div id="gameContainer">	
			  <div class="board_start join" style="cursor: pointer;">시   작</div>
				<div class="board_on obj" style="transform: matrix3d(-0.63233, -0.774699, 0, 0, 0.774699, -0.63233, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1);">
				<img src="<%=cp %>/image/money1.png">
				<img src="<%=cp %>/image/money2.png">
				<img src="<%=cp %>/image/money3.png">
				<img src="<%=cp %>/image/money4.png">
				<img src="<%=cp %>/image/money5.png">
				<img src="<%=cp %>/image/money6.png"></div>
				
			
</div>
<div id="popup_gift" class="popup" style="font-family: 'NanumSquareAcr';">
	<div class="lottery_present"></div>
	<br/><br/>
		 <form action="" method="post" id="myForm" name="myForm" >
		 <button class="eggButton" onclick="sendIt();" value="닫기" style="width: 100px; height: 50px;">
		 <font style="font-family: 'NanumSquareAcr'">닫기</font></button>
		 
     
        
       
        <input type="hidden" name="point" id="pointInput">
        </form>
        
</div>
</div>
    <script src="https://cpwebassets.codepen.io/assets/common/stopExecutionOnTimeout-2c7831bb44f98c1391d6a4ffda0e1fd302503391ca806e7fcc7b9b87197aec26.js"></script>

  <script src="https://cdnjs.cloudflare.com/ajax/libs/gsap/2.1.3/easing/EasePack.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/gsap/2.1.3/TweenLite.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/gsap/2.1.3/plugins/CSSPlugin.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  

      <script id="rendered-js">
      var gift;
      var present = [10, 100, 40, 400, 1000, 3];
      
      function sendIt() {
   	   
     	  var point = present[gift];
     	f = document.myForm;
     	  // form의 input 태그에 point 값을 설정
     	  document.getElementById("pointInput").value = point;
     	  
    		f.action = "<%=cp%>/eggplant/eggmoney_ok.do";
    		f.submit();
     	}
      
$(document).ready(function () {
 
  iniGame = function (num) {
    gift = num;
    TweenLite.killTweensOf($(".board_on"));
    TweenLite.to($(".board_on"), 0, { css: { rotation: rotationPos[gift] } });
    TweenLite.from($(".board_on"), 5, { css: { rotation: -3000 }, onComplete: endGame, ease: Sine.easeOut });
    console.log("gift 숫자 : " + (gift + 1) + "rotationPos" + rotationPos);
  };

  var rotationPos = new Array(60, 120, 180, 240, 300, 360);

  TweenLite.to($(".board_on"), 360, { css: { rotation: -4000 }, ease: Linear.easeNone });
  function endGame() {
    var copImg = "<%=cp %>/image/money_" + (gift + 1) + ".png";
    console.log("이미지 : " + copImg);

    $("#popup_gift .lottery_present").text(function () {return "축하드립니다. " + present[gift] +  "포인트 당첨 되셨습니다.";});
    $('<img  src="' + copImg + '" />').prependTo("#popup_gift .lottery_present");
    setTimeout(function () {openPopup("popup_gift");}, 1000);
  }

  $(".popup .btn").on("click", function () {
    location.removedByCodePen();
  });
  function openPopup(id) {
    closePopup();
    $('.popup').slideUp(0);
    var popupid = id;
    $('body').append('<div id="fade"></div>');
    $('#fade').css({
      'filter': 'alpha(opacity=60)' }).
    fadeIn(300);
    var popuptopmargin = $('#' + popupid).height() / 2;
    var popupleftmargin = $('#' + popupid).width() / 2;
    $('#' + popupid).css({
      'margin-left': -popupleftmargin });

    $('#' + popupid).slideDown(500);
  }
  function closePopup() {
    $('#fade').fadeOut(300, function () {
      // $(".player").html('');
    });
    $('.popup').slideUp(400);
    return false;
  }
  $(".close").click(closePopup);

});



$(function () {
  var clicked = 0;
  for (i = 1; i < 7; i++) {if (window.CP.shouldStopExecution(0)) break;
    // 상품쪽 이미지는 신경 안쓰셔도 됩니다!! 책임님!!!
    var pictures = "http://img.babathe.com/upload/specialDisplay/htmlImage/2019/test/coupon" + i + ".png";
   // $(".board_on").append('<img  src="' + pictures + '" />');
  }window.CP.exitedLoop(0);

  $(".join").on("mousedown", function () {
    if (clicked <= 0) {iniGame(Math.floor(Math.random() * 6));} else
    if (clicked >= 1) {event.preventDefault();alert("이미 참여한 이벤트입니다.");}
    clicked++;
  });
});
//# sourceURL=pen.js
    </script>


</body>
</html>