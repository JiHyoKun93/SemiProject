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
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="<%=cp %>/data/card.css" />
<link rel="stylesheet" type="text/css" href="<%=cp %>/data/basic.css" />


<script type="text/javascript">

var cc = ""
var iAddCard = "0";//카드비교
var sImgList 	= new Array();//카드비교이미지
var sCodeList	= new Array();//카드비교코드
var sCodeNMList = new Array();//카드비교카드명
var iCount = 0;//혜택별 선택수
var sPopupYN = '';
var objTimeout;
var sPremList 	= new Array();//혜택별
var sSelected = new Array();
var crdtCdYN = '1';
var se = '1';
var crdtCdYN = '1';
var selSex = '1';
var selAge = '1';

var serviceId = '/CRD/DVIEW/HCAMCXOROZZC0009';

for(i = 1; i <= 4; i++)
{
	sSelected[i]='';
	sPremList[i]='';
}

sCodeList[0] = "";
sCodeList[1] = "";
sCodeList[2] = "";
sImgList[0] = "";
sImgList[1] = "";
sImgList[2] = "";
sCodeNMList[0] = "";
sCodeNMList[1] = "";
sCodeNMList[2] = "";


/* 선택 메뉴로 이동 */
function goCardMain(Gbn)
{	

	var url = "/CRD/DVIEW/HCAMCXOROZZC0009?구분="+Gbn+"&isNoFrame=Y&channelId=";
	
	ajaxCall(url, "popForm", "myCard");
}

/* 맞춤카드 선택형 */	
function goFitCard(opt) {
	/* 선택화면, 조회결과화면 구분 (1:선택화면) */
	if(opt == null || opt == ""){
		opt = "1";
	}
	$(".selection").addClass("on");
	$(".keyword").removeClass("on");
	$(".partner").removeClass("on");
	   			
	var url = serviceId+"?mainCC=c&isNoFrame=Y&초기구분="+opt;

	ajaxCall(url, "compForm", "fitContents");
}

/* 맞춤카드 키워드형 */
function goKeyWord(opt) {
	/* 선택화면, 조회결과화면 구분 (1:선택화면) */
	if(opt == null || opt == ""){
		opt = "1";
	}
	$(".selection").removeClass("on");
	$(".keyword").addClass("on");
	$(".partner").removeClass("on");
	
	var url = serviceId+"?mainCC=b&isNoFrame=Y&초기구분="+opt;

	ajaxCall(url, "compForm", "fitContents");
	/**
	jShowProgress();
	var param="";
	var paramDelegate="&";
	$.ajax({
	    	url:'/'+sCompCms+'?mainCC=b&isNoFrame=Y',
	    	data: param,
	    	success: callBackFunctionKey 
	});	
	**/
}

/* 맞춤카드 제휴사형 */
function goPartner(opt) {	
	/* 선택화면, 조회결과화면 구분 (1:선택화면) */
	if(opt == null || opt == ""){
		opt = "1";
	}
	$(".selection").removeClass("on");
	$(".partner").addClass("on");
	$(".keyword").removeClass("on");
	
	var url = serviceId+"?mainCC=k&isNoFrame=Y&초기구분="+opt;

	ajaxCall(url, "compForm", "fitContents");
	/**
	jShowProgress();
	var param="";
	var paramDelegate="&";
	$.ajax({
	    	url:'/'+sCompCms+'?mainCC=k&isNoFrame=Y',
	    	data: param,
	    	success: callBackFunctionPartner 
	}); 
	**/	
}

/* 선택형 결과 조회 */
function goFitPrem(opt)
{
	if(opt == null || opt == ""){
		opt = "N";
	}
	/**혜택별찾기 조회**/
	if(sSelected[1]  == '' && opt == 'N')
	{
		alert("혜택은 1개이상 선택 하셔야 합니다.");
		return;
	}
	var param="";
	var paramDelegate="&";
		
	param="니즈코드1="+sSelected[1];
	param+=paramDelegate+"니즈코드2="+sSelected[2];
	param+=paramDelegate+"니즈코드3="+sSelected[3];
					
	param+=paramDelegate+"맞춤카드여성카드여부="+selSex;
	param+=paramDelegate+"맞춤카드연령대시작구분="+selAge;
	param+=paramDelegate+"신용카드여부="+crdtCdYN;
	
	param+=paramDelegate+"혜택내용1="+sPremList[1];
	param+=paramDelegate+"혜택내용2="+sPremList[2];
	param+=paramDelegate+"혜택내용3="+sPremList[3];
	
	var url = serviceId+"?mainCC=d&isNoFrame=Y&"+param;
	
	ajaxCall(url, "compForm", "fitContents"); 
}

/* 제휴사 결과 조회	*/
function goPartnerDetail(gubun1, gubun2, gubun3, gubun4) {
	var param="";
	var paramDelegate="&";
		
	param="맞춤카드정렬대분류구분="+gubun1;
	param+=paramDelegate+"맞춤카드정렬중분류구분="+gubun2;
	param+=paramDelegate+"맞춤카드제휴회사코드="+gubun3;
	param+=paramDelegate+"제휴사구분="+gubun4;
	
	var url = serviceId+"?mainCC=l&isNoFrame=Y&"+param;

	ajaxCall(url, "compForm", "fitContents");	
}

/* 카드 비교함 */
function cardCompLnk(focusTarget){ 
	$(".selection").removeClass("on");
	$(".partner").removeClass("on");
	$(".keyword").removeClass("on");
	var param="";
	var paramDelegate="&";

	param="카드비교코드1="+sCodeList[0];
	param+=paramDelegate+"카드비교코드2="+sCodeList[1];
	param+=paramDelegate+"카드비교코드3="+sCodeList[2];
	
	param+=paramDelegate+"카드비교이미지1="+sImgList[0];
	param+=paramDelegate+"카드비교이미지2="+sImgList[1];
	param+=paramDelegate+"카드비교이미지3="+sImgList[2];
	
	//param+=paramDelegate+"카드비교코드명1="+sCodeNMList[0];
	//param+=paramDelegate+"카드비교코드명2="+sCodeNMList[1];
	//param+=paramDelegate+"카드비교코드명3="+sCodeNMList[2];	
	
	var url = serviceId+"?mainCC=mm&isNoFrame=Y&"+param;

	ajaxCall(url, "compForm", "fitContents", function(htmlString) {  
        $("#fitContents").empty()
        $("#fitContents").append(htmlString);  
        $(focusTarget).focus();  
    });  

}

