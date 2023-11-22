package com.eggplant;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class ReservationDAO {

	private Connection conn = null;

	public ReservationDAO(Connection conn) {
		this.conn = conn;
	}

	// 공용 DB에 계좌가 있는지 확인
	public EggplantDTO getCheckDataBank(String name, String account) {

		PreparedStatement pstmt = null;
		ResultSet rs;
		String sql;
		EggplantDTO dto = null;

		try {

			sql = "SELECT BANK_NAME,BANK_ACCOUNT,BANK_USERNAME FROM BANK ";
			sql += "WHERE BANK_USERNAME = ? AND BANK_ACCOUNT = ?";

			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, name);
			pstmt.setString(2, account);

			rs = pstmt.executeQuery();

			rs.close();
			pstmt.close();
			
		} catch (Exception e) {
			System.out.println(e.toString() + " getCheckDataBank");
		}
		return dto;

	}
	
	// 입금 당한 사람 계좌 ++
	public int updateReservation(String account, String targetAccount ,int savings) throws SQLException {

		int result = 0;

		PreparedStatement pstmt = null;
		String sql;
		
		try {
		    // 트랜잭션 시작
		    conn.setAutoCommit(false);

		    // 첫 번째 계정에서 savings 만큼 감소
		    sql = "update CREDIT set credit_savings = credit_savings - ? where CREDIT_ACCOUNT = ?";
		    pstmt = conn.prepareStatement(sql);
		    pstmt.setInt(1, savings);
		    pstmt.setString(2, account);
		    result = pstmt.executeUpdate();
		    pstmt.close();

		    // 두 번째 계정에서 savings 만큼 증가
		    sql = "update CREDIT set credit_savings = credit_savings + ? where CREDIT_ACCOUNT = ?";
		    pstmt = conn.prepareStatement(sql);
		    pstmt.setInt(1, savings);
		    pstmt.setString(2, targetAccount);
		    result = pstmt.executeUpdate();
		    

		    // 트랜잭션 커밋
		    conn.commit();
		    conn.setAutoCommit(true);
		    pstmt.close();
		    System.out.println("updateReservationTarget실행완료");
		} catch (Exception e) {
		    // 트랜잭션 롤백
		    conn.rollback();
		    System.out.println(e.toString() + " updateReservationTarget");
		}
		return result;
	}

	
	
	
	
	//계좌 잔액 확인
	public int getReadAccountSavings(String account) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql;
		int savings = 0;
		
		try {
			sql = "select credit_savings from CREDIT where credit_account = ?";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, account);
			
			rs = pstmt.executeQuery();

			if (rs.next()) {
				savings = rs.getInt(1);
			}

			rs.close();
			pstmt.close();
			
		} catch (Exception e) {
			System.out.println(e.toString() + "getReadAccountSavings");
		}
		return savings;
		
	}
	
	// 계좌가 있는지 확인 
	public boolean getReadAccountData(String account) {

		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql;
		boolean result = false;
		
		try {
			sql = "select credit_account from CREDIT where credit_account = ?";

			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, account);

			rs = pstmt.executeQuery();
			if (rs.next()) {
				result = true;
			}
			
			rs.close();
			pstmt.close();
			
		} catch (Exception e) {
			System.out.println(e.toString() + "getReadAccountData");
		}
		return result;
	}
	
	public EggplantDTO getReadData(String account) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql;
		EggplantDTO dto = null;
		System.out.println("account : " + account);
		
		try {
			sql = "select CREDIT_USERID,CREDIT_ACCOUNT,CREDIT_SAVINGS from CREDIT where credit_account = ?";

			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, account);

			rs = pstmt.executeQuery();
			if (rs.next()) {
				dto = new EggplantDTO();
				dto.setUserId(rs.getString("credit_userid"));
				dto.setAccount(rs.getString("credit_account"));
				dto.setSavings(rs.getInt("credit_savings"));
			}
			
			rs.close();
			pstmt.close();
			
		} catch (Exception e) {
			System.out.println(e.toString() + "getReadAccountData");
		}
		return dto;
	}

	// pwd 확인
	public boolean getReadCheckPwd(String account, String pwd) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql;
		EggplantDTO dto = null;
		boolean result = false;
		
		try {
			sql = "select credit_password from CREDIT where credit_account = ? and CREDIT_PASSWORD = ?";

			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, account);
			pstmt.setString(2, pwd);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				String p = rs.getString(1);
				System.out.println("DAO p : " + p);
				if(p.equals(pwd)) {
					result = true;
				}
			}
			
			rs.close();
			pstmt.close();
			
		} catch (Exception e) {
			System.out.println(e.toString() + "getReadCheckPwd");
		}
		return result;
	}
	
	public int insertReservation(EggplantDTO target,int sendSavings, String senderName, String senderAccount) {

		int result = 0;

		PreparedStatement pstmt = null;
		String sql;
		
		try {
			//target_bankName,
			sql = "insert into RESERVATION(sendername,senderAccount,targetBank,";
			sql += "targetName,targetAccount,sendSavings,sendTime) ";
			sql += "values(?,?,?,?,?,?,str_to_date(?, '%Y%m%d%H%i%s'))";
			
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, senderName);
			pstmt.setString(2, senderAccount);
			pstmt.setString(3, target.getTargetBank());
			pstmt.setString(4, target.getTargetName());
			pstmt.setString(5, target.getTargetAccount());
			pstmt.setInt(6, sendSavings);
			pstmt.setString(7, target.getSendTime());
			
			result = pstmt.executeUpdate();
			
			pstmt.close();
			
		} catch (Exception e) {
			System.out.println(e.toString() + "insertReservation");
		}
		
		return result;
	}
	
	public List<EggplantDTO> getReservationLists(String time){
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql;
		EggplantDTO dto = null;
		List<EggplantDTO> lists = new ArrayList<EggplantDTO>();
//		System.out.println(time);
		
		try {

			sql = "select SENDERNAME,SENDERACCOUNT,TARGETBANK,TARGETNAME,TARGETACCOUNT,SENDSAVINGS,SENDTIME ";
			sql += "from RESERVATION where sendTime <= ?";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, time);
			rs = pstmt.executeQuery();
			
//			System.out.println("getReservationLists try 문");
			
			while (rs.next()) {
				dto = new EggplantDTO();
				
				dto.setUserName(rs.getString("SENDERNAME"));
				dto.setAccount(rs.getString("SENDERACCOUNT"));
				dto.setTargetBank(rs.getString("TARGETBANK"));
				dto.setTargetName(rs.getString("TARGETNAME"));
				dto.setTargetAccount(rs.getString("TARGETACCOUNT"));
				dto.setSendSaving(rs.getInt("SENDSAVINGS"));
				dto.setSendTime(rs.getString("SENDTIME"));
				
				System.out.println(dto.getUserName());
				System.out.println(dto.getAccount());
				System.out.println(dto.getTargetBank());
				System.out.println(dto.getTargetName());
				System.out.println(dto.getTargetAccount());
				System.out.println(dto.getSendSaving());
				System.out.println(dto.getSendTime());
				
				
				
				lists.add(dto);
			}
			

			rs.close();
			pstmt.close();
			
			
		} catch (Exception e) {
			System.out.println(e.toString() + "getReservationLists");
		}
		
		return lists;
	}
	
	public int deleteReservation(String account, String time) {
		
		int result = 0;

		System.out.println("deleteReservation들어옴");
		PreparedStatement pstmt = null;
		String sql;
		
		try {
			//target_bankName,
			sql = "delete RESERVATION where senderaccount = ? and sendtime <= str_to_date(?, '%Y%m%d%H%i%s')";
			
			pstmt = conn.prepareStatement(sql);
			System.out.println("deleteReservation트라이");
			System.out.println(account);
			System.out.println(time);
			pstmt.setString(1, account);
			pstmt.setString(2, time);
			System.out.println("deleteReservation스트링");
			
			result = pstmt.executeUpdate();
			
			pstmt.close();
			System.out.println("deleteReservation실행완료");
		} catch (Exception e) {
			System.out.println(e.toString() + "deleteReservation");
		}
		
		return result;
		
	}
	
	public int insertTransactions(String account, String targetName, String sendTime, int saving, int sendSaving) {
		int result = 0;

		PreparedStatement pstmt = null;
		String sql;
		
		try {
		
			sql = "insert into TRANSACTIONS";
			sql += "(TRANSACTIONS_ACCOUNT,TRANSACTIONS_INOUT,TRANSACTIONS_WHEREUSE,";
			sql += "TRANSACTIONS_DATE,TRANSACTIONS_AFTER,TRANSACTIONS_BEFORE) ";
			sql += "values(?,?,?,str_to_date(?, '%Y%m%d%H%i%s'),?,?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, account);
			pstmt.setInt(2, -(sendSaving));
			pstmt.setString(3, targetName);
			pstmt.setString(4, sendTime);
			pstmt.setInt(5, saving -(sendSaving));
			pstmt.setInt(6, saving);
			
			result = pstmt.executeUpdate();
			
			pstmt.close();
			
		} catch (Exception e) {
			System.out.println(e.toString() + "insertTransactions");
		}
		
		return result;
	}
	
	public int insertTransactionsTarget(String account, String targetName, String sendTime, int saving, int sendSaving) {
		int result = 0;

		PreparedStatement pstmt = null;
		String sql;
		
		try {
		
			sql = "insert into TRANSACTIONS";
			sql += "(TRANSACTIONS_ACCOUNT,TRANSACTIONS_INOUT,TRANSACTIONS_WHEREUSE,";
			sql += "TRANSACTIONS_DATE,TRANSACTIONS_AFTER,TRANSACTIONS_BEFORE) ";
			sql += "values(?,?,?,str_to_date(?, '%Y%m%d%H%i%s'),?,?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, account);
			pstmt.setInt(2, sendSaving);
			pstmt.setString(3, targetName);
			pstmt.setString(4, sendTime);
			pstmt.setInt(5, saving + sendSaving);
			pstmt.setInt(6, saving);
			
			result = pstmt.executeUpdate();
			
			pstmt.close();
			
		} catch (Exception e) {
			System.out.println(e.toString() + "insertTransactions");
		}
		
		return result;
	}
	
	public int insertTransactionsLoans(String account, String targetName, int saving, int sendSaving) {
		int result = 0;

		PreparedStatement pstmt = null;
		String sql;
		
		try {
		
			sql = "insert into TRANSACTIONS";
			sql += "(TRANSACTIONS_ACCOUNT,TRANSACTIONS_INOUT,TRANSACTIONS_WHEREUSE,";
			sql += "TRANSACTIONS_DATE,TRANSACTIONS_AFTER,TRANSACTIONS_BEFORE) ";
			sql += "values(?,?,?,now(),?,?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, account);
			pstmt.setInt(2, sendSaving);
			pstmt.setString(3, targetName);
			pstmt.setInt(4, saving + sendSaving);
			pstmt.setInt(5, saving);
			
			result = pstmt.executeUpdate();
			
			pstmt.close();
			
		} catch (Exception e) {
			System.out.println(e.toString() + "insertTransactions");
		}
		
		return result;
	}
}
