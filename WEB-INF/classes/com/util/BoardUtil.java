package com.util;

public class BoardUtil {
	
	//dataCount : 전체 데이터의 개수
	//numPerPage : 한 페이지에 표시 될 데이터의 갯수 ex) 3개씩 나눠서 표시, 10개씩 나눠서 표시
	//currentPage : 현재 표시할 페이지
	//totalPage : 전체 페이지 갯수
	//numPerBlock : 한 화면에 표시 될 페이지의 갯수
	//currentPageSetup : 표시할 첫 페이지에 -1 해준 값
	
	// 전체 페이지 수 구하기
	public int getPageCount(int numPerPage, int dataCount) { //5,6
		
		int pageCount = 0;
		pageCount = dataCount / numPerPage; // 전체 데이터 수 / 페이지당 보여줄 데이터 갯수
		
		if(dataCount % numPerPage != 0) { // 나눴을 때 딱 떨어지지 않으면 페이지 1개 더 만들기
			pageCount++;
		}
		
		return pageCount;
		
	}
	
	//페이지 처리 메소드
	public String pageIndexList(int currentPage, int totalPage, String boardUrl) {
		//(현재 페이지, 전체 페이지, 적용 할 위치)
		
		int numPerBlock = 5; // 5페이지씩 잘라서 구분
		int currentPageSetup; //이전 페이지(표시 할 첫 페이지 -1)
		int page; // 페이지 index
		
		StringBuffer sb = new StringBuffer(); // 많은 양의 문자를 다룰거라 StringBuffer 사용
		
		if(currentPage == 0 || totalPage == 0) { // 현재 페이지가 0이거나 전체 페이지가 0이면 null값 반환
			return "";
		}
		

		if(boardUrl.indexOf("?")!=-1) { // url에 ?가 있으면 뒤에 &을 추가, 없으면 ?을 추가
			boardUrl += "&";
		} else {
			boardUrl += "?";
		}
		
		//		 1 2 3 4 5 다음▶
		//◀이전 6 7 8 9 10 다음▶
		//◀이전 11 12 13 14 15 다음▶
		// 이전에 들어가는 페이지번호를 구하는 공식
		currentPageSetup = (currentPage / numPerBlock) * numPerBlock;
		
		if(currentPage % numPerBlock == 0) { 
			// ex) 현재 10페이지인데 5개씩 나눈다면 이전 페이지에 들어갈 값은 5페이지
			currentPageSetup  = currentPageSetup - numPerBlock;
		}
		
		//◀이전 버튼 추가
		if(totalPage > numPerBlock && currentPageSetup > 0) {
			//전체 페이지가 나누려는 갯수보다 많고, 이전 페이지 값이 0보다 크면 실행
			
			sb.append("<a href=\"" + boardUrl + "pageNum=" +
					currentPageSetup + "\">◀Prev</a>&nbsp;");
			
	
			
		}
		
		//◀이전 6 7 8 9 10 다음▶
		//◀이전 11 12 13 14 15 다음▶
		// 바로가기 페이지
		
		page = currentPageSetup + 1;
		
		while (page <= totalPage && page <= (currentPageSetup + numPerBlock)) {
			// 페이지가 전체 페이지 수 이하고, 이전페이지 값 + 나누려는 페이지 갯수 이하면 반복실행
			if (page == currentPage) {
			    sb.append("<a href=\"" + boardUrl + "pageNum=" + page + "\" class=\"selected\">" + page + "</a>&nbsp;");
			} else {
			    sb.append("<a href=\"" + boardUrl + "pageNum=" + page + "\">" + page + "</a>&nbsp;");
			}
			
			
			page++;
			
		}
		//◀이전 6 7 8 9 10 다음▶
		//◀이전 11 12
		//다음▶
		if (totalPage - currentPageSetup > numPerBlock) {
			//전체 페이지 수 - 이전 페이지에 있는 수가 나누려는 갯수보다 클 때 실행
			sb.append("<a href=\""+ boardUrl + "pageNum="+ page +
					"\">Next▶</a>&nbsp;");
			//<a href = "list.jsp?pageNum=11"Next▶</a>&nbsp;
		}
		
		
		return sb.toString();
		
	}
	
	
}