/* 비교함에 카드 추가하기 */
function addCard(sCode, sImg, sCodename)
{		
	if(sCodeList[0] == sCode || sCodeList[1] == sCode || sCodeList[2] == sCode) {
	    alert("이미 담은 카드입니다.");		
		return;
	}
		
	//이미 있는지 check	
	if (iAddCard == 0)//아무도 없다
	{		
		sImgList[0]    = sImg;
		sCodeList[0]   = sCode;
		sCodeNMList[0] = sCodename;

		var objsN1 = document.getElementById("sN1");//카드 인덱스 닫혀있는 카드비교함
		var objsY1 = document.getElementById("sY1");	
		if(objsN1 != null)
		{
		objsN1.style.display = "none";
		objsY1.style.display = "block";				
		setAddsCard("sY1", 0);			
		}				
		var objN1 = document.getElementById("N1");//카드인덱스 열려있는 카드 비교함
		var objY1 = document.getElementById("Y1");	
		if(objN1 != null)
		{
		objN1.style.display = "none";
		objY1.style.display = "block";				
		setAddCard1("Y1", 0);			
		}
		var objNN1 = document.getElementById("NN1");//나만의 카드찾기 오른쪽 카드비교함
		var objYY1 = document.getElementById("YY1");
		if(objNN1 != null)
		{
		objNN1.style.display = "none";
		objYY1.style.display = "block";
		
		//2014.09.30 한예진  -  alt값 추가를 위해서 setAddCard -> setAddCard2 변경
		//setAddCard("YY1", 0);	
		setAddCard2("YY1", 0, sCodename);			
		}
		var objNNN1 = document.getElementById("RNBcardList") != null ? document.getElementById("RNBcardList") : document.getElementsByClassName("RNBcardList");//페이지하단 비교함
		//var objYYY1 = document.getElementById("YYY1");
		if(objNNN1 != null)
		{
		//objNNN1.style.display = "none";
		//objYYY1.style.display = "block";				
		setAddBTMCard();		
		}
		
		iAddCard++;
		if(sImg != "") {
		    alert("비교함에 추가 되었습니다.");
		    if(!$(".compBox .btnCard").hasClass("on")) {
		        $(".compBox .btnCard").trigger("click");
		    }
		}		
	}
	else if (iAddCard == 1)//1개있다
	{	
		sImgList[1]    = sImg;
		sCodeList[1]   = sCode;
		sCodeNMList[1] = sCodename;		

		var objsN2 = document.getElementById("sN2");//카드 인덱스 닫혀있는 카드비교함
		var objsY2 = document.getElementById("sY2");
		if(objsN2 != null)
		{
		objsN2.style.display = "none";
		objsY2.style.display = "block";
		setAddsCard("sY2", 1);
		}				
		var objN2 = document.getElementById("N2");//카드인덱스 열려있는 카드 비교함
		var objY2 = document.getElementById("Y2");
		if(objN2 != null)
		{
		objN2.style.display = "none";
		objY2.style.display = "block";
		setAddCard1("Y2", 1);
		}
		var objNN2 = document.getElementById("NN2");//나만의 카드찾기 오른쪽 카드비교함
		var objYY2 = document.getElementById("YY2");
		if(objNN2 != null)
		{
		objNN2.style.display = "none";
		objYY2.style.display = "block";				

		//2014.09.30 한예진  -  alt값 추가를 위해서 setAddCard -> setAddCard2 변경
		setAddCard2("YY2", 1, sCodename);
		}		
		var objNNN2 = document.getElementById("RNBcardList") != null ? document.getElementById("RNBcardList") : document.getElementsByClassName("RNBcardList");//페이지하단 비교함
		//var objYYY2 = document.getElementById("YYY2");
		if(objNNN2 != null)
		{
		//objNNN2.style.display = "none";
		//objYYY2.style.display = "block";				
		setAddBTMCard();	
		}		
		iAddCard++;
		if(sImg != "") {
		    alert("비교함에 추가 되었습니다.");
		    if(!$(".compBox .btnCard").hasClass("on")) {
		        $(".compBox .btnCard").trigger("click");
		    }
		}
	}
	else if (iAddCard == 2)//2개있다
	{
		sImgList[2]    = sImg;
		sCodeList[2]   = sCode;
		sCodeNMList[2] = sCodename;				

		var objsN3 = document.getElementById("sN3");//카드 인덱스 닫혀있는 카드비교함
		var objsY3 = document.getElementById("sY3");
		if(objsN3 != null)
		{
		objsN3.style.display = "none";
		objsY3.style.display = "block";
		setAddsCard("sY3", 2);
		}
		
		var objN3 = document.getElementById("N3");//카드인덱스 열려있는 카드 비교함
		var objY3 = document.getElementById("Y3");
		if(objN3 != null)
		{
		objN3.style.display = "none";
		objY3.style.display = "block";
		setAddCard1("Y3", 2);
		}		
		var objNN3 = document.getElementById("NN3");//나만의 카드찾기 오른쪽 카드비교함
		var objYY3 = document.getElementById("YY3");
		if(objNN3 != null)
		{
			objNN3.style.display = "none";
			objYY3.style.display = "block";

			//2014.09.30 한예진  -  alt값 추가를 위해서 setAddCard -> setAddCard2 변경
			setAddCard2("YY3", 2, sCodename);
		}
		var objNNN3 = document.getElementById("RNBcardList") != null ? document.getElementById("RNBcardList") : document.getElementsByClassName("RNBcardList");//페이지하단 비교함
		//var objYYY3 = document.getElementById("YYY3");
		if(objNNN3 != null)
		{
			setAddBTMCard();
		}
		iAddCard++;
		if(sImg != "") {
		    alert("비교함에 추가 되었습니다.");
		    if(!$(".compBox .btnCard").hasClass("on")) {
		        $(".compBox .btnCard").trigger("click");
		    }
		}
	}
	else if (iAddCard == 3)//3개있다
	{
		if(confirm("카드비교함이 가득 찼습니다.\n이전 카드를 삭제하고 추가하시겠습니까?")){
			sImgList[2]    = sImgList[1];
			sCodeList[2]   = sCodeList[1];
			sCodeNMList[2] = sCodeNMList[1];
			sImgList[1]    = sImgList[0];
			sCodeList[1]   = sCodeList[0];
			sCodeNMList[1] = sCodeNMList[0];						
			sImgList[0]    = sImg;
			sCodeList[0]   = sCode;
			sCodeNMList[0] = sCodename;
	
			var objsY3 = document.getElementById("sY3");//카드 인덱스 닫혀있는 카드비교함
			if(objsY3 != null)
			{
			setAddsCard("sY1", 0);
			setAddsCard("sY2", 1);
			setAddsCard("sY3", 2);	
			}
					
			var objY3 = document.getElementById("Y3");//카드인덱스 열려있는 카드 비교함
			if(objY3 != null)
			{
			setAddCard1("Y1", 0);
			setAddCard1("Y2", 1);
			setAddCard1("Y3", 2);	
			}
			var objNN3 = document.getElementById("YY3");//나만의 카드찾기 오른쪽 카드비교함
			if(objNN3 != null)
			{
				setAddCard("YY1", 0);
				setAddCard("YY2", 1);
				setAddCard("YY3", 2);	
			}
			var objNNN3 = document.getElementById("RNBcardList") != null ? document.getElementById("RNBcardList") : document.getElementsByClassName("RNBcardList");//페이지하단 비교함
			if(objNNN3 != null)
			{
				setAddBTMCard();
			}
			if(sImg != "") {
    		    alert("비교함에 추가 되었습니다.");
    		    if(!$(".compBox .btnCard").hasClass("on")) {
    		        $(".compBox .btnCard").trigger("click");
    		    }
    		}
		}
	}	
	$("[id^='iAddCard'], .compBox .iAddCard").text(iAddCard);
	var param="";
	var paramDelegate="&";
		
	param="카드비교코드1="+sCodeList[0];
	param+=paramDelegate+"카드비교코드2="+sCodeList[1];
	param+=paramDelegate+"카드비교코드3="+sCodeList[2];
	
	param+=paramDelegate+"카드비교이미지1="+sImgList[0];
	param+=paramDelegate+"카드비교이미지2="+sImgList[1];
	param+=paramDelegate+"카드비교이미지3="+sImgList[2];
	
	param+=paramDelegate+"카드비교코드명1="+sCodeNMList[0];
	param+=paramDelegate+"카드비교코드명2="+sCodeNMList[1];
	param+=paramDelegate+"카드비교코드명3="+sCodeNMList[2];	
	param+=paramDelegate+"비교카드수="+iAddCard;
		
    	param = encodeURI(param);

	$.ajax({
	    	url:serviceId+'?mainCC=n&isNoFrame=Y&responseContentType=json&option=kind',
	    	data: param,
	    	type : 'POST',
	    	dataType : 'json',
	    	error: function(result) 
	    	{
				//alert(result); //실패시 실행부분
	    	}
	});	
	  
	//
	var objccardcnt = document.getElementById("cardcnt");
	if(objccardcnt != null)
	{
		objccardcnt.innerHTML = "["+iAddCard+"]"
	}
	var objcompImgOpen = document.getElementById("compImgOpen");
	var objcompImgClose= document.getElementById("compImgClose");
	
	if(objcompImgOpen != null && objcompImgClose != null)
	{
		var objcompImgOpenA= document.getElementById("compImgOpenA");
		if(objcompImgOpenA != null)
		{					
			if(objcompImgOpenA.style.display == "none")
			{				
				return;
			}
		}
		//카드 담았을때 하단이 열렸다 닫히도록
		//objcompImgOpen.click();	
		 //$("#compImgOpen").click();
		 
		 //$('.footerDiaryBtn >a.open').click();
		//objTimeout = setTimeout(compImgCloseEvent,1000);		
	}
	
	if($('.footerDiaryBtn').length > 0 && $('.footerDiaryBox').is(':hidden')){
		$('.footerDiaryBtn >a.open').click();
		objTimeout = setTimeout(compImgCloseEvent,1000);
	}
}

