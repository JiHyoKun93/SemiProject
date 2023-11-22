
package com.eggplant;

import java.io.IOException;
import java.sql.Connection;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.swing.plaf.synth.SynthSeparatorUI;

import com.util.DBConn;
import com.util.MyUtil;

public class MemberServlet extends HttpServlet{

	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doPost(req, resp);
	}

	protected void forward(HttpServletRequest req, HttpServletResponse resp, String url) throws ServletException, IOException {

		RequestDispatcher rd = req.getRequestDispatcher(url);
		rd.forward(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		req.setCharacterEncoding("UTF-8");
		String cp = req.getContextPath();

		Connection conn = DBConn.getConnection();
		MemberDAO dao = new MemberDAO(conn);

		MyUtil myUtil = new MyUtil();

		String uri = req.getRequestURI();

		String url;

		if (uri.indexOf("created.do") != -1) { //회원가입

			url = "/eggplant1/created.jsp";
			forward(req, resp, url);

		} else if (uri.indexOf("created_ok.do") != -1) {

			EggplantDTO dto = new EggplantDTO();

			dto.setAccount("223-07-"+req.getParameter("account"));
			dto.setCreditPassword(req.getParameter("creditPassword"));
			dto.setUserName(req.getParameter("userName"));

			dto.setUserId(req.getParameter("userId"));
			dto.setUserPassword(req.getParameter("userPassword"));
			dto.setUserAddr(req.getParameter("userAddr"));
			dto.setUserPhoneNum(req.getParameter("userPhoneNum"));
			dto.setUserEmail(req.getParameter("userEmail"));
			dto.setUserBirth(req.getParameter("userBirth"));

			//guest정보만 입력
			dao.insertData(dto);

			//추가로 credit에 계좌 및 비밀번호 입력
			dao.insertCreditData(dto);

			//리다이렉트로 회원가입완료창 만들면 연결
			url = "/eggplant1/created_ok.jsp";
			forward(req, resp, url);


		} else if (uri.indexOf("login.do") != -1) {//로그인 창

			url = "/eggplant1/login.jsp";
			forward(req, resp, url);

		} else if (uri.indexOf("login_ok.do") != -1) {//로그인 완료

			String userId = req.getParameter("userId");
			String userPassword = req.getParameter("userPassword");

			//아이디와 비밀번호 매치된 아이디 있는지 확인하고 데이터 가져오기
			EggplantDTO dto = dao.getReadData(userId);
			
			if (dto==null || (!dto.getUserPassword().equals(userPassword))) {
				req.setAttribute("message", "아이디 또는 패스워드를 정확히 입력하세요.");
				
				url = "/eggplant1/login.jsp";
				forward(req, resp, url);
				return;
			}	
			HttpSession session = req.getSession();

			CustomInfo customInfo = new CustomInfo();
			
			customInfo.setUserId(dto.getUserId());
			customInfo.setUserName(dto.getUserName());
			
			//세션에 데이터 userid 및 username 올리기
			session.setAttribute("customInfo", customInfo);
			//메인
			url = cp+"/eggplant/updated.do";
			resp.sendRedirect(url);

		} else if (uri.indexOf("logout.do") != -1) { //로그아웃

			HttpSession session = req.getSession();

			//세션데이터 삭제
			session.removeAttribute("customInfo");
			session.invalidate();

			url = cp;
			resp.sendRedirect(url);


		} else if (uri.indexOf("updated.do") != -1) { //회원정보 수정

			HttpSession session = req.getSession();

			CustomInfo info = (CustomInfo) session.getAttribute("customInfo");

			EggplantDTO dto = dao.getReadDataCredit(info.getUserId());
			
			
			if (dto == null) {
				url = cp;
				resp.sendRedirect(url);
			}
			
			req.setAttribute("dto", dto);

			url = "/eggplant1/updated.jsp";
			forward(req, resp, url);

		} else if (uri.indexOf("updated_ok.do") != -1) { //회원정보 수정

			HttpSession session = req.getSession();

			CustomInfo info = (CustomInfo) session.getAttribute("customInfo");

			EggplantDTO dto = new EggplantDTO();

			dto.setUserPassword(req.getParameter("userPassword"));
			dto.setUserAddr(req.getParameter("userAddr"));
			dto.setUserPhoneNum(req.getParameter("userPhoneNum"));
			dto.setUserEmail(req.getParameter("userEmail"));

			dao.updatedData(dto);

			url = cp;
			resp.sendRedirect(url);

		} else if (uri.indexOf("eggplantMain.do") != -1) { //메인페이지

			url = "/eggplant1/eggplantMain.jsp";
			resp.sendRedirect(url);

		//비번찾기
		} else if (uri.indexOf("searchpw.do") != -1) { //비밀번호찾기

			url = "/eggplant1/searchpw.jsp";
			forward(req, resp, url);

		} else if (uri.indexOf("searchpw_ok.do") != -1) { //비밀번호찾기 완료

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

		}else if (uri.indexOf("selectQuestion_ok.do")!=-1) {//빠른 답변

			//로그인정보 세션에 담기
			HttpSession session = req.getSession();
			CustomInfo info = (CustomInfo)session.getAttribute("customInfo");

			String boardTitle = req.getParameter("boardTitle");
			String subject = req.getParameter("subject");
			String count = req.getParameter("count");

			if(count==null) {
				count ="0";
			}

			if(count.equals("0")) {
				count = "1";
			}else if(count.equals("1")) {
				count = "2";
			}else if(count.equals("2")) {
				count = "3";
			}else if(count.equals("3")) {
				count = "4";
			}

			if(info == null) { //세션 정보없으면
				info = new CustomInfo();
				info.setUserName("방문자");
				info.setUserId("Visitor");
				session.setAttribute("customInfo", info);
			}


			if(subject!=null) {

				List<EggplantDTO> lists = dao.getBoardContent(subject);
				req.setAttribute("lists", lists);
				req.setAttribute("count", count);

				url = "/selectQuestion/selectQuestion.jsp";
				forward(req, resp, url);
				return;
			}

			List<EggplantDTO> lists = dao.getBoardLists(boardTitle);
			req.setAttribute("lists", lists);

			req.setAttribute("count", count);

			url = "/selectQuestion/selectQuestion.jsp";

			forward(req, resp, url);

		}				
	}

}
