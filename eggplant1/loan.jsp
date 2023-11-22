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
<title>Eggplant Bank : 대출</title>
<link rel="shortcut icon" href="<%=cp %>/image/LogoIcon.png" type="image/png"/>
<link rel="stylesheet" href="<%=cp%>/data/loan1.css"/>

<script type="text/javascript" src="<%=cp%>/member/js/util.js"></script>
<script type="text/javascript">
	
	function sendIt() {
		
		var f = document.myForm;
		
		str = f.property.value;
		str = str.trim();
		if(!str){
			alert("자산현황을 입력하세요.");
			f.property.focus();
			return;
		}
		f.property.value = str;

		f.action = "<%=cp%>/eggplant/loan_lo.do";
		f.submit();
	}
</script>


</head>
<body>


<head>
  <meta charset="utf-8">
  <title>Eggplant Bank: credit</title>
  <link rel="stylesheet" type="text/css" href="style.css">
</head>


<body>
<form action="" method="post" name="myForm">
  <div class="login-root">
    <div class="box-root flex-flex flex-direction--column" style="min-height: 100vh;flex-grow: 1;">
      <div class="loginbackground box-background--white padding-top--64">
        <div class="loginbackground-gridContainer">
          <div class="box-root flex-flex" style="grid-area: top / start / 8 / end;">
            <div class="box-root" style="background-image: linear-gradient(white 0%, rgb(247, 250, 252) 33%); flex-grow: 1;">
            </div>
          </div>
          <div class="box-root flex-flex" style="grid-area: 4 / 2 / auto / 5;">
            <div class="box-root box-divider--light-all-2 animationLeftRight tans3s" style="flex-grow: 1;"></div>
          </div>
          <div class="box-root flex-flex" style="grid-area: 6 / start / auto / 2;">
            
			<div class="box-root box-background--blue800 animationLeftRight tans3s" style="flex-grow: 1;"></div>
          </div>
          <div class="box-root flex-flex" style="grid-area: 7 / start / auto / 4;">
            <div class="box-root box-background--blue animationLeftRight" style="flex-grow: 1;"></div>
          </div>
          <div class="box-root flex-flex" style="grid-area: 8 / 4 / auto / 6;">
            <div class="box-root box-background--gray100 animationLeftRight tans3s" style="flex-grow: 1;"></div>
          </div>
          <div class="box-root flex-flex" style="grid-area: 2 / 15 / auto / end;">
            <div class="box-root box-background--cyan200 animationRightLeft tans4s" style="flex-grow: 1;"></div>
          </div>
          <div class="box-root flex-flex" style="grid-area: 3 / 14 / auto / end;">
            <div class="box-root box-background--blue animationRightLeft" style="flex-grow: 1;"></div>
          </div>
          <div class="box-root flex-flex" style="grid-area: 4 / 17 / auto / 20;">
            <div class="box-root box-background--gray100 animationRightLeft tans4s" style="flex-grow: 1;"></div>
          </div>
          <div class="box-root flex-flex" style="grid-area: 5 / 14 / auto / 17;">
            <div class="box-root box-divider--light-all-2 animationRightLeft tans3s" style="flex-grow: 1;"></div>
          </div>
        </div>
      </div>
      <div class="box-root padding-top--24 flex-flex flex-direction--column" style="flex-grow: 1; z-index: 9;">
        <div class="box-root padding-top--48 padding-bottom--24 flex-flex flex-justifyContent--center">
          <h1><a href="<%=cp%>/eggplant/main.do" rel="dofollow">Eggplant Bank</a></h1>
        </div>
        <div class="formbg-outer">
          <div class="formbg">
          
          
            <div class="formbg-inner padding-horizontal--48">
              <span class="padding-bottom--15">대출 확인 정보 입력</span><br/>
             
              
              
              
                
                 <div class="field padding-bottom--24">
                  <label for="ID">자산규모</label>
                  <input type="text" name="property" size="35" maxlength="50" placeholder="' , '제외 숫자만 입력" />
                </div>
                
               <div class="field padding-bottom--24">
                  <label for="ID">대출현황</label>
                 <input type="text" name="loans" size="35" maxlength="50" placeholder="' , '제외 숫자만 입력" />
                </div>


 				<input type="hidden" name="userId" value="${dto.userId}">

                <div class="field padding-top--24">
                  <input type="submit" name="submit" value="심사 시작" onclick="sendIt();">
                </div>
             
            </div>
          </div>
          <div class="footer-link padding-top--24">
          
            <div class="listing padding-top--24 padding-bottom--24 flex-flex center-center">
              <span>© Eggplant Bank | </span>
              <span>&nbsp;Contact | </span>
              <span>&nbsp;Privacy & terms</span>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
  </form>
</body>
</html>