/* RNB 비교함 영역 설정 */
function setAddBTMCard()
{
	//페이지하단
	var iText = "";	
	var iText1 = "";
	var iText2 = "";	
	var iText3 = "";	
	var cardCount = 0;
	
	var objcompBoxList = document.getElementById("compBoxList");
		
	iText1 += '<li>';	
	if(sCodeList[0] != "") {
		iText1 += '<div class="card__img"><img src="'+sImgList[0]+'" alt="'+sCodeNMList[0]+' 썸네일이미지" /></div>';
		iText1 += '<a href="javascript:delCompCard(0);"  class="list-category-card__del" title="카드삭제">';
		iText1 += '<img src="https://img1.kbcard.com/home_re/pc/btn/btn-delete.png" alt="">';
		iText1 += '</a>';
		cardCount++;
	}	else {
		iText1 += '<div class="card__img card__img-add">';
		iText1 += '<div title="카드추가">';	
		iText1 += '</div>';
	}
	iText1 += '</li>';
	
	iText2 += '<li>';	
	if(sCodeList[1] != "") {
		iText2 += '<div class="card__img"><img src="'+sImgList[1]+'" alt="'+sCodeNMList[1]+' 썸네일이미지" /></div>';
		iText2 += '<a href="javascript:delCompCard(1);"  class="list-category-card__del" title="카드삭제">';
		
		iText2 += '</a>';
		cardCount++;
	}	else {
		iText2 += '<div class="card__img card__img-add">';
		iText2 += '<div title="카드추가">';
		iText2 += '<img src="https://img1.kbcard.com/home_re/pc/ico/36/ico-add.png" alt="">';
		iText2 += '</div>';
	}
	iText2 += '</li>';	
	
	iText3 += '<li>';	
	if(sCodeList[2] != "") {
		iText3 += '<div class="card__img"><img src="'+sImgList[2]+'" alt="'+sCodeNMList[2]+' 썸네일이미지" /></div>';
		iText3 += '<a href="javascript:delCompCard(2);"  class="list-category-card__del" title="카드삭제">';
		iText3 += '<img src="https://img1.kbcard.com/home_re/pc/btn/btn-delete.png" alt="">';
		iText3 += '</a>';
		cardCount++;
	}	else {
		iText3 += '<div class="card__img card__img-add">';
		iText3 += '<div title="카드추가">';
		iText3 += '<img src="https://img1.kbcard.com/home_re/pc/ico/36/ico-add.png" alt="">';
		iText3 += '</div>';
	}
	iText3 += '</li>';		
	
	iText = iText1 + iText2 + iText3;
	$("#cardCount").text(cardCount);
	$('#pop_cardCount').text(cardCount);
	$("#RNBcardList").html(iText);	
	if (cardCount == 0 ) {
		$('#compBoxList').css("display","none");
		
	}
}

/* 비교함 카드 삭제 */
function delCompCard(val, isPop){
	if(confirm("선택상품을 비교함에서 삭제 하시겠습니까?")){
		var objcompBoxList = document.getElementById("compBoxList");
		
		if(val == 0)
		{
			sImgList[0]    = sImgList[1];
			sCodeList[0]   = sCodeList[1];
			sCodeNMList[0] = sCodeNMList[1];	
			sImgList[1]    = sImgList[2];
			sCodeList[1]   = sCodeList[2];
			sCodeNMList[1] = sCodeNMList[2];	
			sImgList[2]    = "";
			sCodeList[2]   = "";
			sCodeNMList[2] = "";				
		}
		else if(val == 1)
		{
			sImgList[1]    = sImgList[2];
			sCodeList[1]   = sCodeList[2];
			sCodeNMList[1] = sCodeNMList[2];	
			sImgList[2]    = "";
			sCodeList[2]   = "";
			sCodeNMList[2] = "";	
	
		}
		else if(val == 2)
		{
			sImgList[2]    = "";
			sCodeList[2]   = "";
			sCodeNMList[2] = "";		
		}
		if(iAddCard>0){
			iAddCard--;
		}
		
		if(objcompBoxList != null)	{
			$("#cardCount").text(iAddCard);
		}	
		
		var param="";
		var paramDelegate="&";
			
		param="카드비교코드1="+sCodeList[0];
		param+=paramDelegate+"카드비교코드2="+sCodeList[1];
		param+=paramDelegate+"카드비교코드3="+sCodeList[2];
		
		param+=paramDelegate+"카드비교이미지1="+sImgList[0];
		param+=paramDelegate+"카드비교이미지2="+sImgList[1];
		param+=paramDelegate+"카드비교이미지3="+sImgList[2];
		
		param+=paramDelegate+"카드비교코드명1="+sCodeNMList[0];
		param+=paramDelegate+"카드비교코드명2="+sCodeNMList[1];
		param+=paramDelegate+"카드비교코드명3="+sCodeNMList[2];	
		param+=paramDelegate+"비교카드수="+iAddCard;
		
    	
        	param = encodeURI(param);

		$.ajax({
				
			url:'/CRD/API/HCAMCXOROZZC0009'+'?mainCC=n&isNoFrame=Y&responseContentType=json&option=kind',
		    	data: param,
		    	dataType : 'json',
		    	type : 'POST',
		    	success: function(data){
		    		var objNNN3 = document.getElementById("RNBcardList") != null ? document.getElementById("RNBcardList") : document.getElementsByClassName("RNBcardList");//페이지하단 비교함
		    		if(objNNN3 != null)
		    		{
		    			setAddBTMCard();
		    		}
		    		/** 
		    		else{
		    			cardCompLnk();
		    		}
		    		**/
		    		var target = $('.cardOption.cardOption2').css('display') != 'none' ? '.cardOption.cardOption2' : '.cardOption:eq(0)';  
		     
		            if($(target).find('.RNBcardList').find('button').length > 0) {  
		                target += ' .RNBcardList button:eq(0)';  
		            } else {  
		                target += ' .kbBtn.btnXS';   
		            }  
		            
		            if(iAddCard == 0 && objcompBoxList != null)
		    		{
		            	 $('#compBoxList').hide();
		    		}
		     
		            //cardCompLnk(target);
		            if( isPop )
		            	findMyCard();
		    	},
		    	error: function(result) 
		    	{
					//alert(result); //실패시 실행부분
		    	}
		});	
	}
}

