package com.eggplant;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;


public class MemberDAO {

	private Connection conn = null;
	
	public MemberDAO(Connection conn) {
		this.conn = conn;
	}
	
	public List<EggplantDTO> getBoardLists(String boardTitle) {
		
		List<EggplantDTO> lists = new ArrayList<EggplantDTO>();
		PreparedStatement pstmt = null;
		ResultSet rs =null;
		String sql;
		
		try {
			sql = "select board_title,board_subject,board_content1,board_content2,board_content3 from BOARD where board_title in ?";

			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, boardTitle);

			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				
				EggplantDTO dto = new EggplantDTO();
				
				dto.setTitle(rs.getString("board_title"));
				dto.setSubject(rs.getString("board_subject"));
				dto.setContent1(rs.getString("board_content1"));
				dto.setContent2(rs.getString("board_content2"));
				dto.setContent3(rs.getString("board_content3"));
				
				lists.add(dto);
				
			}
			rs.close();
			pstmt.close();
			
			
		} catch (Exception e) {
			System.out.println(e.toString() + "전체데이터");
		}
		
		return lists;
	}
	
	public List<EggplantDTO> getBoardContent(String subject) {
		
		List<EggplantDTO> lists = new ArrayList<EggplantDTO>();
		PreparedStatement pstmt = null;
		ResultSet rs =null;
		String sql;
		
		try {
			sql = "select board_title,board_subject,board_content1,board_content2,board_content3 from BOARD where board_subject in ?";

			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, subject);

			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				
				EggplantDTO dto = new EggplantDTO();
				
				dto.setTitle(rs.getString("board_title"));
				dto.setSubject(rs.getString("board_subject"));
				dto.setContent1(rs.getString("board_content1"));
				dto.setContent2(rs.getString("board_content2"));
				dto.setContent3(rs.getString("board_content3"));
				
				lists.add(dto);
				
			}
			rs.close();
			pstmt.close();
			
			
		} catch (Exception e) {
			System.out.println(e.toString() + "서브젝트");
		}
		
		return lists;
	}
	
	//로그인 및 회원가입 관련 메소드/////////////////////////////////////////
	public int insertData(EggplantDTO dto) {
		
		int result = 0;
		
		PreparedStatement pstmt = null;
		String sql;
		
		try {
			
			sql = "insert into GUEST (guest_userid,guest_userPassword,guest_userName,guest_userAddr, ";
			sql += "guest_userPhoneNum,guest_userEmail,guest_userBirth,guest_userDate) ";
			sql += "values (?,?,?,?,?,?,?,now())";
			
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, dto.getUserId());
			pstmt.setString(2, dto.getUserPassword());
			pstmt.setString(3, dto.getUserName());
			pstmt.setString(4, dto.getUserAddr());
			pstmt.setString(5, dto.getUserPhoneNum());
			pstmt.setString(6, dto.getUserEmail());
			pstmt.setString(7, dto.getUserBirth());
			
			result = pstmt.executeUpdate();
			
			pstmt.close();
			
			
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return result;
		
	}
	
	public int insertCreditData(EggplantDTO dto) {
		
		int result = 0;
		
		PreparedStatement pstmt = null;
		String sql;
		
		try {
			
			sql = "INSERT INTO CREDIT (credit_userid, credit_account, credit_password, credit_username) VALUES (?, ?, ?, ?)";
			
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, dto.getUserId());
			pstmt.setString(2, dto.getAccount());
			pstmt.setString(3, dto.getCreditPassword());
			pstmt.setString(4, dto.getUserName());
			
			
			result = pstmt.executeUpdate();
			
			pstmt.close();
			
			
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return result;
		
	} 
	
	
	public EggplantDTO getReadData(String userId) {
		
		EggplantDTO dto = null; 
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql;
		
		try {
			
			sql = "select guest_userId,guest_userPassword,guest_userName,guest_useraddr,guest_userphonenum,guest_useremail,guest_userbirth,guest_userdate from GUEST where guest_userId=?"; 
			
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, userId);
			
			rs = pstmt.executeQuery();

			if(rs.next()) {
				
				dto = new EggplantDTO();
				dto.setUserId(rs.getString("guest_userid"));
				dto.setUserPassword(rs.getString("guest_userpassword"));
				dto.setUserName(rs.getString("guest_username"));
				dto.setUserAddr(rs.getString("guest_useraddr"));
				dto.setUserPhoneNum(rs.getString("guest_userphonenum"));
				dto.setUserEmail(rs.getString("guest_useremail"));
				dto.setUserBirth(rs.getString("guest_userbirth"));
				dto.setUserDate(rs.getString("guest_userdate"));
			}
			rs.close();
			pstmt.close();
			
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return dto;
	}	
	
public EggplantDTO getReadDataCredit(String userId) {
		
		EggplantDTO dto = null; 
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql;
		
		try {
			
			sql = "select CREDIT_ACCOUNT,CREDIT_PASSWORD from CREDIT where credit_userid = ?"; 
			
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, userId);
			
			rs = pstmt.executeQuery();

			if(rs.next()) {
				
				dto = new EggplantDTO();
				dto.setAccount(rs.getString("credit_account"));
				dto.setCreditPassword(rs.getString("credit_password"));
				
			}
			rs.close();
			pstmt.close();
			
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return dto;
	}	
	/**
	 * 비밀번호 찾기
	 * @param userId
	 * @param userPhoneNum
	 * @return
	 */
	public EggplantDTO searchPw(String userId) {
		
		EggplantDTO dto = null; 
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql;
		
		try {
			
			sql = "select guest_userId,guest_userPassword,guest_userName,guest_userAddr,guest_userPhoneNum,";
			sql += "guest_userEmail,to_char(guest_userBirth,'YYYY-MM-DD') userBirth1,guest_userDate ";
			sql += "from GUEST where guest_userId= ?"; 
			
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, userId);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				
				dto = new EggplantDTO();
				
				dto.setUserId(rs.getString("userId"));
				dto.setUserPassword(rs.getString("userPassword"));
				dto.setUserName(rs.getString("userName"));
				dto.setUserAddr(rs.getString("userAddr"));
				dto.setUserPhoneNum(rs.getString("userPhoneNum"));
				dto.setUserEmail(rs.getString("userEmail"));
				dto.setUserBirth(rs.getString("userBirth1"));
				dto.setUserDate(rs.getString("userDate"));
			}
			rs.close();
			pstmt.close();
			
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return dto;
	}	
		
	public int updatedData(EggplantDTO dto) {
		
		int result = 0;
		
		PreparedStatement pstmt = null;
		String sql;
		
		try {
			
			sql = "update GUEST set guest_userPassword=?, guest_userAddr=?, ";
			sql += "guest_userPhoneNum=?, guest_userEmail=? where guest_userId=?";
			
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, dto.getUserPassword());
			pstmt.setString(2, dto.getUserAddr());
			pstmt.setString(3, dto.getUserPhoneNum());
			pstmt.setString(4, dto.getUserEmail());
			
			pstmt.setString(5, dto.getUserPassword());
			pstmt.setString(6, dto.getUserEmail());
			pstmt.setString(7, dto.getUserEmail());
			pstmt.setString(8, dto.getUserEmail());
					
			result = pstmt.executeUpdate();
			
			pstmt.close();			
		
		} catch (Exception e) {
			System.out.println(e.toString());
		}		
		return result;
	}
	
}
