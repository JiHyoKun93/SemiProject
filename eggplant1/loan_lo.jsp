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
<title>자격 검사중...</title>
<link rel="shortcut icon" href="<%=cp %>/image/LogoIcon.png" type="image/png"/>
<style type="text/css">

html {
  background: white;
}


@-webkit-keyframes flap-r {
  0%,10%   { 	border-top-width: 60px; }
  40%,60%  { 	border-top-width: 10px; }
  100%     { 	border-top-width: 60px; }
}

@-webkit-keyframes flap-l {
  0%       { 	border-bottom-width: 0px; }
  40%,60%  { 	border-bottom-width: 40px; }
  100%     { 	border-bottom-width: 0px; }
}

@-webkit-keyframes fly {
  0%   { 	left: 0%; top:100px;-webkit-transform:scale3d(0.5,0.5,1) }
  100% { 	left: 100%; top:100px; -webkit-transform:scale3d(1,1,1) }
}

@-webkit-keyframes bob {
  0%   { 	top: 25px; }
  50%   { 	top: 0px; }
  100% { 	top: 25px; }
}

#pictureframe {
  position:relative;
  width:100px;
  margin-top:100px;
  -webkit-animation: fly 3.5s infinite linear;
}

#shadow {
  position:absolute;
  width: 0px; height: 0px; 
  top: 140px; left: 00px;
  border-width: 10px;
  border-left-width:50px;
  border-top-width:0px;
  border-right-width: 40px;
  border-color: transparent;
  border-bottom-color: rgba(210,210,210,0.6);
  border-style:solid;
  -webkit-filter: blur(5px);
}

#shadow:after {
  content: " ";
  position:absolute;
  width: 00px; height: 0px; 
  top: 10px; left: -50px;
  border-width: 10px;
  border-left-width:50px;
  border-bottom-width:0px;
  border-right-width: 40px;
  border-color: transparent;
  border-top-color: rgba(210,210,210,0.6);
  border-style:solid;
}

#bird div {
  position:absolute;
}

#bird { 
  position:absolute;
  -webkit-animation: bob 0.7s infinite cubic-bezier(0.7, 0.7, 0.1, 0.4);
 }


#body1,#body2,#wing-l,#wing-r {
  	width: 0px; height: 0px;
    border-color: transparent;
    border-style: solid;
}
#body1 {
	border-width: 15px; 
  border-left-width:25px;
  border-top-width:15px;
  border-right-width: 55px;
  border-top-color: #333;
}

#body2 { 
  left: 50px; bottom: 0px;
	border-width: 10px; 
  border-left-width:5px;
  border-top-width:0px;
  border-right-width: 15px;
  border-bottom-color: #777;
}

#wing-l {
  left: 22px; bottom: 0px; 
	border-width: 60px; 
  border-left-width:20px;
  border-top-width:0px;
  border-right-width: 6px;
  border-bottom-color: #444;
  -webkit-animation: flap-l 0.7s infinite; 
}

#wing-r {
  left: 22px; top:0px;
	border-width: 60px; 
  border-left-width:20px;
  border-bottom-width:0px;
  border-right-width: 6px;
  border-top-color: #777;
  -webkit-animation: flap-r 0.7s infinite; 
}


#caption a {
  position:absolute;
  font-family: courier;
  left:10px; bottom:10px;
  color: #444;
}


</style>

</head>
<body>
<form action="" method="post" name="myForm">
<div id="pictureframe">
  <div id="bird">
    <div id="body2"></div>
    <div id="body1"></div>
    <div id="wing-l"></div>  
    <div id="wing-r"></div>  
  </div>
  <div id="shadow"></div>
</div>

<input type="hidden" name="property" value="${property }"/>
<input type="hidden" name="loans" value="${loans }"/>
</form>



<script type="text/javascript">
function redirectToOtherPage() {
	
	f = document.myForm;
	f.action = "<%=cp%>/eggplant/loan_ok.do"
	f.submit();
  }

  // n초 후에 redirectToOtherPage 함수를 실행합니다.
  setTimeout(redirectToOtherPage, 2500); 
</script>
</body>
</html>