/* 비교함 카드 전부 삭제 */
function delAllCompCard(){
	if(confirm("모든상품을 비교함에서 삭제 하시겠습니까?")){
		for(var i = 0; i < 3; i++){
			sImgList[i]    = "";
			sCodeList[i]   = "";
			sCodeNMList[i] = "";
		}
		iAddCard = 0;
		var objcompBoxList = document.getElementById("compBoxList");
				
		var param="";
		var paramDelegate="&";
			
		param="카드비교코드1="+sCodeList[0];
		param+=paramDelegate+"카드비교코드2="+sCodeList[1];
		param+=paramDelegate+"카드비교코드3="+sCodeList[2];
		
		param+=paramDelegate+"카드비교이미지1="+sImgList[0];
		param+=paramDelegate+"카드비교이미지2="+sImgList[1];
		param+=paramDelegate+"카드비교이미지3="+sImgList[2];
		
		param+=paramDelegate+"카드비교코드명1="+sCodeNMList[0];
		param+=paramDelegate+"카드비교코드명2="+sCodeNMList[1];
		param+=paramDelegate+"카드비교코드명3="+sCodeNMList[2];	
		param+=paramDelegate+"비교카드수="+iAddCard;
		
 	
        param = encodeURI(param);
		
		$.ajax({
		    	url:'/CRD/API/HCAMCXOROZZC0009'+'?mainCC=n&isNoFrame=Y&responseContentType=json&option=kind',
		    	data: param,
		    	type: 'POST',
		    	dataType : 'json',
		    	success: function(data){
		    		setAddBTMCard();

		    		findMyCard();
		    	},
		    	error: function(result) 
		    	{
					//alert(result); //실패시 실행부분
		    	}
		});	
		
		/** 
		else{
			cardCompLnk();
		}
		**/
		//cardCompLnk();
		//console.log("param :" + param);
	}
}

/* 카드 신청화면으로 이동 */
function goNewCardComp(vNewsite, vCode, vEQYN, vVTData, vissueStateType, vEQCode, vEQNCode, vNTrCode, vGb)
{
 var form = document.mainForm;  
     
	 form.target="_self";  
     form.action =  '/CRD/DVIEW/HCAMCXPRICAC0137?&cooperationcode='+vCode; // 카드상품분류 코드 추가     
     formInitalizer(form);
     form.submit();
}

/* 카드 상세화면으로 이동 */
function viewCard(val)
{
	 var form = document.mainForm;  
     
	 form.target="_self";  
     form.action =  '/CRD/DVIEW/HCAMCXPRICAC0076?mainCC=a&cooperationcode='+val;     
     formInitalizer(form);
     form.submit(); 
}

/* 비교함에 카드 추가 후 비교함 열기 */
function compMyCard(objId, val){
		if(val != "")	addCard(val, "");
		commonR_findMyCard(objId, 'm');
}

/* 비교함에 카드 추가하기 */
function addCardNew(sCode, sImg, sCodename)
{
        if(sCodeList[0] == sCode || sCodeList[1] == sCode || sCodeList[2] == sCode) {
            alert("이미 담은 카드입니다.");
                return;
        }

        //이미 있는지 check
        if (iAddCard == 0)//아무도 없다
        {
        	     $('#compBoxList').show();
                sImgList[0]    = sImg;
                sCodeList[0]   = sCode;
                sCodeNMList[0] = sCodename;

                var objNNN1 = document.getElementById("RNBcardList") != null ? document.getElementById("RNBcardList") : document.getElementsByClassName("RNBcardList");//페이지하단 비교함
                //var objYYY1 = document.getElementById("YYY1");
                if(objNNN1 != null)
                {
                //objNNN1.style.display = "none";
                //objYYY1.style.display = "block";
                setAddBTMCard();
                }

                iAddCard++;
                if(sImg != "") {
                    alert("비교함에 추가 되었습니다.");
                }
        }
        else if (iAddCard == 1)//1개있다
        {
        	    $('#compBoxList').show();
                sImgList[1]    = sImg;
                sCodeList[1]   = sCode;
                sCodeNMList[1] = sCodename;

                var objNNN2 = document.getElementById("RNBcardList") != null ? document.getElementById("RNBcardList") : document.getElementsByClassName("RNBcardList");//페이지하단 비교함
                //var objYYY2 = document.getElementById("YYY2");
                if(objNNN2 != null)
                {
                //objNNN2.style.display = "none";
                //objYYY2.style.display = "block";
                setAddBTMCard();
                }
                iAddCard++;
                if(sImg != "") {
                    alert("비교함에 추가 되었습니다.");
                }
        }
        else if (iAddCard == 2)//2개있다
        {
        	    $('#compBoxList').show();
                sImgList[2]    = sImg;
                sCodeList[2]   = sCode;
                sCodeNMList[2] = sCodename;

                var objNNN3 = document.getElementById("RNBcardList") != null ? document.getElementById("RNBcardList") : document.getElementsByClassName("RNBcardList");//페이지하단 비교함
                //var objYYY3 = document.getElementById("YYY3");
                if(objNNN3 != null)
                {
                	setAddBTMCard();
                }
                iAddCard++;
                if(sImg != "") {
                    alert("비교함에 추가 되었습니다.");

                }
        }
        else if (iAddCard == 3)//3개있다
        {
        	    $('#compBoxList').show();
                if(confirm("카드비교함이 가득 찼습니다.\n이전 카드를 삭제하고 추가하시겠습니까?")){
                        sImgList[2]    = sImgList[1];
                        sCodeList[2]   = sCodeList[1];
                        sCodeNMList[2] = sCodeNMList[1];
                        sImgList[1]    = sImgList[0];
                        sCodeList[1]   = sCodeList[0];
                        sCodeNMList[1] = sCodeNMList[0];
                        sImgList[0]    = sImg;
                        sCodeList[0]   = sCode;
                        sCodeNMList[0] = sCodename;

                        var objNNN3 = document.getElementById("RNBcardList") != null ? document.getElementById("RNBcardList") : document.getElementsByClassName("RNBcardList");//페이지하단 비교함
                        if(objNNN3 != null)
                        {
                        	setAddBTMCard();
                        }
                        if(sImg != "") {
                            alert("비교함에 추가 되었습니다.");
                        }
                }
        }
        $("#cardCount").text(iAddCard);
        var param="";
        var paramDelegate="&";

        param="카드비교코드1="+sCodeList[0];
        param+=paramDelegate+"카드비교코드2="+sCodeList[1];
        param+=paramDelegate+"카드비교코드3="+sCodeList[2];

        param+=paramDelegate+"카드비교이미지1="+sImgList[0];
        param+=paramDelegate+"카드비교이미지2="+sImgList[1];
        param+=paramDelegate+"카드비교이미지3="+sImgList[2];

        param+=paramDelegate+"카드비교코드명1="+sCodeNMList[0];
        param+=paramDelegate+"카드비교코드명2="+sCodeNMList[1];
        param+=paramDelegate+"카드비교코드명3="+sCodeNMList[2];
        param+=paramDelegate+"비교카드수="+iAddCard;
		
        	param = encodeURI(param);

        $.ajax({
                url:serviceId+'?mainCC=n&isNoFrame=Y&responseContentType=json&option=kind',
                data: param,
                type: 'POST',
                dataType : 'json',
                error: function(result) 
                {
                                //alert(result); //실패시 실행부분
                }
        });
}
function findMyCard(objId, val) {
	if(val == null) val = "";	 
	
	var param="";
	var paramDelegate="&";

	param="카드비교코드1="+sCodeList[0];
    param+=paramDelegate+"카드비교코드2="+sCodeList[1];
    param+=paramDelegate+"카드비교코드3="+sCodeList[2];

    param+=paramDelegate+"카드비교이미지1="+sImgList[0];
    param+=paramDelegate+"카드비교이미지2="+sImgList[1];
    param+=paramDelegate+"카드비교이미지3="+sImgList[2];
    
	//param+=paramDelegate+"카드비교코드명1="+sCodeNMList[0];
	//param+=paramDelegate+"카드비교코드명2="+sCodeNMList[1];
	//param+=paramDelegate+"카드비교코드명3="+sCodeNMList[2];	
	
	var url = "/CRD/DVIEW/HCAMCXOROZZC0009?mainCC=mm&isNoFrame=Y&"+param;
	ajaxCall(url, "", "pop-contents", function(htmlString) {  
        $("#pop-contents").empty();
        $("#pop-contents").append(htmlString);
        KBCARD_GLOBAL.openPopup('#cardCompare');
    });  
	 
 }
	
