package kr.or.bit.ainboard.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import kr.or.bit.ainboard.dto.AinBoard;

public class AinBoardDao {
	DataSource ds = null;
	
	public AinBoardDao(){
		try {
			Context context = new InitialContext();
			ds = (DataSource)context.lookup("java:comp/env/jdbc/oracle");
		} catch (NamingException e) {
			e.printStackTrace();
		}
	}
	
	//게시물 총 건수 구하기
	public int totalBoardCount() {
		
		int totalcount = 0;
		
		String sql="select count(*) cnt from ain_board";
		
		try (Connection conn = ds.getConnection();
			 PreparedStatement selectpstmt = conn.prepareStatement(sql);){
			ResultSet rs = selectpstmt.executeQuery();
			
			if(rs.next()) {
				totalcount = rs.getInt("cnt");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return totalcount;
	}
	
	//게시물 목록보기
	public List<AinBoard> list(int cpage, int pagesize) {
		List<AinBoard> list = null;
		
		String sql =  "select * from (select rownum rn, c_number, title, "
				+ "content, writedate, filename, refer, depth, step, viewcount, email "
				+ "from ( SELECT * FROM ain_board ORDER BY refer DESC , step ASC) "
				+ "where rownum <= ?) where rn >= ?";
		
		
		try(Connection conn = ds.getConnection();
			PreparedStatement pstmt = conn.prepareStatement(sql);) {
			
			ResultSet rs = pstmt.executeQuery();
			
			int start = cpage * pagesize - (pagesize -1); //1 * 5 - (5 - 1) >> 1
			int end = cpage * pagesize; // 1 * 5 >> 5

			pstmt.setInt(1, end);
			pstmt.setInt(2, start);
			
			list = new ArrayList<AinBoard>();
			while(rs.next()) {
				AinBoard board = new AinBoard();
				board.setcNumber(rs.getInt("c_number"));
				board.setTitle(rs.getString("title"));
				board.setContent(rs.getString("content"));
				board.setWritedate(rs.getDate("writedate"));
				board.setFilename(rs.getString("filename"));
				board.setViewcount(rs.getInt("viewcount"));
				board.setEmail(rs.getString("email"));
				
				board.setRefer(rs.getInt("refer"));
				board.setStep(rs.getInt("step"));
				board.setDepth(rs.getInt("depth"));
				
				list.add(board);
			}
			
		} catch (Exception e) {
			System.out.println("오류 :" + e.getMessage());
		}
		
		return list;
	}
}
