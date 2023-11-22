package com.eggplant;

import java.io.IOException;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.sql.Connection;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.util.BoardUtil;
import com.util.DBConn;

public class EggplantServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doPost(req, resp);
	}

	protected void forward(HttpServletRequest req, HttpServletResponse resp, String url)
			throws ServletException, IOException {
		RequestDispatcher rd = req.getRequestDispatcher(url);
		rd.forward(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		req.setCharacterEncoding("UTF-8");

		Connection conn = DBConn.getConnection();
		EggplantDAO dao = new EggplantDAO(conn);
		ReservationDAO rDao = new ReservationDAO(conn);
		MemberDAO mDao = new MemberDAO(conn);
		BoardDAO bDao = new BoardDAO(conn);

		BoardUtil myUtil = new BoardUtil();

		String cp = req.getContextPath();
		String uri = req.getRequestURI();

		String url;

		if (uri.indexOf("accountCheck.do") != -1) {

			HttpSession session = req.getSession();
			CustomInfo info = (CustomInfo) session.getAttribute("customInfo");
			List<EggplantDTO> lists = null;
			// 테스트
			// System.out.println(info.getUserId());
			if (info != null) {
				lists = dao.accountCheck(info.getUserId());
			}

			req.setAttribute("lists", lists);
			url = "/eggplant1/accountCheck.jsp";
			forward(req, resp, url);

		} else if (uri.indexOf("transactionHistory.do") != -1) {
			System.out.println("transactionHistory 들어왔다");
			System.out.println(req.getParameter("userAccount") + "transaction history.do");
			System.out.println(req.getParameter("search") + "transaction history.do111");

			String userAccount = req.getParameter("userAccount");
			String search = req.getParameter("search");
			String sdt = req.getParameter("sdt");
			String edt = req.getParameter("edt");

			List<EggplantDTO> lists = null;

			if (sdt != null && edt != null && search == null) {
				search = "";
				System.out.println("여기는 1번");
				lists = dao.getLists(sdt, edt, userAccount, search);

			} else if (search == null) {
				search = "";
				System.out.println("여기는 2번");
				lists = dao.getLists(userAccount, search);
			} else {
				System.out.println("여기는 3번");
				lists = dao.getLists(userAccount, search);

			}

			System.out.println(search + "transaction history.do222");

			// List<EggplantDTO> lists3 = dao.inoutMoney(req.getParameter("account"));

			// 테스트
			// System.out.println(req.getParameter("search"));

			// 포워딩할 데이터
			req.setAttribute("lists", lists);
			req.setAttribute("userAccount", userAccount);
			// req.setAttribute("lists3", lists3);
			req.setAttribute("account", req.getParameter("account"));
			req.setAttribute("savings", req.getParameter("savings"));
			req.setAttribute("search", req.getParameter("search"));

			url = "/eggplant1/transactionHistory.jsp";
			forward(req, resp, url);

		} else if (uri.indexOf("created.do") != -1) {

			url = "/eggplant1/created.jsp";
			forward(req, resp, url);

		} else if (uri.indexOf("created_ok.do") != -1) {

			EggplantDTO dto = new EggplantDTO();

			dto.setAccount("223-07-" + req.getParameter("account"));
			dto.setCreditPassword(req.getParameter("creditPassword"));
			dto.setUserName(req.getParameter("userName"));

			dto.setUserId(req.getParameter("userId"));
			dto.setUserPassword(req.getParameter("userPassword"));
			dto.setUserAddr(req.getParameter("userAddr"));
			dto.setUserPhoneNum(req.getParameter("userPhoneNum"));
			dto.setUserEmail(req.getParameter("userEmail"));
			dto.setUserBirth(req.getParameter("userBirth"));

			// guest정보만 입력
			dao.insertData(dto);

			// 추가로 credit에 계좌 및 비밀번호 입력
			dao.insertCreditData(dto);

			// 리다이렉트로 회원가입완료창 만들면 연결
			url = "/eggplant1/created_ok.jsp";
			forward(req, resp, url);

		} else if (uri.indexOf("login.do") != -1) {

			url = "/eggplant1/login.jsp";
			forward(req, resp, url);

		} else if (uri.indexOf("login_ok.do") != -1) {

			String userId = req.getParameter("userId");
			String userPassword = req.getParameter("userPassword");

			// 아이디와 비밀번호 매치된 아이디 있는지 확인하고 데이터 가져오기
			EggplantDTO dto = mDao.getReadData(userId);

			if (dto == null || (!dto.getUserPassword().equals(userPassword))) {
				req.setAttribute("message", "아이디 또는 패스워드를 정확히 입력하세요.");

				url = "/eggplant1/login.jsp";
				forward(req, resp, url);
				return;
			}
			HttpSession session = req.getSession();

			CustomInfo customInfo = new CustomInfo();

			customInfo.setUserId(dto.getUserId());
			customInfo.setUserName(dto.getUserName());

			// 세션에 데이터 userid 및 username 올리기
			session.setAttribute("customInfo", customInfo);
			// 메인
			url = cp + "/eggplant/main.do";
			resp.sendRedirect(url);

		} else if (uri.indexOf("logout.do") != -1) {

			HttpSession session = req.getSession();

			// 세션데이터 삭제
			session.removeAttribute("customInfo");
			session.invalidate();

			url = cp + "/eggplant/main.do";
			resp.sendRedirect(url);

		} else if (uri.indexOf("searchpw.do") != -1) {

			url = "/eggplant1/searchpw.jsp";
			forward(req, resp, url);

		} else if (uri.indexOf("searchpw_ok.do") != -1) {

			String userId = req.getParameter("userId");
			String userPhoneNum = req.getParameter("userPhoneNum");
			String userName = req.getParameter("userName");

			EggplantDTO dto = dao.getReadData(userId);

			if (dto == null || (!dto.getUserName().equals(userName) && !dto.getUserPhoneNum().equals(userPhoneNum))) {

				req.setAttribute("message", "일치하는 회원정보가 없거나 회원정보가 존재하지 않습니다.");

				url = "/eggplant1/login.jsp";
				forward(req, resp, url);
				return;

			} else if (dto.getUserId().equals(userId) && dto.getUserPhoneNum().equals(userPhoneNum)) {

				req.setAttribute("message", "비밀번호는 [" + dto.getUserPassword() + "] 입니다");

				url = "/eggplant1/login.jsp";
				forward(req, resp, url);
			}

		} else if (uri.indexOf("updated.do") != -1) {

			HttpSession session = req.getSession();
			CustomInfo info = (CustomInfo) session.getAttribute("customInfo");

			EggplantDTO dto = mDao.getReadDataCredit(info.getUserId());

			if (dto == null) {
				url = cp;
				resp.sendRedirect(url);
				return;
			}

			req.setAttribute("dto", dto);

			url = "/eggplant1/updated.jsp";
			forward(req, resp, url);

		} else if (uri.indexOf("updated_ok.do") != -1) {

			HttpSession session = req.getSession();

			CustomInfo info = (CustomInfo) session.getAttribute("customInfo");

			EggplantDTO dto = new EggplantDTO();

			dto.setUserPassword(req.getParameter("userPassword"));
			dto.setUserAddr(req.getParameter("userAddr"));
			dto.setUserPhoneNum(req.getParameter("userPhoneNum"));
			dto.setUserEmail(req.getParameter("userEmail"));

			dao.updatedData(dto);

			url = "/eggplant1/main.jsp";
			forward(req, resp, url);

		} else if (uri.indexOf("main.do") != -1) {
			HttpSession session = req.getSession();

			CustomInfo info = (CustomInfo) session.getAttribute("customInfo");

			if (info != null) {
				req.setAttribute("custonInfo", info);
			}

			url = "/eggplant1/main.jsp";
			forward(req, resp, url);

		} else if (uri.indexOf("loan.do") != -1) {

			HttpSession session = req.getSession();

			CustomInfo info = (CustomInfo) session.getAttribute("customInfo");

			EggplantDTO dto = dao.getReadData(info.getUserId());

			req.setAttribute("dto", dto);

			url = "/eggplant1/loan.jsp";
			forward(req, resp, url);

			// 대출 등급 나오고 이자율 표 나오는 페이지

		} else if (uri.indexOf("loan_lo.do") != -1) {

			req.setAttribute("property", req.getParameter("property"));
			req.setAttribute("loans", req.getParameter("loans"));

			url = "/eggplant1/loan_lo.jsp";
			forward(req, resp, url);

		} else if (uri.indexOf("loan_ok.do") != -1) {
			HttpSession session = req.getSession();

			CustomInfo info = (CustomInfo) session.getAttribute("customInfo");

			if (info != null) {

				EggplantDTO dto = new EggplantDTO();
				dto.setUserId(info.getUserId());
				dto.setUserName(info.getUserName());
				// dto.setUserId(req.getParameter("userId"));
				// dto.setAccount(req.getParameter("account"));
				dto.setProperty(Integer.parseInt(req.getParameter("property")));
				dto.setLoans(Integer.parseInt(req.getParameter("loans")));

				dao.creditInsertData(dto);

				req.setAttribute("dto", dto);

				url = "/eggplant1/loan2.jsp";
				forward(req, resp, url);

			} else {
				String errorMessage = "아이디 정보가 세션에 없음";
				req.setAttribute("error", errorMessage);
			}

			// 대출 등급 나오고 이자율 표 나오는 페이지
		} else if (uri.indexOf("loan_ok2.do") != -1) {

			url = "/eggplant1/loan3.jsp";
			forward(req, resp, url);

			// 약관 확인 및 대출금액 입력 페에지
		} else if (uri.indexOf("loan_ok3.do") != -1) {

			HttpSession session = req.getSession();

			CustomInfo info = (CustomInfo) session.getAttribute("customInfo");

			EggplantDTO dto = new EggplantDTO();
			dto.setUserId(info.getUserId());

			int loannum = Integer.parseInt(req.getParameter("loannum"));
			String account = (req.getParameter("account"));

			dao.LoanUpData(loannum, account);
			int loans = dao.LoanGetReadData(account);

			if (loans == 0) {

				req.setAttribute("message", "계좌 정보가 일치 하지 않습니다");
				url = "/eggplant1/loan3.jsp";
				forward(req, resp, url);
				return;
			}

			int savins = dao.getReadSavings(account);
			rDao.insertTransactionsLoans(account, "가지 대출", savins, loannum);

			req.setAttribute("dto", dto);
			req.setAttribute("loannum", loannum);
			req.setAttribute("loans", loans);

			url = "/eggplant1/loan4.jsp";
			forward(req, resp, url);

		} else if (uri.indexOf("loan_ok10.do") != -1) {

			url = "/eggplant1/main.jsp";
			forward(req, resp, url);

		}

		// 이체 부분
		else if (uri.indexOf("reservation.do") != -1) {

			req.setAttribute("userAccount", req.getParameter("userAccount"));
			req.setAttribute("userName", req.getParameter("userName"));

			url = "/eggplant1/reservation.jsp";
			forward(req, resp, url);

		} else if (uri.indexOf("reservation_lo.do") != -1) {

			req.setAttribute("userName", req.getParameter("userName"));
			req.setAttribute("userAccount", req.getParameter("userAccount"));
			req.setAttribute("targetBank", req.getParameter("targetBank"));
			req.setAttribute("targetName", req.getParameter("targetName"));
			req.setAttribute("targetAccount", req.getParameter("targetAccount"));
			req.setAttribute("userPwd", req.getParameter("userPwd"));
			req.setAttribute("sendSaving", req.getParameter("sendSaving"));
			req.setAttribute("sendTime", req.getParameter("sendTime"));

			url = "/eggplant1/reservation_lo.jsp";
			forward(req, resp, url);
		}

		else if (uri.indexOf("reservation_ck.do") != -1) {
			// 계좌조회에서 이체 누르면 Account 넘겨받기
			// String senderAccount = req.getParameter("Account");
			// 계좌번호로 데이터 가져오기
			// EggplantDTO senderDto = dao.getReadAccountData(senderAccount);
			// 세션에 올라간 유저 이름 가져오기
			String userName = req.getParameter("userName");
			String userAccount = req.getParameter("userAccount");
			String targetBank = req.getParameter("targetBank");
			String targetName = req.getParameter("targetName");
			String targetAccount = req.getParameter("targetAccount");
			String pwd = req.getParameter("userPwd");
			int sendSaving = Integer.parseInt(req.getParameter("sendSaving"));
			String sendTime = req.getParameter("sendTime");

			sendTime = sendTime.replaceAll("T", " ");
			sendTime += ":00";
			System.out.println(sendTime + "reservation_ck");
			// 1. sender 계좌에 잔액이 있는지 확인

			int beforeSavings = rDao.getReadAccountSavings(userAccount);
			if (beforeSavings < sendSaving) {
				// 잔액이 없는것 처리
				req.setAttribute("userAccount", req.getParameter("userAccount"));
				req.setAttribute("userName", req.getParameter("userName"));

				String message = "잔액이 없습니다. 잔액을 확인해주세요";

				req.setAttribute("message", message);
				url = "/eggplant1/reservation_fail.jsp";
				forward(req, resp, url);
				return;
			}

			// 2. target 계좌가 있는지 확인
			if (!rDao.getReadAccountData(targetAccount)) {
				// 해당 계좌가 없음
				req.setAttribute("userAccount", req.getParameter("userAccount"));
				req.setAttribute("userName", req.getParameter("userName"));

				String message = "받는분의 계좌를 못찾았습니다. 계좌를 확인해주세요";

				req.setAttribute("message", message);
				url = "/eggplant1/reservation_fail.jsp";
				forward(req, resp, url);
				return;
			}

			// 3. sender 계좌 비밀번호 맞는지 확인
			if (!rDao.getReadCheckPwd(userAccount, pwd)) {
				// 비번 틀림
				System.out.println(userAccount + "reservation_ck");
				System.out.println(pwd + "reservation_ck");
				req.setAttribute("userAccount", req.getParameter("userAccount"));
				req.setAttribute("userName", req.getParameter("userName"));

				String message = "비밀번호를 틀렸습니다. 비밀번호를 확인해주세요";

				req.setAttribute("message", message);
				url = "/eggplant1/reservation_fail.jsp";
				forward(req, resp, url);
				return;
			}

			EggplantDTO dto = new EggplantDTO();
			dto.setTargetBank(targetBank);
			dto.setTargetName(targetName);
			dto.setTargetAccount(targetAccount);
			dto.setSendSaving(sendSaving);
			dto.setSendTime(sendTime);
			// 세션에 올라간 유저 이름, req로 받아온 계좌번호 넣기
			rDao.insertReservation(dto, dto.getSendSaving(), userName, userAccount);

			int afterSavings = beforeSavings - sendSaving;
			System.out.println("afterSavings : " + afterSavings);

			req.setAttribute("targetName", targetName);
			req.setAttribute("sendSaving", sendSaving);
			req.setAttribute("sendTime", sendTime);
			req.setAttribute("afterSavings", afterSavings);

			url = "/eggplant1/reservation_ok.jsp";
			forward(req, resp, url);
		} else if (uri.indexOf("reservation_ok.do") != -1) {
			req.setAttribute("userAccount", req.getParameter("userAccount"));
			req.setAttribute("targetName", req.getAttribute("targetName"));
			req.setAttribute("sendSaving", req.getAttribute("sendSaving"));
			req.setAttribute("sendTime", req.getAttribute("sendTime"));
			req.setAttribute("afterSavings", req.getAttribute("afterSavings"));

			url = "/eggplant1/reservation.jsp";
			forward(req, resp, url);
		} else if (uri.indexOf("selectQuestion_ok.do") != -1) {// 빠른 답변

			// 로그인정보 세션에 담기
			HttpSession session = req.getSession();
			CustomInfo info = (CustomInfo) session.getAttribute("customInfo");

			String boardTitle = req.getParameter("boardTitle");
			String subject = req.getParameter("subject");
			String count = req.getParameter("count");

			if (count == null) {
				count = "0";
			}

			if (count.equals("0")) {
				count = "1";
			} else if (count.equals("1")) {
				count = "2";
			} else if (count.equals("2")) {
				count = "3";
			} else if (count.equals("3")) {
				count = "4";
			}

			if (subject != null) {

				List<EggplantDTO> lists = mDao.getBoardContent(subject);
				req.setAttribute("lists", lists);
				req.setAttribute("count", count);

				url = "/eggplant1/selectQuestion.jsp";
				forward(req, resp, url);
				return;
			}

			List<EggplantDTO> lists = mDao.getBoardLists(boardTitle);
			req.setAttribute("lists", lists);

			req.setAttribute("count", count);

			url = "/eggplant1/selectQuestion.jsp";

			forward(req, resp, url);

		} else if (uri.indexOf("map.do") != -1) {
			
			url = "/eggplant1/mmmap.jsp";
			forward(req, resp, url);
			
		} else if (uri.indexOf("board.do") != -1) {

			String pageNum = req.getParameter("pageNum");

			int currentPage = 1;

			if (pageNum != null) {

				currentPage = Integer.parseInt(pageNum);

			}
			// 대출, 적금 등 타이틀 검색
			String searchKey = req.getParameter("searchKey");

			if (searchKey != null && !searchKey.equals("")) {

				int dataCount = bDao.getKeyCount(searchKey);

				int numPerPage = 5;
				int totalPage = myUtil.getPageCount(numPerPage, dataCount);

				if (currentPage > totalPage) {
					currentPage = totalPage;
				}

				int start = (currentPage - 1) * numPerPage + 1;
				int end = currentPage * numPerPage;

				List<EggplantDTO> lists = bDao.getSearchKeyLists(start, end, searchKey);

				String param = "searchKey=" + searchKey;
				String boardUrl = cp + "/eggplant/board.do";

				if (!param.equals("")) {
					boardUrl = boardUrl + "?" + param;
				}

				String pageIndexList = myUtil.pageIndexList(currentPage, totalPage, boardUrl);

				req.setAttribute("lists", lists);
				req.setAttribute("pageIndexList", pageIndexList);
				req.setAttribute("dataCount", dataCount);
				req.setAttribute("boardUrl", boardUrl);

				url = "/eggplant1/board.jsp";

				forward(req, resp, url);
				return;
			}

			// 검색어 subject
			String searchValue = req.getParameter("searchValue");

			if (searchValue != null && !searchValue.equals("")) {

				int dataCount = bDao.getValueCount(searchValue);

				int numPerPage = 5;
				int totalPage = myUtil.getPageCount(numPerPage, dataCount);

				if (currentPage > totalPage) {
					currentPage = totalPage;
				}

				int start = (currentPage - 1) * numPerPage + 1;
				int end = currentPage * numPerPage;

				List<EggplantDTO> lists = bDao.getSearchValueLists(start, end, searchValue);

				String param = "searchValue=" + searchValue;

				if (searchValue == null || searchValue.equals("")) {
					param = "";
				}

				String boardUrl = cp + "/eggplant/board.do";

				if (!param.equals("")) { // 검색을 했으면 검색 결과를 list.do 뒤에 붙이기
					boardUrl = boardUrl + "?" + param;
				}

				String pageIndexList = myUtil.pageIndexList(currentPage, totalPage, boardUrl);

				req.setAttribute("lists", lists);
				req.setAttribute("pageIndexList", pageIndexList);
				req.setAttribute("dataCount", dataCount);
				req.setAttribute("boardUrl", boardUrl);

				url = "/eggplant1/board.jsp";

				forward(req, resp, url);
				return;
			}

			// 전체 데이터 검색
			searchKey = req.getParameter("searchKey");
			searchValue = req.getParameter("searchValue");

			if (searchValue == null || searchValue.isEmpty()) {
				searchKey = "board_title";
				searchValue = "";

			} else {

				if (req.getMethod().equalsIgnoreCase("GET")) {
					searchValue = URLDecoder.decode(searchValue, "UTF-8");
				}

			}

			int dataCount = bDao.getDataCount(searchKey, searchValue);

			int numPerPage = 5;
			int totalPage = myUtil.getPageCount(numPerPage, dataCount);

			if (currentPage > totalPage) {
				currentPage = totalPage;
			}

			int start = (currentPage - 1) * numPerPage + 1;
			int end = currentPage * numPerPage;

			List<EggplantDTO> lists = bDao.getLists(start, end, searchKey, searchValue);

			String param = "";

			if (searchValue != null && !searchValue.equals("")) {
				param = "searchKey=" + searchKey;
				param += "&searchValue=" + URLEncoder.encode(searchValue, "UTF-8");
			} else if (searchValue == null || searchValue.equals("")) {
				param = "";
			}

			String boardUrl = cp + "/eggplant/board.do";

			if (!param.equals("")) { // 검색을 했으면 검색 결과를 list.do 뒤에 붙이기
				boardUrl = boardUrl + "?" + param;
			}

			String pageIndexList = myUtil.pageIndexList(currentPage, totalPage, boardUrl);

			// 포워딩 할 데이터
			req.setAttribute("lists", lists);
			req.setAttribute("pageIndexList", pageIndexList);
			req.setAttribute("dataCount", dataCount);
			req.setAttribute("boardUrl", boardUrl);

			url = "/eggplant1/board.jsp";

			forward(req, resp, url);
			return;
		} else if (uri.indexOf("mypage.do") != -1) {// mypage용

			// 로그인정보 세션에 담기
			HttpSession session = req.getSession();
			CustomInfo info = (CustomInfo) session.getAttribute("customInfo");

			String boardTitle = req.getParameter("boardTitle");
			String subject = req.getParameter("subject");
			String count = req.getParameter("count");

			if (count == null) {
				count = "0";
			}

			if (count.equals("0")) {
				count = "1";
			} else if (count.equals("1")) {
				count = "2";
			} else if (count.equals("2")) {
				count = "3";
			} else if (count.equals("3")) {
				count = "4";
			}

			if (info == null) { // 세션 정보없으면
				
				url = "/eggplant/main.do";
				resp.sendRedirect(url);
				
			}

			if (subject != null) {

				List<EggplantDTO> lists = mDao.getBoardContent(subject);
				req.setAttribute("lists", lists);
				req.setAttribute("count", count);
				session.setAttribute("customInfo", info);
				url = "/eggplant1/mypage.jsp";
				forward(req, resp, url);
				return;
			}

			List<EggplantDTO> lists = mDao.getBoardLists(boardTitle);
			req.setAttribute("lists", lists);
			req.setAttribute("count", count);
			session.setAttribute("customInfo", info);

			EggplantDTO dto = dao.getReadData(info.getUserId());

			List<EggplantDTO> lists2 = dao.accountCheck(info.getUserId());
			req.setAttribute("dto", dto);
			req.setAttribute("lists2", lists2);

			url = "/eggplant1/mypage.jsp";

			forward(req, resp, url);

		} else if (uri.indexOf("card.do") != -1) {
			url = "/eggplant1/card.jsp";
			forward(req, resp, url);

		} else if (uri.indexOf("eggmoney.do") != -1) {
			url = "/eggplant1/eggmoney.jsp";
			forward(req, resp, url);

		} else if (uri.indexOf("eggmoney_ok.do") != -1) {

			HttpSession session = req.getSession();
			CustomInfo info = (CustomInfo) session.getAttribute("customInfo");
			
			int points = Integer.parseInt(req.getParameter("point"));
			
			String userId = info.getUserId();
			// 테스트
			// String userId = "suzi";

			dao.updatePoints(userId, points);

			url = cp + "/eggplant/mypage.do";
			resp.sendRedirect(url);

		}
		else if(uri.indexOf("popup.do") != -1) {
			
			url = "/eggplant1/popup.jsp";
			
			forward(req, resp, url);
			
		}
	}
}