</script>

</head>
<body>

<div class="card-box"> 
    
    
    <div class="card-box__item">
    		<!-- 앞 -->
    		<div class="card-box__before">
    			<a href="#" class="linkDetail" onclick="">
		    		<h3 class="tit-dep4">에그머니 더모아 카드</h3>
		  	        <p class="badge--txt pl0">어디가든 가지 구매시 포인트 무조건 적립!</p>	  	        
		            
					<p class="c-blue txt-ss mt8"></p>
					
					
					
					<div class="card-box__card row">
					
		            	<img src="<%=cp%>/image/eggmoney.jpg" alt="에그머니 더모아 카드">
		            </div>  
	            </a>		
	  		</div>
    		<!-- 뒤 -->
             <div class="card-box__after">             	
    			<a href="#" class="linkDetail" onclick="javascript:goDetail('09321','')">
                 <h3 class="tit-dep4">에그머니 더모아 카드</h3>
                 <p class="badge--txt pl0">가지 구매금액의 포인트 100% 적립!</p>
                 </a>
                 
				<p class="c-blue txt-ss mt8"></p>
				
				
                 <div class="card-box__btn-wrap">
                     <span class="bold-m">연회비</span>
                     <a href="#popup_layer_0" class="btn-txt btn-txt--arr-r pop-open">자세히보기</a>
                 </div>
                 
                 <div class="card-type">
                    
						<div class="card-type__item">
				 			<span class="card-type__logo"><img src="https://img1.kbcard.com/home_re/pc/logo/48/logo-domestic.png" alt="국내전용"></span>		
				 			<em class="card-type__money">7,777,777</em>
						</div>									
				
						<div class="card-type__item">
				 			<span class="card-type__logo"><img src="https://img1.kbcard.com/home_re/pc/logo/48/logo-visa.png" alt="VISA카드"></span>		
				 			<em class="card-type__money">7,777,777</em>
						</div>									
						<div class="card-type__item">
				 			<span class="card-type__logo"><img src="https://img1.kbcard.com/home_re/pc/logo/48/logo-americanexpress.png" alt="AMEX카드"></span>		
				 			<em class="card-type__money">7,777,777</em>
						</div>	
						<div class="btn-wrap">
		                     <button type="button" class="btn btn--tertiary" onclick="javascript:addCardNew('09321','https://img1.kbcard.com/ST/img/cxc/kbcard/upload/img/product/09321_img.png','알뜰교통플러스 카드' ); return false;">비교함담기</button>
		                     <button type="button" class="btn btn--primary" onclick="javascript:goNewCard('','09321','1', '1','','','','', '','')">카드신청</button>
		                 </div>
				
		   	     </div>
		   	 </div>
		   	 <div class="pop-wrap pop-wrap--big" id="popup_layer_0" aria-hidden="false" tabindex="0" data-open="true" style="display: none; z-index: 9000;">
    <div class="pop-container pop-ani" style="width: 400px; height: 462px; top: 253.5px; left: 760px;" tabindex="0">
        <!-- width, height값 삭제하지 마세요~ -->
        <!-- pop-header -->
        <header class="pop-header">
            <h1 class="tit-dep2">연회비 안내</h1>
        </header>
        <div class="pop-close"><a href="javascript:void(0)" class="btn-pop btn-pop--close">닫기</a></div>
        <!--// pop-header -->

        <!-- 팝업컨텐츠 -->
        <div class="pop-inner">
            <div class="pop-cont" style="height: calc((100% - 112px) + 40px);">
                <div class="tbl-data tbl-data--type3">
                    <table>
                        <caption>연회비 안내</caption>
                        <colgroup>
                            <col style="width:20%">
                            <col>
                        </colgroup>
                        <tbody>
                        			<tr>
                                 <th scope="row" class="v-top"><img src="https://img1.kbcard.com/home_re/pc/logo/48/logo-domestic.png" alt="국내전용"></th>
                                 <td>
                                     <div class="box-count">
                                         <span>국내</span>
                                         <span>8,000</span>
                                     </div>
                                 </td>
                             </tr>						
							<tr>
                                 <th scope="row" class="v-top"><img src="https://img1.kbcard.com/home_re/pc/logo/48/logo-visa.png" alt="VISA카드"></th>
                                 <td>
                                     <div class="box-count">
                                         <span>VISA</span>
                                         <span>8,000</span>
                                     </div>
                                 </td>
                             </tr>						
				
                        </tbody>
                    </table>
                </div>
            </div>
            <div class="btn-wrap btn-wrap--footer">
                <button type="button" class="btn btn--primary">확인</button>
            </div> 
        </div>
    </div>
