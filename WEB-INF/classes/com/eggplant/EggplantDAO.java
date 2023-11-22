package com.eggplant;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.util.DBConn;

public class EggplantDAO {

	private Connection conn = null;

	public EggplantDAO(Connection conn) {
		this.conn = conn;
	}

	// 계좌 조회
	public List<EggplantDTO> accountCheck(String userId) {

		List<EggplantDTO> lists = new ArrayList<EggplantDTO>();
		Connection conn = DBConn.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql;

		try {

			sql = "select credit_account, credit_savings,credit_loans from CREDIT where credit_userId=?";

			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, userId);

			rs = pstmt.executeQuery();

			while (rs.next()) {

				EggplantDTO dto = new EggplantDTO();

				dto.setAccount(rs.getString("credit_account"));
				dto.setSavings(rs.getInt("credit_savings"));
				dto.setLoans(rs.getInt("credit_loans"));
				lists.add(dto);

			}

			rs.close();
			pstmt.close();

		} catch (Exception e) {
			System.out.println(e.toString() + "accountCheck");
		}

		return lists;

	}
	
	public List<EggplantDTO> getLists(String account, String search) {
		
		List<EggplantDTO> lists = new ArrayList<EggplantDTO>();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql;
		System.out.println("여기는 4번");

		try {
			
//			//거래 후 잔액도 조회해야됨
			
			search = "%" + search + "%"; 
			
			sql = "select transactions_account,transactions_whereuse,transactions_date,";
			sql += "transactions_inout,TRANSACTIONS_AFTER from TRANSACTIONS ";
			sql += "where transactions_account = ? ";
			sql += "and TRANSACTIONS_WHEREUSE like ? order by transactions_date desc";
			
			pstmt = conn.prepareStatement(sql);
			System.out.println("여기는 5번");
			System.out.println(account + "getList 계좌");
			System.out.println(search + "서치");
			pstmt.setString(1, account);
			pstmt.setString(2, search);
			System.out.println("여기는 6번");

			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				System.out.println("여기는 7번");

				EggplantDTO dto = new EggplantDTO();
				
				dto.setAccount(rs.getString("transactions_account"));
				dto.setWhereuse(rs.getString("transactions_whereuse"));
				dto.setTransactionsDate(rs.getString("transactions_date"));
				dto.setInout(rs.getInt("transactions_inout"));
				dto.setTransactionsBefore(rs.getString("TRANSACTIONS_AFTER"));
				//after 추가
				
				lists.add(dto);
				
			}
			System.out.println("여기는 8번");

			rs.close();
			pstmt.close();
			
		} catch (Exception e) {
			System.out.println(e.toString() + "getLists");
		}
		
		return lists;
		
	}
	
	
	public List<EggplantDTO> getLists(String sdt, String edt, String account, String search) {
		
		List<EggplantDTO> lists = new ArrayList<EggplantDTO>();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql;
		System.out.println("여기는 4번");
		try {
			
//			//거래 후 잔액도 조회해야됨
			
			search = "%" + search + "%"; 
			
			sql = "select transactions_account,transactions_whereuse,transactions_date,transactions_inout,TRANSACTIONS_AFTER ";
			sql+= "from TRANSACTIONS where transactions_account = ? ";
			sql+= "and TRANSACTIONS_WHEREUSE like ? ";
			sql+= "AND TRANSACTIONS_DATE BETWEEN ? AND ? order by transactions_date desc";
			
			pstmt = conn.prepareStatement(sql);
			System.out.println("여기는 5번");
			System.out.println(account + "getList 계좌");
			System.out.println(search + "서치");
			System.out.println(sdt + "시작 날짜");
			System.out.println(edt + "마지막 날짜");
			
			pstmt.setString(1, account);
			pstmt.setString(2, search);
			pstmt.setString(3, sdt);
			pstmt.setString(4, edt);
			System.out.println("여기는 6번");
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				
				EggplantDTO dto = new EggplantDTO();
				System.out.println("여기는 7번");
				dto.setAccount(rs.getString("transactions_account"));
				dto.setWhereuse(rs.getString("transactions_whereuse"));
				dto.setTransactionsDate(rs.getString("transactions_date"));
				dto.setInout(rs.getInt("transactions_inout"));
				//after 추가
				dto.setTransactionsBefore(rs.getString("TRANSACTIONS_AFTER"));
				lists.add(dto);
				
			}
			System.out.println("여기는 8번");
			rs.close();
			pstmt.close();
			
		} catch (Exception e) {
			System.out.println(e.toString() + "getLists 2");
		}
		
		return lists;
		
	}
	
	// 거래 내역
	public List<EggplantDTO> transactionHistory(String account, String search) {

		List<EggplantDTO> lists2 = new ArrayList<EggplantDTO>();
		Connection conn = DBConn.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql;

		try {

			sql = "select a.transactions_account, transactions_inout, transactions_whereuse,";
			sql += "transactions_date, b.credit_savings from TRANSACTIONS a join CREDIT b ";
			sql += "on a.transactions_account=b.credit_account where a.transactions_account=?";
			sql += " and transactions_whereuse like concat('%',?,'%')";

			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, account);
			pstmt.setString(2, search);

			rs = pstmt.executeQuery();

			while (rs.next()) {

				EggplantDTO dto = new EggplantDTO();

				dto.setAccount(rs.getString("transactions_account"));
				dto.setInout(rs.getInt("transactions_inout"));
				dto.setWhereuse(rs.getString("transactions_whereuse"));
				dto.setTransactionsDate(rs.getString("transactions_date"));
				dto.setSavings(rs.getInt("credit_savings"));

				lists2.add(dto);

			}

			rs.close();
			pstmt.close();

		} catch (Exception e) {
			System.out.println(e.toString() + "transactionHistory");
		}

		return lists2;

	}

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
			System.out.println(e.toString() + "insertData");
		}
		return result;

	}

	public int insertCreditData(EggplantDTO dto) {

		int result = 0;

		PreparedStatement pstmt = null;
		String sql;

		try {

			sql = "INSERT INTO CREDIT (credit_userid, credit_account, credit_password,credit_userName) VALUES (?, ?, ?,?)";

			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, dto.getUserId());
			pstmt.setString(2, dto.getAccount());
			pstmt.setString(3, dto.getCreditPassword());
			pstmt.setString(4, dto.getUserName());

			result = pstmt.executeUpdate();

			pstmt.close();

		} catch (Exception e) {
			System.out.println(e.toString() + "insertCreditData");
		}
		return result;

	}

	public EggplantDTO getLoginData(String userId) {

		EggplantDTO dto = null;

		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql;

		try {

			sql = "select guest_userId,guest_userPassword,guest_userName ";
			sql += "from GUEST where guest_userId=?";

			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, userId);

			rs = pstmt.executeQuery();

			if (rs.next()) {

				dto = new EggplantDTO();

				dto.setUserId(rs.getString("guest_userId"));
				dto.setUserPassword(rs.getString("guest_userPassword"));
				dto.setUserName(rs.getString("guest_userName"));

			}
			rs.close();
			pstmt.close();

		} catch (Exception e) {
			System.out.println(e.toString() + "getLoginData");
		}
		return dto;
	}

	public EggplantDTO getReadData(String userId) {

		EggplantDTO dto = null;

		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql;

		try {

			sql = "select guest_userId,guest_userPassword,guest_userName,guest_userAddr,guest_userPhoneNum,";
			sql += "guest_userEmail,GUEST_USERBIRTH,guest_userDate ";
			sql += "from GUEST where guest_userId=?";
			
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, userId);

			rs = pstmt.executeQuery();

			if (rs.next()) {

				dto = new EggplantDTO();

				dto.setUserId(rs.getString("guest_userId"));
				dto.setUserPassword(rs.getString("guest_userPassword"));
				dto.setUserName(rs.getString("guest_userName"));
				dto.setUserAddr(rs.getString("guest_userAddr"));
				dto.setUserPhoneNum(rs.getString("guest_userPhoneNum"));
				dto.setUserEmail(rs.getString("guest_userEmail"));
				dto.setUserBirth(rs.getString("GUEST_USERBIRTH"));
				dto.setUserDate(rs.getString("guest_userDate"));
			}
			rs.close();
			pstmt.close();

		} catch (Exception e) {
			System.out.println(e.toString() + "getReadData");
		}
		return dto;
	}

	public int updatedData(EggplantDTO dto) {

		int result = 0;

		PreparedStatement pstmt = null;
		String sql;

		try {

			sql = "update GUEST set guest_userPassword=?, guest_userBirth=?, guest_userPhoneNum=? ";
			sql += "where guest_userId=?";

			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, dto.getUserPassword());
			pstmt.setString(2, dto.getUserBirth());
			pstmt.setString(3, dto.getUserPhoneNum());
			pstmt.setString(4, dto.getUserId());

			result = pstmt.executeUpdate();

			pstmt.close();

		} catch (Exception e) {
			System.out.println(e.toString() + "updatedData");
		}
		return result;
	}

	public int creditInsertData(EggplantDTO dto) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql;

		try {

			if (dto.getProperty() >= 10000000) {
				dto.setGrade("1등급");
			} else if (dto.getProperty() >= 9000000) {
				dto.setGrade("2등급");
			} else if (dto.getProperty() >= 8000000) {
				dto.setGrade("3등급");
			} else if (dto.getProperty() >= 7000000) {
				dto.setGrade("4등급");
			} else if (dto.getProperty() >= 6000000) {
				dto.setGrade("5등급");
			} else if (dto.getProperty() >= 5000000) {
				dto.setGrade("6등급");
			} else if (dto.getProperty() >= 4000000) {
				dto.setGrade("7등급");
			} else if (dto.getProperty() >= 3000000) {
				dto.setGrade("8등급");
			} else if (dto.getProperty() >= 2000000) {
				dto.setGrade("9등급");
			} else if (dto.getProperty() >= 1000000) {
				dto.setGrade("10등급");
			} else {
				dto.setGrade("신용불량");
			}

			System.out.println(dto.getProperty() + "creditInsertData");
			System.out.println(dto.getLoans() + "creditInsertData");
			System.out.println(dto.getGrade() + "creditInsertData");
			System.out.println(dto.getUserId() + "creditInsertData");

			if (dto.getProperty() >= 100000000) {
				sql = "update CREDIT set credit_property=?, credit_loans=?, credit_grade=? WHERE credit_userId = ?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, dto.getProperty());
				pstmt.setInt(2, dto.getLoans());
				pstmt.setString(3, dto.getGrade());
				pstmt.setString(4, dto.getUserId());
				result = pstmt.executeUpdate();
			}

		} catch (Exception e) {
			System.out.println(e.toString() + "creditInsertData");
		} finally {
			try {
				if (pstmt != null) {
					pstmt.close();
				}
			} catch (Exception e) {
				e.printStackTrace();
			}

		}

		return result;
	}

	public int LoanUpData(int loannum, String account) {

		int result = 0;

		PreparedStatement pstmt = null;

		String sql;

		try {
			sql = "update CREDIT set credit_loans = credit_loans + ?, credit_savings =  credit_savings + ? ";
			sql += "where credit_account = ?";
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, loannum);
			pstmt.setInt(2, loannum);
			pstmt.setString(3, account);
			result = pstmt.executeUpdate();

			pstmt.close();

		} catch (Exception e) {
			System.out.println(e.toString() + "LoanUpData");
		}

		return result;
	}

	public int LoanGetReadData(String account) {

		int loans = 0;

		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql;

		try {

			sql = "select credit_loans from CREDIT where credit_account=?";
			
			pstmt = conn.prepareStatement(sql);
			System.out.println(account + "loans1");
			pstmt.setString(1, account);
			
			rs = pstmt.executeQuery();

			if (rs.next()) {
				System.out.println(rs.getInt("credit_loans") + "loans2");
				loans = rs.getInt("credit_loans");

			}

			rs.close();
			pstmt.close();

		} catch (Exception e) {
			System.out.println(e.toString() + "LoanGetReadData");
		}
		return loans;
	}
	public int getReadSavings(String account) {

		int savings = 0;

		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql;

		try {

			sql = "select credit_savings from CREDIT where credit_account=?";

			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, account);

			rs = pstmt.executeQuery();

			if (rs.next()) {

				savings = rs.getInt("credit_savings");

			}

			rs.close();
			pstmt.close();

		} catch (Exception e) {
			System.out.println(e.toString() + "getReadSavings");
		}
		return savings;
	}
	
	public void updatePoints(String userId, int points) {
		
		int result = 0;
		PreparedStatement pstmt = null;
		Connection conn = DBConn.getConnection();
		
		String sql = null;
		
		try {
			
			sql = "update GUEST set guest_points = ";
			sql+= "ifnull(guest_points, 0) + ? where guest_userId = ?";
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, points);
			pstmt.setString(2, userId);
			
			result = pstmt.executeUpdate();
	
			pstmt.close();
			
		} catch (Exception e) {
			System.out.println(e.toString() + "updatePoints");
		}
		
	}
	
	
}
