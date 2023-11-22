package com.util;

public class MyUtil {

	// 전체 페이지 수를 구하는 메서드
	public int getPageCount(int numPerPage, int dataCount) {

		int pageCount = 0;
		pageCount = dataCount / numPerPage;

		if (dataCount % numPerPage != 0) {
			pageCount++;
		}

		return pageCount;
	}

	// 페이지 처리 메서드
	public String pageIndexList(int currentPage, int totalPage, String listUrl) {

		// <[1,2,3,4,5]> 선택지 5개씩
		int numPerBlock = 5;

		// 이전페이지에(표시할 첫페이지 -1)
		int currentPageSetup;
		int page;

		StringBuffer sb = new StringBuffer();

		if (currentPage == 0 || totalPage == 0) {
			return "";
		}

		// listUrl에 들어오는 값은 list.jsp&pageNum=2 가 들어올수도 있고,
		// list.jsp?searchKey=subject&searchValue=suzi &pageNum=2
		if (listUrl.indexOf("?") != -1) {
			listUrl += "&";
		} else {
			listUrl += "?";
		}

		// ◀이전 6 7 8 9 10 다음▶
		// ◀이전 11 12 13 14 15 다음▶
		// 이전에 사용한 페이지 번호 구하는 공식
		currentPageSetup = (currentPage / numPerBlock) * numPerBlock;

		if (currentPage % numPerBlock == 0) {
			currentPageSetup = currentPageSetup - numPerBlock;
		}

		// ◀이전 눌렀을때 옮겨가는
		if (totalPage > numPerBlock && currentPageSetup > 0) {
			sb.append("<a href=\"" + listUrl + "pageNum=" + currentPageSetup + "\">◀이전</a>&nbsp;");

			// <a href="list.jsp?pageNum=5">◀이전</a>&nbsp
		}

		// 바로가기 페이지(숫자)
		page = currentPageSetup + 1;
		
		while (page <= totalPage && page <= (currentPageSetup + numPerBlock)) {

			if (page == currentPage) {
				sb.append("<font color=\"Fuchsia\">" + page + "</font>&nbsp;");
				// <font color = "Fuchsia">9</font>&nbsp;
			} else {
				sb.append("<a href=\"" + listUrl + "pageNum=" + page + "\">" + page + "</a>&nbsp;");
				// <a href = "list.jsp?pageNum=10">
				

			}
			page++;
		}

		// 다음 눌렀을때 다음▶

		if (totalPage - currentPageSetup > numPerBlock) {

			sb.append("<a href=\"" + listUrl + "pageNum=" + page + "\">다음▶</a>&nbsp;");
			// <a href="list.jsp>?pageNum=11">다음▶</a>&nbsp;

		}

		return sb.toString();

	}

}