</div> 
		 </div>		 

    
    <div class="card-box__item">
    		<!-- 앞 -->
    		<div class="card-box__before">
    			<a href="#" class="linkDetail" onclick="javascript:goDetail('09122','')">
		    		<h3 class="tit-dep4">유진쓰 Hype Point 카드</h3>
		  	        <p class="badge--txt pl0">유진쓰 노래들으면 포인트가 쑥쑥!</p>	  	        
		            
					<p class="c-blue txt-ss mt8"></p>
					
					
					
					<div class="card-box__card row">
					
		            	<img src="<%=cp %>/image/yujins.png" alt="유진쓰 HiPoitnt 카드">
		            </div>  
	            </a>		
	  		</div>
    		<!-- 뒤 -->
             <div class="card-box__after">             	
    			<a href="#" class="linkDetail" onclick="javascript:goDetail('09122','')">
                 <h3 class="tit-dep4">유진쓰 Hype Point 카드</h3>
                 <p class="badge--txt pl0">뉴진쓰는 옛말 이제는 유진쓰 HiPoint!</p>
                 </a>
                 
				<p class="c-blue txt-ss mt8"></p>
				
				
                 <div class="card-box__btn-wrap">
                     <span class="bold-m">연회비</span>
                     <a href="#popup_layer_1" class="btn-txt btn-txt--arr-r pop-open">자세히보기</a>
                 </div>
                 
                 <div class="card-type">
                    
						<div class="card-type__item">
				 			<span class="card-type__logo"><img src="https://img1.kbcard.com/home_re/pc/logo/48/logo-domestic.png" alt="국내전용"></span>		
				 			<em class="card-type__money">3,333,333</em>
						</div>									
				
						<div class="card-type__item">
				 			<span class="card-type__logo"><img src="https://img1.kbcard.com/home_re/pc/logo/48/logo-visa.png" alt="VISA카드"></span>		
				 			<em class="card-type__money">3,333,333</em>
						</div>									
						<div class="card-type__item">
				 			<span class="card-type__logo"><img src="https://img1.kbcard.com/home_re/pc/logo/48/logo-americanexpress.png" alt="AMEX카드"></span>		
				 			<em class="card-type__money">3,333,333</em>
						</div>	
						<div class="btn-wrap">
		                     <button type="button" class="btn btn--tertiary" onclick="javascript:addCardNew('09122','https://img1.kbcard.com/ST/img/cxc/kbcard/upload/img/product/09122_img.png','WE:SH All 카드' ); return false;">비교함담기</button>
		                     <button type="button" class="btn btn--primary" onclick="javascript:goNewCard('','09122','1', '1','','','','', '','')">카드신청</button>
		                 </div>
				
		   	     </div>
		   	 </div>
		   	 <div class="pop-wrap pop-wrap--big" id="popup_layer_1" aria-hidden="false" tabindex="0" data-open="true" style="display: none; z-index: 9000;">
    <div class="pop-container pop-ani" style="width: 400px; height: 462px; top: 253.5px; left: 760px;" tabindex="0">
        <!-- width, height값 삭제하지 마세요~ -->
        <!-- pop-header -->
        <header class="pop-header">
            <h1 class="tit-dep2">연회비 안내</h1>
        </header>
        <div class="pop-close"><a href="javascript:void(0)" class="btn-pop btn-pop--close">닫기</a></div>
        <!--// pop-header -->

        <!-- 팝업컨텐츠 -->
        <div class="pop-inner">
            <div class="pop-cont" style="height: calc((100% - 112px) + 40px);">
                <div class="tbl-data tbl-data--type3">
                    <table>
                        <caption>연회비 안내</caption>
                        <colgroup>
                            <col style="width:20%">
                            <col>
                        </colgroup>
                        <tbody>
                        			<tr>
                                 <th scope="row" class="v-top"><img src="https://img1.kbcard.com/home_re/pc/logo/48/logo-domestic.png" alt="국내전용"></th>
                                 <td>
                                     <div class="box-count">
                                         <span>국내</span>
                                         <span>20,000</span>
                                     </div>
                                 </td>
                             </tr>						
							<tr>
                                 <th scope="row" class="v-top"><img src="https://img1.kbcard.com/home_re/pc/logo/48/logo-visa.png" alt="VISA카드"></th>
                                 <td>
                                     <div class="box-count">
                                         <span>VISA</span>
                                         <span>20,000</span>
                                     </div>
                                 </td>
                             </tr>						
				
                        </tbody>
                    </table>
                </div>
            </div>
            <div class="btn-wrap btn-wrap--footer">
                <button type="button" class="btn btn--primary">확인</button>
            </div> 
        </div>
    </div>
</div> 
		 </div>		 

    
    <div class="card-box__item">
    		<!-- 앞 -->
    		<div class="card-box__before">
    			<a href="#" class="linkDetail" onclick="">
		    		<h3 class="tit-dep4">무한 긍정 카드</h3>
		  	        <p class="badge--txt pl0"></p>	  	        
		             <p class="badge--txt pl0">신용불량자도 만들 수 있는 카드!</p>
					<p class="c-blue txt-ss mt8"></p>
					
					
					
					<div class="card-box__card row">
					
		            	<img src="<%=cp %>/image/jrock.png" alt="My WE:SH 카드">
		            </div>  
	            </a>		
	  		</div>
    		<!-- 뒤 -->
             <div class="card-box__after">             	
    			<a href="#" class="linkDetail" onclick="javascript:goDetail('09123','')">
                 <h3 class="tit-dep4">무한 긍정 카드</h3>
                 <p class="badge--txt pl0">자산규모 상관없이 발급가능! (결제불가능)</p>
                 </a>
                 
				<p class="c-blue txt-ss mt8"></p>
				
				
                 <div class="card-box__btn-wrap">
                     <span class="bold-m">연회비</span>
                     <a href="#popup_layer_2" class="btn-txt btn-txt--arr-r pop-open">자세히보기</a>
                 </div>
                 
                 <div class="card-type">
                    
						<div class="card-type__item">
				 			<span class="card-type__logo"><img src="https://img1.kbcard.com/home_re/pc/logo/48/logo-domestic.png" alt="국내전용"></span>		
				 			<em class="card-type__money">0</em>
						</div>									
				
						<div class="card-type__item">
				 			<span class="card-type__logo"><img src="https://img1.kbcard.com/home_re/pc/logo/48/logo-mastercard.png" alt="MASTER카드"></span>		
				 			<em class="card-type__money">0</em>
						</div>									
				
						<div class="card-type__item">
				 			<span class="card-type__logo"><img src="https://img1.kbcard.com/home_re/pc/logo/48/logo-americanexpress.png" alt="AMEX카드"></span>		
				 			<em class="card-type__money">0</em>
						</div>									
				
						<div class="btn-wrap">
		                     <button type="button" class="btn btn--tertiary" onclick="javascript:addCardNew('09123','https://img1.kbcard.com/ST/img/cxc/kbcard/upload/img/product/09123_img.png','My WE:SH 카드' ); return false;">비교함담기</button>
		                     <button type="button" class="btn btn--primary" onclick="javascript:goNewCard('','09123','1', '1','','','','', '','')">카드신청</button>
		                 </div>
				
		   	     </div>
		   	 </div>
		   	 <div class="pop-wrap pop-wrap--big" id="popup_layer_2" aria-hidden="false" tabindex="0" data-open="true" style="display: none; z-index: 9000;">
    <div class="pop-container pop-ani" style="width: 400px; height: 462px; top: 253.5px; left: 760px;" tabindex="0">
        <!-- width, height값 삭제하지 마세요~ -->
        <!-- pop-header -->
        <header class="pop-header">
            <h1 class="tit-dep2">연회비 안내</h1>
        </header>
        <div class="pop-close"><a href="javascript:void(0)" class="btn-pop btn-pop--close">닫기</a></div>
        <!--// pop-header -->

        <!-- 팝업컨텐츠 -->
        <div class="pop-inner">
            <div class="pop-cont" style="height: calc((100% - 112px) + 40px);">
                <div class="tbl-data tbl-data--type3">
                    <table>
                        <caption>연회비 안내</caption>
                        <colgroup>
                            <col style="width:20%">
                            <col>
                        </colgroup>
                        <tbody>
                        			<tr>
                                 <th scope="row" class="v-top"><img src="https://img1.kbcard.com/home_re/pc/logo/48/logo-domestic.png" alt="국내전용"></th>
                                 <td>
                                     <div class="box-count">
                                         <span>국내</span>
                                         <span>15,000</span>
                                     </div>
                                 </td>
                             </tr>						
							<tr>
                                 <th scope="row" class="v-top"><img src="https://img1.kbcard.com/home_re/pc/logo/48/logo-mastercard.png" alt="MASTER카드"></th>
                                 <td>
                                     <div class="box-count">
                                         <span>MASTER</span>
                                         <span>15,000</span>
                                     </div>
                                 </td>
                             </tr>						
							<tr>
                                 <th scope="row" class="v-top"><img src="https://img1.kbcard.com/home_re/pc/logo/48/logo-americanexpress.png" alt="AMEX카드"></th>
                                 <td>
                                     <div class="box-count">
                                         <span>AMEX</span>
                                         <span>15,000</span>
                                     </div>
                                 </td>
                             </tr>						
				
                        </tbody>
                    </table>
                </div>
            </div>

        </div>
    </div>
