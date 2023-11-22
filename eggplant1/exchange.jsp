<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page import="com.google.gson.Gson"%>
<%@ page import="com.eggplant.ApiResponse"%>

<%String cp = request.getContextPath(); %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta charset="UTF-8">
    <title>API Response</title>
    <link rel="shortcut icon" href="<%=cp %>/image/LogoIcon.png" type="image/png"/>
    <link rel="stylesheet" type="text/css" href="<%=cp%>/data/style.css"/>
    
 <link href="http://vjs.zencdn.net/c/video-js.css" rel="stylesheet" />
<script src="http://vjs.zencdn.net/c/video.js"></script>
<script src="<%=cp%>/data/eggplantLink.js"></script>
    
 <style>
   body { padding: 0px; margin: 0px; }
      .jb-box { width: 100%; height: 100% overflow: hidden;margin: 0px auto; position: relative; }
      video { width: 100%; z-index: -1; }
      .jb-text { position: absolute; top: 50%; width: 100%; }
      .jb-text p { margin-top: -24px; text-align: center; font-size: 48px; color: #ffffff; }
 
 
 .ok {
  display: flex;
  flex-wrap: wrap;
  justify-content: center;
  margin-top: 40px;
  margin-bottom: 20px;
  gap: 15px;
}

.thumbnail {
  width: calc((63% - 10px) / 3);
  height: 530px;
  border-radius: 4px;
 
  overflow: hidden;
   box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
  transition: box-shadow 0.3s;
}

.thumbnail img {
  display: block;
  height: 350px;
  width: 100%;
  border-radius: 3px 3px 0 0;
  opacity: 0.8;
  
  transition: opacity 0.3s;
}

.thumbnail:hover img {
  opacity: 1; 
}


.thumbnail .comments {
  position: relative;
  background: #dbe5ff63;
  height: 200px;
  border-radius: 0 0 3px 3px;
}

.thumbnail button {
  cursor: pointer;
  -webkit-appearance: none;
  border: none;
  background: #4aae7a;
  color: #fff;
  padding: 8px 10px;
  
  border-radius: 3px;
  position: absolute;
  right: 10px;
  top: -45px;
}

.thumbnail .count {
  background: rgba(255, 255, 255, 0.8);
  color: #555;
  font-weight: bold;
  width: 40px;
  height: 18px;
  line-height: 18px;
  font-size: 14px;
  text-align: center;
  padding: 2px 0;
  position: absolute;
  top: -37px;
  left: 10px;
  border-radius: 3px;
  cursor: pointer;
}

.thumbnail .count:after {
  content: '';
  display: block;
  position: absolute;
  left: 45%;
  bottom: -6px;
  border-left: 8px solid transparent;
  border-right: 0px solid transparent;
  border-top: 6px solid rgba(255, 255, 255, 0.8);
}

.comments .fade {
  position: absolute;
  bottom: 20px;
  left: 0;
  right: 0;
  height: 45px;
  background-image: -webkit-linear-gradient(top, rgba(245, 245, 245, 0), rgba(245, 245, 245, 1) 100%);
  z-index: 10;
}

.comment {
  padding: 15px;
}

.comments .comment img {
  display: inline-block;
  width: 43px;
  height: 43px;
  border-radius: 40px;
  opacity: 1;
  margin-bottom: 17px;
      margin-top: -20px;
    margin-left: 13px;
    
}


.comment .text strong {
  color: #444;
  font-weight: 400;
}

.comment .text small {
  color: #aaa;
}
 
 
 
 
 
 
 /* 테이블 스타일 */
table {
  margin: auto;
 
  width: 700pt;
  border-collapse: collapse;
  margin-bottom: 20px;
   background-color: transparent;
}

 thead {
    position: sticky; /* thead 부분을 고정 */
    top: 0; /* 스크롤이 최상단에 도달할 때까지 thead를 고정 */
    background-color: #f2f2f2;
        }

/* 테이블 헤더 스타일 */
thead th {
  background-color: #e6e6ff; /* 연한 보라색 */
  border: 1px solid #ddd;
  padding: 10px;
  text-align: center;
  font-weight: bold;
}

  tbody {
            max-height: 400px; /* tbody의 최대 높이를 지정하여 스크롤 적용 */
            overflow-y: auto; /* 세로 스크롤 적용 */
        }

/* 테이블 내용 스타일 */
tbody td {
  border: 1px solid #ddd;
  padding: 10px;
  text-align: center;
}

/* 홀수 행 배경색 스타일 */
tbody tr:nth-child(odd) {
  background-color: #f9f9f9;
}

/* 마우스 오버 효과 스타일 */
tbody tr:hover {
  background-color: #f5f5f5;
}

/* 테이블 태두리 스타일 */
table, th, td {
  border: 1px solid black;
}

 .table-container {
            position: sticky; /* .table-container 부분을 고정 */
            top: 0; /* 스크롤이 최상단에 도달할 때까지 .table-container를 고정 */
            
            text-align: center;
        }
          .button-container {
      text-align: center;
      margin-top: -15px;
    }

    .button-container input[type="button"] {
    
       background-color: rgb(102, 51, 255);
    box-shadow: rgba(0, 0, 0, 0) 0px 0px 0px 0px, 
                rgba(0, 0, 0, 0) 0px 0px 0px 0px, 
                rgba(0, 0, 0, 0.12) 0px 1px 1px 0px, 
                rgb(102, 51, 255) 0px 0px 0px 1px, 
                rgba(0, 0, 0, 0) 0px 0px 0px 0px, 
                rgba(0, 0, 0, 0) 0px 0px 0px 0px, 
                rgba(60, 66, 87, 0.08) 0px 2px 5px 0px;
      height: 40px;
      width: 140px;
      margin-right: 10px;
      font-size: 16px;
      font-weight: bold;
      color: #ffffff;
    
      border: none;
      border-radius: 4px;
      cursor: pointer;
    }

    .button-container input[type="button"]:last-child {
      margin-right: 0;
    }
        
        
        
    </style>
</head>
<body>
<div id="container">
			<div id=pageHeader>
				<section class="hbody"> <a href="<%=cp %>/eggplant/main.do"><img src="<%=cp%>/image/sideLogo.png" style="width: 150px; height: 50px; display: inline-block; position: relative;" /></a>
				<ul id="menu">
					<li class="menu_item1"><a href="<%=cp %>/eggplant/board.do" class="link">고객 센터</a></li>
					<li class="menu_item1"><a href="<%=cp %>/eggplant/map.do" class="link">오시는 길</a></li>
				</ul>
				</section>
			</div>
		
		
		

<div id="mainArticle">



<div class="table-container">
	


    <h1 align="center">환율 정보</h1>
    <hr color="blue" width="130">
     <b><span style="color: red"> 환율 정보는 미국 시간 기준 (AM 9:30)으로 업데이트 됩니다</span></b>
    <br/><br/>
    
    <table>
     
     
      <video class="video-js vjs-default-skin" preload="auto" autoplay loop  muted>
    <source src="<%=cp%>/eggplant1/videos/qq.mp4" type="video/mp4" />
  </video>

   <% 
  ApiResponse responseObj1 = (ApiResponse) request.getAttribute("apiResponse");
  Double usdRate = responseObj1.getRates().get("USD");
  Double korRate = responseObj1.getRates().get("KRW");
  Double jepRate = responseObj1.getRates().get("JPY");
  Double eurRate = responseObj1.getRates().get("EUR");
 %>
  
  
  
  <div class="ok">
<div class="thumbnail">
  <img src="<%=cp %>/image/usa.jpg"/>
  <div class="comments">
    <div class="comment">
      <img src="<%=cp %>/image/usa2.jpg"/>
      <div class="text">
        <h1 style="color: black;">미국 (달러)</h1><h1 style="color: black;"><%= String.format("%.3f", usdRate) %></h1>
        <br/>
       
      </div>
    </div>
  </div>
</div>


<div class="thumbnail">
  <img src="<%=cp %>/image/ko.jpg"/>
  <div class="comments">
    <div class="comment">
      <img src="<%=cp %>/image/ko2.PNG"/>
      <div class="text">
        <h1 style="color: black;">한국 (원)</h1><h1 style="color: black;"><%= String.format("%.3f", korRate) %></h1>
        <br/>
       
      </div>
    </div>
  </div>
</div>


<div class="thumbnail">
  <img src="<%=cp %>/image/jp.jpg"/>
  <div class="comments">
    <div class="comment">
      <img src="<%=cp %>/image/jp2.jpg"/>
      <div class="text">
        <h1 style="color: black;">일본 (엔)</h1><h1 style="color: black;"><%= String.format("%.3f", jepRate) %></h1>
        <br/>
        
      </div>
    </div>
  </div>
</div>


<div class="thumbnail">
  <img src="<%=cp %>/image/uk.jpg"/>
  <div class="comments">
    <div class="comment">
      <img src="<%=cp %>/image/uk2.jpg"/>
      <div class="text">
        <h1 style="color: black;">유럽 (유로)</h1><h1 style="color: black;"><%= String.format("%.3f", eurRate) %></h1>
        <br/>
        
      </div>
    </div>
  </div>
</div>
</div>
		<div class="button-container">
 		<input type="button" id="toggleButton" value="환율 정보 더보기">
 		</div>
        <thead>
            <tr>
            
                <th width="500px;">Currency</th>
                <th width="500px;">Rate(기준 1$)</th>
            </tr>
        </thead>
        
        <tbody>
            <% 
            // ApiResponse 객체를 받아옵니다.
            ApiResponse responseObject = (ApiResponse) request.getAttribute("apiResponse");

            // 통화 코드와 한글 통화명을 매핑하는 맵을 생성합니다.
            Map<String, String> currencyMap = new HashMap<>();
            currencyMap.put("AED", "아랍 에미리트 디르함");
            currencyMap.put("AFN", "아프가니스탄 아프가니");
            currencyMap.put("ALL", "알바니아 레크");
            currencyMap.put("AMD", "아르메니아 드람");
            currencyMap.put("ANG", "네덜란드령 앤틸리스 길더");
            currencyMap.put("AOA", "앙골라 콴자");
            currencyMap.put("ARS", "아르헨티나 페소");
            currencyMap.put("AUD", "호주 달러");
            currencyMap.put("AWG", "아루바 플로린");
            currencyMap.put("AZN", "아제르바이잔 마나트");
            currencyMap.put("BAM", "보스니아 헤르체고비나 태환");
            currencyMap.put("BBD", "바베이도스 달러");
            currencyMap.put("BDT", "방글라데시 타카");
            currencyMap.put("BGN", "불가리아 레프");
            currencyMap.put("BHD", "바레인 디나르");
            currencyMap.put("BIF", "부룬디 프랑");
            currencyMap.put("BMD", "버뮤다 달러");
            currencyMap.put("BND", "브루나이 달러");
            currencyMap.put("BOB", "볼리비아노");
            currencyMap.put("BRL", "브라질 레알");
            currencyMap.put("BSD", "바하마 달러");
            currencyMap.put("BTC", "비트코인");
            currencyMap.put("BTN", "부탄 눌트럼");
            currencyMap.put("BWP", "보츠와나 풀라");
            currencyMap.put("BYN", "벨라루스 루블");
            currencyMap.put("BYR", "벨라루스 루블");
            currencyMap.put("BZD", "벨리즈 달러");
            currencyMap.put("CAD", "캐나다 달러");
            currencyMap.put("CDF", "콩고 프랑 콩골라스");
            currencyMap.put("CHF", "스위스 프랑");
            currencyMap.put("CLF", "칠레 유닛 (UF)");
            currencyMap.put("CLP", "칠레 페소");
            currencyMap.put("CNY", "중국 위안화");
            currencyMap.put("COP", "콜롬비아 페소");
            currencyMap.put("CRC", "코스타리카 콜론");
            currencyMap.put("CUC", "쿠바 태환 페소");
            currencyMap.put("CUP", "쿠바 페소");
            currencyMap.put("CVE", "카보베르데 에스쿠도");
            currencyMap.put("CZK", "체코 공화국 코루나");
            currencyMap.put("DJF", "지부티 프랑");
            currencyMap.put("DKK", "덴마크 크로네");
            currencyMap.put("DOP", "도미니카 공화국 페소");
            currencyMap.put("DZD", "알제리 디나르");
            currencyMap.put("EGP", "이집트 파운드");
            currencyMap.put("ERN", "에리트리아 나크파");
            currencyMap.put("ETB", "에티오피아 비르");
            currencyMap.put("EUR", "유로");
            currencyMap.put("FJD", "피지 달러");
            currencyMap.put("FKP", "포클랜드제도 파운드");
            currencyMap.put("GBP", "영국 파운드 스털링");
            currencyMap.put("GEL", "조지아 라리");
            currencyMap.put("GGP", "건지 파운드");
            currencyMap.put("GHS", "가나 시디");
            currencyMap.put("GIP", "지브롤터 파운드");
            currencyMap.put("GMD", "감비아 달라시");
            currencyMap.put("GNF", "기니 프랑");
            currencyMap.put("GTQ", "과테말라 케트살");
            currencyMap.put("GYD", "가이아나 달러");
            currencyMap.put("HKD", "홍콩 달러");
            currencyMap.put("HNL", "온두라스 렘피라");
            currencyMap.put("HRK", "크로아티아 쿠나");
            currencyMap.put("HTG", "아이티 구르드");
            currencyMap.put("HUF", "헝가리 포린트");
            currencyMap.put("IDR", "인도네시아 루피아");
            currencyMap.put("ILS", "이스라엘 신셰켈");
            currencyMap.put("IMP", "맨 섬 파운드");
            currencyMap.put("INR", "인도 루피");
            currencyMap.put("IQD", "이라크 디나르");
            currencyMap.put("IRR", "이란 리얄");
            currencyMap.put("ISK", "아이슬란드 크로나");
            currencyMap.put("JEP", "저지 파운드");
            currencyMap.put("JMD", "자메이카 달러");
            currencyMap.put("JOD", "요르단 디나르");
            currencyMap.put("JPY", "일본 엔");
            currencyMap.put("KES", "케냐 실링");
            currencyMap.put("KGS", "키르기스스탄 솜");
            currencyMap.put("KHR", "캄보디아 리얄");
            currencyMap.put("KMF", "코모르 프랑");
            currencyMap.put("KPW", "북한 원");
            currencyMap.put("KRW", "한국 원");
            currencyMap.put("KWD", "쿠웨이트 디나르");
            currencyMap.put("KYD", "케이맨 제도 달러");
            currencyMap.put("KZT", "카자흐스탄 텐게");
            currencyMap.put("LAK", "라오스 키프");
            currencyMap.put("LBP", "레바논 파운드");
            currencyMap.put("LKR", "스리랑카 루피");
            currencyMap.put("LRD", "라이베리아 달러");
            currencyMap.put("LSL", "레소토 로티");
            currencyMap.put("LTL", "리투아니아 리타스");
            currencyMap.put("LVL", "라트비아 라트");
            currencyMap.put("LYD", "리비아 디나르");
            currencyMap.put("MAD", "모로코 디르함");
            currencyMap.put("MDL", "몰도바 레우");
            currencyMap.put("MGA", "마다가스카르 아리아리");
            currencyMap.put("MKD", "마케도니아 디나르");
            currencyMap.put("MMK", "미얀마 키얏");
            currencyMap.put("MNT", "몽골 투그릭");
            currencyMap.put("MOP", "마카오 파타카");
            currencyMap.put("MRO", "모리타니 우기야");
            currencyMap.put("MUR", "모리셔스 루피");
            currencyMap.put("MVR", "몰디브 루피야");
            currencyMap.put("MWK", "말라위 콰쳐");
            currencyMap.put("MXN", "멕시코 페소");
            currencyMap.put("MYR", "말레이시아 링깃");
            currencyMap.put("MZN", "모잠비크 메티칼");
            currencyMap.put("NAD", "나미비아 달러");
            currencyMap.put("NGN", "니제리아 나이라");
            currencyMap.put("NIO", "니카라과 코르도바");
            currencyMap.put("NOK", "노르웨이 크로네");
            currencyMap.put("NPR", "네팔 루피");
            currencyMap.put("NZD", "뉴질랜드 달러");
            currencyMap.put("OMR", "오만 리얄");
            currencyMap.put("PAB", "파나마 발보아");
            currencyMap.put("PEN", "페루 누에보 솔");
            currencyMap.put("PGK", "파푸아뉴기니 키나");
            currencyMap.put("PHP", "필리핀 페소");
            currencyMap.put("PKR", "파키스탄 루피");
            currencyMap.put("PLN", "폴란드 즐로티");
            currencyMap.put("PYG", "파라과이 과라니");
            currencyMap.put("QAR", "카타르 리얄");
            currencyMap.put("RON", "루마니아 레우");
            currencyMap.put("RSD", "세르비아 디나르");
            currencyMap.put("RUB", "러시아 루블");
            currencyMap.put("RWF", "르완다 프랑");
            currencyMap.put("SAR", "사우디 아라비아 리얄");
            currencyMap.put("SBD", "솔로몬 제도 달러");
            currencyMap.put("SCR", "세이셸 루피");
            currencyMap.put("SDG", "수단 파운드");
            currencyMap.put("SEK", "스웨덴 크로나");
            currencyMap.put("SGD", "싱가포르 달러");
            currencyMap.put("SHP", "세인트 헬레나 파운드");
            currencyMap.put("SLE", "시에라리온 리온");
            currencyMap.put("SLL", "레온");
            currencyMap.put("SOS", "소말리아 실링");
            currencyMap.put("SRD", "수리남 달러");
            currencyMap.put("STD", "상투메 프린시페 달라");
            currencyMap.put("SVC", "엘살바도르 콜론");
            currencyMap.put("SYP", "시리아 파운드");
            currencyMap.put("SZL", "스와질란드 릴랑게니");
            currencyMap.put("THB", "태국 바트");
            currencyMap.put("TJS", "타지키스탄 소모니");
            currencyMap.put("TMT", "투르크메니스탄 마나트");
            currencyMap.put("TND", "튀니지 디나르");
            currencyMap.put("TOP", "통가 파앙가");
            currencyMap.put("TRY", "터키 리라");
            currencyMap.put("TTD", "트리니다드 토바고 달러");
            currencyMap.put("TWD", "신 타이완 달러");
            currencyMap.put("TZS", "탄자니아 실링");
            currencyMap.put("UAH", "우크라이나 그리브나");
            currencyMap.put("UGX", "우간다 실링");
            currencyMap.put("USD", "미국 달러");
            currencyMap.put("UYU", "우루과이 페소");
            currencyMap.put("UZS", "우즈베키스탄 숨");
            currencyMap.put("VEF", "베네수엘라 볼리바르");
            currencyMap.put("VES", "베네수엘라 볼리바르 소베르");
            currencyMap.put("VND", "베트남 동");
            currencyMap.put("VUV", "바누아투 바투");
            currencyMap.put("WST", "사모아 탈라");
            currencyMap.put("XAF", "중앙아프리카 CFA 프랑");
            currencyMap.put("XAG", "은");
            currencyMap.put("XAU", "금");
            currencyMap.put("XCD", "동카리브 달러");
            currencyMap.put("XDR", "특별인출권");
            currencyMap.put("XOF", "서아프리카 CFA 프랑");
            currencyMap.put("XPF", "CFP 프랑");
            currencyMap.put("YER", "예멘 리알");
            currencyMap.put("ZAR", "남아프리카 랜드");
            currencyMap.put("ZMK", "잠비아 콰쳐");
            currencyMap.put("ZMW", "잠비아 콰쳐");
            currencyMap.put("ZWL", "짐바브웨 달러");
            // 기타 통화 코드와 한글 통화명을 추가로 매핑합니다.

            // 변환된 객체에서 각 화폐별 환율 정보를 가져와 표에 출력
            String[] desiredCurrencies = { "KRW", "EUR","JPY","CNY","CAD","AUD",
            		"PHP","TRY","MXN","INR","RUB","ARS","AED","BDT","BRL","CHF","DKK","NZD"
            		,"UYU","XOF","YER","TWD","TND","SYP","SOS","RON","QAR","PLN","PKR","PGK",
            		"NPR","NAD","MOP","MNT","EGP","BSD","AZN","AOA",};

            // 변환된 객체에서 각 화폐별 환율 정보를 가져와 표에 출력합니다.
            for (String currencyCode : desiredCurrencies) {
                Double rate = responseObject.getRates().get(currencyCode);

                // 화폐 코드를 한글 통화명으로 변환합니다.
                String currencyName = currencyMap.getOrDefault(currencyCode, currencyCode);
            %>
            <tr>
                <td><%= currencyName %></td>
                <td><%= String.format("%.3f", rate) %></td>
            </tr>
            <% } %>
            
            
        </tbody>
       
    </table>


    
    
      <div class="button-container">
    <input type="button" value="메인 페이지" onclick="location='<%=cp %>';">
  </div>
    </div>

    </div>
 
    
    <div id="pageFooter">
				<div class="content_p">
					<p>5조 조장 정상명씨의 애착인형에서 영감을 얻은 EGGPLANT BANK 입니다</p>
					<p>주소 : 강남구 테헤란로 삼원타워 4층 ITWILL 6강의실 맨뒷자리
					<p>
					<p>TEL : 010-0000-0000</p>
				</div>
			</div>
		</div>
		
		
	<script>
    window.onload = function () {
        const toggleButton = document.getElementById('toggleButton');
        const table = document.getElementsByTagName('table')[0];
        
        // 최초 로딩 시 표를 숨김
        table.style.display = 'none';

        toggleButton.addEventListener('click', function () {
            if (table.style.display === 'none') {
                table.style.display = 'table';
                toggleButton.value = '환율 정보 닫기';
            } else {
                table.style.display = 'none';
                toggleButton.value = '환율 정보 확인';
            }
        });
    };
</script>
     
    
    
</body>
</html>