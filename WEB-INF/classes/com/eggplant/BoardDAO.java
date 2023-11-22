package com.eggplant;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class BoardDAO {
	
	private Connection conn = null;
	
	public BoardDAO(Connection conn) {
		this.conn = conn;
	}
	
	//searchValue 데이터 갯수
	public int getValueCount(String searchValue) {
			
			int totalDataCount = 0;
			
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			String sql;
			
			try {
				
				searchValue = "%" + searchValue + "%";
				
				sql = "select ifnull(count(*),0) from BOARD ";
				sql += "where board_subject like ?";
				
				pstmt = conn.prepareStatement(sql);
				
				pstmt.setString(1, searchValue);
				
				rs = pstmt.executeQuery();
				
				if(rs.next()) {
					
					totalDataCount = rs.getInt(1);
					
				}
				
				rs.close();
				pstmt.close();
				
				
			} catch (Exception e) {
				System.out.println(e.toString() + "searchValue 갯수");
			}
			
			return totalDataCount;
			
		}
	
	//searchKey 데이터 갯수
	public int getKeyCount(String searchKey) {
			
			int totalDataCount = 0;
			
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			String sql;
			
			try {
				
				sql = "select ifnull(count(*),0) from board ";
				sql += "where board_title like ?";
				
				pstmt = conn.prepareStatement(sql);
				
				pstmt.setString(1, searchKey);
				
				rs = pstmt.executeQuery();
				
				if(rs.next()) {
					
					totalDataCount = rs.getInt(1);
					
				}
				
				rs.close();
				pstmt.close();
				
				
			} catch (Exception e) {
				System.out.println(e.toString() + "searchKey 갯수");
			}
			
			return totalDataCount;
			
		}
	
	
	//searchValue로 검색한 데이터 출력
	public List<EggplantDTO> getSearchValueLists(int start, int end,String searchValue){
		
		List<EggplantDTO> lists = new ArrayList<EggplantDTO>();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql;
		
		try {
			
			searchValue = "%" + searchValue + "%";
			
			sql = "select bo.* from ";
			sql += "(select @rownum:=@rownum+1 rownum, ";
			sql += "BOARD_TITLE,BOARD_SUBJECT,BOARD_CONTENT1,BOARD_CONTENT2,BOARD_CONTENT3 from BOARD ";
			sql += "(select @rownum:=0) rownum where board_subject like ?) bo ";
			sql += "where rownum >= ? and rownum <= ?";
			
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, searchValue);
			pstmt.setInt(2, start);
			pstmt.setInt(3, end);
			
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
			System.out.println(e.toString() + "searchValue get List");
		}
		return lists;
	}
	
	// searchKey로 검색한 데이터 출력
	public List<EggplantDTO> getSearchKeyLists(int start, int end, String searchKey){
			
			List<EggplantDTO> lists = new ArrayList<EggplantDTO>();
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			String sql;
			
			try {
		
				
				sql = "select bo.* from ";
				sql += "(select @rownum:=@rownum+1 rownum, ";
				sql += "board_title,BOARD_SUBJECT,BOARD_CONTENT1,BOARD_CONTENT2,BOARD_CONTENT3 from BOARD, ";
				sql += "(select @rownum:=0) rownum where board_title like ?) bo ";
				sql += "where rownum >= ? and rownum <= ?";
				
				pstmt = conn.prepareStatement(sql);
				
				pstmt.setString(1, searchKey);
				pstmt.setInt(2, start);
				pstmt.setInt(3, end);
				
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
				System.out.println(e.toString() + "searchKey get List");
			}
			return lists;
		}
	
	public int getDataCount(String searchKey, String searchValue) {
		
		int totalDataCount = 0;
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql;
		
		try {
	        // 검색 조건이 없는 경우 전체 데이터의 갯수를 가져오도록 처리
	        if (searchKey == null || searchValue == null) {
	            sql = "select ifnull(count(*),0) from BOARD";
	            pstmt = conn.prepareStatement(sql);
	        } else {
	            searchValue = "%" + searchValue + "%";
	            sql = "select ifnull(count(*),0) from BOARD where " + searchKey + " like ?";
	            pstmt = conn.prepareStatement(sql);
	            pstmt.setString(1, searchValue);
	        }

	        rs = pstmt.executeQuery();

	        if (rs.next()) {
	            totalDataCount = rs.getInt(1);
	        }

	        rs.close();
	        pstmt.close();

	    } catch (Exception e) {
	        System.out.println(e.toString());
	    }

	    return totalDataCount;
	}

	public List<EggplantDTO> getLists(int start, int end,
						String searchKey, String searchValue) {
    
		List<EggplantDTO> lists = new ArrayList<EggplantDTO>();
	    PreparedStatement pstmt = null;
	    ResultSet rs = null;
	    String sql;
	    
	    
	
	    try {
	        searchValue = "%" + searchValue + "%";
	
	        sql = "select bo.* from";
	        sql += "(select @rownum:=@rownum+1 rownum, ";
	        sql += "board_title,BOARD_SUBJECT,BOARD_CONTENT1,BOARD_CONTENT2,BOARD_CONTENT3 ";
	        sql += "from BOARD, (select @rownum:=0) rownum where " + searchKey + " like ? order by BOARD_TITLE) bo ";
	        sql += "where rownum >= ? and rownum <= ?";
	
	        pstmt = conn.prepareStatement(sql);
	        

	        pstmt.setString(1, searchValue);
	        pstmt.setInt(2, start);
	        pstmt.setInt(3, end);
	
	        rs = pstmt.executeQuery();
	
	        while (rs.next()) {
	            EggplantDTO dto = new EggplantDTO();
	            dto.setTitle(rs.getString("BOARD_TITLE"));
	            dto.setSubject(rs.getString("BOARD_SUBJECT"));
	            dto.setContent1(rs.getString("BOARD_CONTENT1"));
	            dto.setContent2(rs.getString("BOARD_CONTENT2"));
	            dto.setContent3(rs.getString("BOARD_CONTENT3"));
	            
	            lists.add(dto);
	        
	        }
	
	        rs.close();
	        pstmt.close();
	
	    } catch (Exception e) {
	        System.out.println(e.toString());
	    }
	
	    return lists;
	}
	
	
	

	
}