</div> 
</div>		 
</div>





<br/>
<div class="card-box"> 
    
    
    <div class="card-box__item">
    		<!-- 앞 -->
    		<div class="card-box__before">
    			<a href="#" class="linkDetail" onclick="javascript:goDetail('09321','')">
		    		<h3 class="tit-dep4">행복 무한 카드</h3>
		  	        <p class="badge--txt pl0">나는 행복하다 행복하다 행복하다...</p>	  	        
		            
					<p class="c-blue txt-ss mt8"></p>
					
					
					
					<div class="card-box__card row">
					
		            	<img src="<%=cp%>/image/happy.png" alt="행복 무한 카드">
		            </div>  
	            </a>		
	  		</div>
    		<!-- 뒤 -->
             <div class="card-box__after">             	
    			<a href="#" class="linkDetail" onclick="javascript:goDetail('09321','')">
                 <h3 class="tit-dep4">행복 무한 카드</h3>
                 <p class="badge--txt pl0">여러분의 행복은 가까이 있습니다. <br/>그것은 바로 '돈'</p>
                 </a>
                 
				<p class="c-blue txt-ss mt8"></p>
				
				
                 <div class="card-box__btn-wrap">
                     <span class="bold-m">연회비</span>
                     <a href="#popup_layer_0" class="btn-txt btn-txt--arr-r pop-open">자세히보기</a>
                 </div>
                 
                 <div class="card-type">
                    
						<div class="card-type__item">
				 			<span class="card-type__logo"><img src="https://img1.kbcard.com/home_re/pc/logo/48/logo-domestic.png" alt="국내전용"></span>		
				 			<em class="card-type__money">9,999,999</em>
						</div>									
				
						<div class="card-type__item">
				 			<span class="card-type__logo"><img src="https://img1.kbcard.com/home_re/pc/logo/48/logo-visa.png" alt="VISA카드"></span>		
				 			<em class="card-type__money">9,999,999</em>
						</div>									
						<div class="card-type__item">
				 			<span class="card-type__logo"><img src="https://img1.kbcard.com/home_re/pc/logo/48/logo-americanexpress.png" alt="AMEX카드"></span>		
				 			<em class="card-type__money">9,999,999</em>
						</div>	
						<div class="btn-wrap">
		                     <button type="button" class="btn btn--tertiary" onclick="javascript:addCardNew('09321','https://img1.kbcard.com/ST/img/cxc/kbcard/upload/img/product/09321_img.png','알뜰교통플러스 카드' ); return false;">비교함담기</button>
		                     <button type="button" class="btn btn--primary" onclick="javascript:goNewCard('','09321','1', '1','','','','', '','')">카드신청</button>
		                 </div>
				
		   	     </div>
		   	 </div>
		   	 <div class="pop-wrap pop-wrap--big" id="popup_layer_0" aria-hidden="false" tabindex="0" data-open="true" style="display: none; z-index: 9000;">
    <div class="pop-container pop-ani" style="width: 400px; height: 462px; top: 253.5px; left: 760px;" tabindex="0">
        <!-- width, height값 삭제하지 마세요~ -->
        <!-- pop-header -->
        <header class="pop-header">
            <h1 class="tit-dep2">연회비 안내</h1>
        </header>
        <div class="pop-close"><a href="javascript:void(0)" class="btn-pop btn-pop--close">닫기</a></div>
        <!--// pop-header -->

        <!-- 팝업컨텐츠 -->
        <div class="pop-inner">
            <div class="pop-cont" style="height: calc((100% - 112px) + 40px);">
                <div class="tbl-data tbl-data--type3">
                    <table>
                        <caption>연회비 안내</caption>
                        <colgroup>
                            <col style="width:20%">
                            <col>
                        </colgroup>
                        <tbody>
                        			<tr>
                                 <th scope="row" class="v-top"><img src="https://img1.kbcard.com/home_re/pc/logo/48/logo-domestic.png" alt="국내전용"></th>
                                 <td>
                                     <div class="box-count">
                                         <span>국내</span>
                                         <span>8,000</span>
                                     </div>
                                 </td>
                             </tr>						
							<tr>
                                 <th scope="row" class="v-top"><img src="https://img1.kbcard.com/home_re/pc/logo/48/logo-visa.png" alt="VISA카드"></th>
                                 <td>
                                     <div class="box-count">
                                         <span>VISA</span>
                                         <span>8,000</span>
                                     </div>
                                 </td>
                             </tr>						
				
                        </tbody>
                    </table>
                </div>
            </div>
            <div class="btn-wrap btn-wrap--footer">
                <button type="button" class="btn btn--primary">확인</button>
            </div> 
        </div>
    </div>
</div> 
		 </div>		 

    
    <div class="card-box__item">
    		<!-- 앞 -->
    		<div class="card-box__before">
    			<a href="#" class="linkDetail" onclick="javascript:goDetail('09122','')">
		    		<h3 class="tit-dep4">too 이지 easy해 카드</h3>
		  	        <p class="badge--txt pl0">진정한 Programmer를 위한 카드</p>	  	        
		            
					<p class="c-blue txt-ss mt8"></p>
					
					
					
					<div class="card-box__card row">
					
		            	<img src="<%=cp %>/image/easy.png" alt="너무 이지 easy해 카드">
		            </div>  
	            </a>		
	  		</div>
    		<!-- 뒤 -->
             <div class="card-box__after">             	
    			<a href="#" class="linkDetail" onclick="javascript:goDetail('09122','')">
                 <h3 class="tit-dep4">너무 이지 easy해 카드</h3>
                 <p class="badge--txt pl0">코딩만하면 월급이 통장에 들어온다!?!?</p>
                 </a>
                 
				<p class="c-blue txt-ss mt8"></p>
				
				
                 <div class="card-box__btn-wrap">
                     <span class="bold-m">연회비</span>
                     <a href="#popup_layer_1" class="btn-txt btn-txt--arr-r pop-open">자세히보기</a>
                 </div>
                 
                 <div class="card-type">
                    
						<div class="card-type__item">
				 			<span class="card-type__logo"><img src="https://img1.kbcard.com/home_re/pc/logo/48/logo-domestic.png" alt="국내전용"></span>		
				 			<em class="card-type__money">128,256</em>
						</div>									
				
						<div class="card-type__item">
				 			<span class="card-type__logo"><img src="https://img1.kbcard.com/home_re/pc/logo/48/logo-visa.png" alt="VISA카드"></span>		
				 			<em class="card-type__money">128,256</em>
						</div>									
						<div class="card-type__item">
				 			<span class="card-type__logo"><img src="https://img1.kbcard.com/home_re/pc/logo/48/logo-americanexpress.png" alt="AMEX카드"></span>		
				 			<em class="card-type__money">128,256</em>
						</div>	
						<div class="btn-wrap">
		                     <button type="button" class="btn btn--tertiary" onclick=""; return false;">비교함담기</button>
		                     <button type="button" class="btn btn--primary" onclick="javascript:goNewCard('','09122','1', '1','','','','', '','')">카드신청</button>
		                 </div>
				
		   	     </div>
		   	 </div>
		   	 <div class="pop-wrap pop-wrap--big" id="popup_layer_1" aria-hidden="false" tabindex="0" data-open="true" style="display: none; z-index: 9000;">
    <div class="pop-container pop-ani" style="width: 400px; height: 462px; top: 253.5px; left: 760px;" tabindex="0">
        <!-- width, height값 삭제하지 마세요~ -->
        <!-- pop-header -->
        <header class="pop-header">
            <h1 class="tit-dep2">연회비 안내</h1>
        </header>
        <div class="pop-close"><a href="javascript:void(0)" class="btn-pop btn-pop--close">닫기</a></div>
        <!--// pop-header -->

        <!-- 팝업컨텐츠 -->
        <div class="pop-inner">
            <div class="pop-cont" style="height: calc((100% - 112px) + 40px);">
                <div class="tbl-data tbl-data--type3">
                    <table>
                        <caption>연회비 안내</caption>
                        <colgroup>
                            <col style="width:20%">
                            <col>
                        </colgroup>
                        <tbody>
                        			<tr>
                                 <th scope="row" class="v-top"><img src="https://img1.kbcard.com/home_re/pc/logo/48/logo-domestic.png" alt="국내전용"></th>
                                 <td>
                                     <div class="box-count">
                                         <span>국내</span>
                                         <span>20,000</span>
                                     </div>
                                 </td>
                             </tr>						
							<tr>
                                 <th scope="row" class="v-top"><img src="https://img1.kbcard.com/home_re/pc/logo/48/logo-visa.png" alt="VISA카드"></th>
                                 <td>
                                     <div class="box-count">
                                         <span>VISA</span>
                                         <span>20,000</span>
                                     </div>
                                 </td>
                             </tr>						
				
                        </tbody>
                    </table>
                </div>
            </div>
            <div class="btn-wrap btn-wrap--footer">
                <button type="button" class="btn btn--primary">확인</button>
            </div> 
        </div>
    </div>
</div> 
		 </div>		 

    
    <div class="card-box__item">
    		<!-- 앞 -->
    		<div class="card-box__before">
    			<a href="#" class="linkDetail" onclick="javascript:goDetail('09123','')">
		    		<h3 class="tit-dep4">My:Way 상남자 카드</h3>
		  	        <p class="badge--txt pl0">'나'만의 길을 위한 필수 혜택 카드</p>	  	        
		            
					<p class="c-blue txt-ss mt8"></p>
					
					
					
					<div class="card-box__card row">
					
		            	<img src="<%=cp %>/image/myway.png" alt="My:Way 상남자 카드">
		            </div>  
	            </a>		
	  		</div>
    		<!-- 뒤 -->
             <div class="card-box__after">             	
    			<a href="#" class="linkDetail" onclick="javascript:goDetail('09123','')">
                 <h3 class="tit-dep4">My:Way 상남자 카드</h3>
                 <p class="badge--txt pl0">결제 취소는 필요없다. 오로지 My Way.</p>
                 </a>
                 
				<p class="c-blue txt-ss mt8"></p>
				
				
                 <div class="card-box__btn-wrap">
                     <span class="bold-m">연회비</span>
                     <a href="#popup_layer_2" class="btn-txt btn-txt--arr-r pop-open">자세히보기</a>
                 </div>
                 
                 <div class="card-type">
                    
						<div class="card-type__item">
				 			<span class="card-type__logo"><img src="https://img1.kbcard.com/home_re/pc/logo/48/logo-domestic.png" alt="국내전용"></span>		
				 			<em class="card-type__money">5,555,555</em>
						</div>									
				
						<div class="card-type__item">
				 			<span class="card-type__logo"><img src="https://img1.kbcard.com/home_re/pc/logo/48/logo-mastercard.png" alt="MASTER카드"></span>		
				 			<em class="card-type__money">5,555,555</em>
						</div>									
				
						<div class="card-type__item">
				 			<span class="card-type__logo"><img src="https://img1.kbcard.com/home_re/pc/logo/48/logo-americanexpress.png" alt="AMEX카드"></span>		
				 			<em class="card-type__money">5,555,555</em>
						</div>									
				
						<div class="btn-wrap">
		                     <button type="button" class="btn btn--tertiary" onclick="javascript:addCardNew('09123','https://img1.kbcard.com/ST/img/cxc/kbcard/upload/img/product/09123_img.png','My WE:SH 카드' ); return false;">비교함담기</button>
		                     <button type="button" class="btn btn--primary" onclick="javascript:goNewCard('','09123','1', '1','','','','', '','')">카드신청</button>
		                 </div>
				
		   	     </div>
		   	 </div>
		   	 <div class="pop-wrap pop-wrap--big" id="popup_layer_2" aria-hidden="false" tabindex="0" data-open="true" style="display: none; z-index: 9000;">
    <div class="pop-container pop-ani" style="width: 400px; height: 462px; top: 253.5px; left: 760px;" tabindex="0">
        <!-- width, height값 삭제하지 마세요~ -->
        <!-- pop-header -->
        <header class="pop-header">
            <h1 class="tit-dep2">연회비 안내</h1>
        </header>
        <div class="pop-close"><a href="javascript:void(0)" class="btn-pop btn-pop--close">닫기</a></div>
        <!--// pop-header -->

        <!-- 팝업컨텐츠 -->
        <div class="pop-inner">
            <div class="pop-cont" style="height: calc((100% - 112px) + 40px);">
                <div class="tbl-data tbl-data--type3">
                    <table>
                        <caption>연회비 안내</caption>
                        <colgroup>
                            <col style="width:20%">
                            <col>
                        </colgroup>
                        <tbody>
                        			<tr>
                                 <th scope="row" class="v-top"><img src="https://img1.kbcard.com/home_re/pc/logo/48/logo-domestic.png" alt="국내전용"></th>
                                 <td>
                                     <div class="box-count">
                                         <span>국내</span>
                                         <span>15,000</span>
                                     </div>
                                 </td>
                             </tr>						
							<tr>
                                 <th scope="row" class="v-top"><img src="https://img1.kbcard.com/home_re/pc/logo/48/logo-mastercard.png" alt="MASTER카드"></th>
                                 <td>
                                     <div class="box-count">
                                         <span>MASTER</span>
                                         <span>15,000</span>
                                     </div>
                                 </td>
                             </tr>						
							<tr>
                                 <th scope="row" class="v-top"><img src="https://img1.kbcard.com/home_re/pc/logo/48/logo-americanexpress.png" alt="AMEX카드"></th>
                                 <td>
                                     <div class="box-count">
                                         <span>AMEX</span>
                                         <span>15,000</span>
                                     </div>
                                 </td>
                             </tr>						
				
                        </tbody>
                    </table>
                </div>
            </div>

        </div>
    </div>
</div> 
</div>		 

	</div>




</body>
</html>