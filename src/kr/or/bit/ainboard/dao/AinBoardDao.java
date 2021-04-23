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

import com.oreilly.servlet.MultipartRequest;

import kr.or.bit.ainboard.dto.AinBoard;
import kr.or.bit.ainboard.dto.AinReply;

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
		
		String sql =  "select * from (select rownum rn, c_number, title, content, writedate, filename, refer, depth, step, viewcount, a.email, nickname, filerealname, filesize"
				+ "	from ( SELECT * FROM ain_board ORDER BY refer DESC , step ASC) a"
				+ " join member m on a.email = m.email"
				+ "	where rownum <= ?) where rn >= ?";
		
		int start = cpage * pagesize - (pagesize -1); //1 * 5 - (5 - 1) >> 1
		int end = cpage * pagesize; // 1 * 5 >> 5
		
		
		try(Connection conn = ds.getConnection();
			PreparedStatement pstmt = conn.prepareStatement(sql);) {
			
			pstmt.setInt(1, end);
			pstmt.setInt(2, start);

			ResultSet rs = pstmt.executeQuery();
			
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
				
				board.setNickname(rs.getString("nickname"));
				
				board.setFilerealname(rs.getString("filerealname"));
				board.setFilesize(rs.getInt("filesize"));
				
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
	
	//게시글 조회수 증가
	public boolean getReadNum(String cNumber) {
		boolean result = false;
		
		String sql = "update ain_board set viewcount = viewcount + 1 where c_Number=?";
		
		try(Connection conn = ds.getConnection();
			PreparedStatement pstmt = conn.prepareStatement(sql);) {
			
			pstmt.setString(1, cNumber);
			
			int row = pstmt.executeUpdate();
			if(row > 0) {
				result = true;
			}
			
		}catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}
	
	//게시글 상세보기
	public AinBoard getContent(int cNumber) {
		AinBoard board = null;
		//  "select c_number, title, content, writedate, filename, "
		//		+ "refer, depth, step, viewcount, email "
		//		+ "from ain_board where c_Number=?";
		
		
		String sql = "select c_number, title, content, writedate, filename, "
				+ "refer, depth, step, viewcount, a.email, nickname, filerealname, filesize "
				+ "from ain_board a join member m on a.email = m.email where c_Number=?";
		
			try(Connection conn = ds.getConnection();
			PreparedStatement pstmt = conn.prepareStatement(sql);) {
			
			pstmt.setInt(1, cNumber);
			
			ResultSet rs = pstmt.executeQuery();
			
			if(rs.next()) {
				String title = rs.getString("title");
				String content = rs.getString("content");
				java.sql.Date writedate = rs.getDate("writedate");
				String filename = rs.getString("filename");
				String email = rs.getString("email");
				int viewcount = rs.getInt("viewcount");
				
				String nickname = rs.getString("nickname");
				
				String filerealname = rs.getString("filerealname");
				int filesize = rs.getInt("filesize");
				
				//계층형
				int refer = rs.getInt("refer");
				int step = rs.getInt("step");
				int depth = rs.getInt("depth");
				
				board = new AinBoard(cNumber, title, content, writedate, filename, refer, depth, step, viewcount, email, nickname, filerealname, filesize);
			}
			
		}catch (Exception e) {
			System.out.println("오류 :" + e.getMessage());
		}
		
		return board;
	}
	
	//댓글 조회하기
	public List<AinReply> replylist(String cNumber_fk){
		List<AinReply> list = null;
		
		/*
		 * String sql = "select cr_number, content, writedate, email, c_number " +
		 * "from ain_reply_board where c_number=? order by cr_number desc";
		 */
		
		String sql = "select cr_number, content, writedate, a.email, c_number, nickname "
				+ "from ain_reply_board a join member m on a.email = m.email "
				+ "where c_Number=? order by cr_number desc";
		
		try(Connection conn = ds.getConnection();
			PreparedStatement pstmt = conn.prepareStatement(sql);) {
			
			pstmt.setString(1, cNumber_fk);
			
			ResultSet rs = pstmt.executeQuery();
			
			list = new ArrayList<AinReply>();
			
			while(rs.next()) {
				int crNumber = rs.getInt("cr_number");
				String email = rs.getString("email");
				String content = rs.getString("content");
				java.sql.Date writedate = rs.getDate("writedate");
				int cNumber = rs.getInt("c_number");
				
				String nickname = rs.getString("nickname");
				
				AinReply replydto = new AinReply(crNumber, content, writedate, email, cNumber, nickname);
				
				list.add(replydto);
			}
			
		}catch (Exception e) {
			e.printStackTrace();
		}
		
		System.out.println("댓글불러오는중list: "+list);
		
		return list;
	}
	
	//글쓰기-원본글
	public int writeok(AinBoard board) {
		int result = 0;
		String sql = "insert into ain_board(c_Number, title, filename, filesize, "
				+ "filerealname, content, writedate, refer, depth, step, email)"+ 
				   " values(ainsequence.NEXTVAL,?,?,?,?,?,sysdate,?,?,?,?)";
		
		try(Connection conn = ds.getConnection();
			PreparedStatement pstmt = conn.prepareStatement(sql);) {
				
				pstmt.setString(1, board.getTitle());
				pstmt.setString(2, board.getFilename());
				pstmt.setLong(3, board.getFilesize());
				pstmt.setString(4, board.getFilerealname());
				pstmt.setString(5, board.getContent());
				pstmt.setInt(6, board.getRefer());
				pstmt.setInt(7, board.getDepth());
				pstmt.setInt(8, board.getStep());
				pstmt.setString(9, board.getEmail());
				
				result = pstmt.executeUpdate();
				
			} catch (Exception e) {
				e.printStackTrace();
			}
		
		return result;
	}
	
	//새 글 등록 시 최대참조 수 조회하기 
	public int getMaxRefer() {
		
		String sql = " select nvl(max(refer), 0) as refer_max from ain_board ";
		
		int referMax = 0;
		try(Connection conn = ds.getConnection();
			PreparedStatement pstmt = conn.prepareStatement(sql);
			ResultSet rs = pstmt.executeQuery();) {
			
			if(rs.next()) {
				referMax = rs.getInt("refer_max");
				
			}
			
		}catch (Exception e) {
			e.printStackTrace();
		}
		
		return referMax;
	}
	
	//게시글 수정하기
	public AinBoard getEditContent(String cNumber) {
		return this.getContent(Integer.parseInt(cNumber));
	}
	
	//게시글 수정 처리
	public int boardEdit(MultipartRequest boarddata) {
		int row = 0;
		
		String cNumber= boarddata.getParameter("cNumber");
		String title= boarddata.getParameter("title");
		String content= boarddata.getParameter("content");
		String writedate= boarddata.getParameter("writedate");
		String filename= boarddata.getParameter("filename");
		String viewcount= boarddata.getParameter("viewcount");
		String email= boarddata.getParameter("email");
		
		String nickname= boarddata.getParameter("nickname");
		String filerealname= boarddata.getParameter("filerealname");
		String filesize= boarddata.getParameter("filesize");
		
		String refer= boarddata.getParameter("refer");
		String step= boarddata.getParameter("step");
		String depth= boarddata.getParameter("depth");
		
		String sql_cnumber = "select c_number from ain_board where c_number=?";
		String sql_udpate = "update ain_board set title=? , content=? where c_number=?";
		
		try(Connection conn = ds.getConnection();
			PreparedStatement selectpstmt = conn.prepareStatement(sql_cnumber);
			PreparedStatement updatepstmt = conn.prepareStatement(sql_udpate);) {
				
			selectpstmt.setString(1, cNumber);
			
			ResultSet rs = selectpstmt.executeQuery();
			
			//데이터가 없다면 수정 불가능
			if(rs.next()) {
				updatepstmt.setString(1, title);
				updatepstmt.setString(2, content);
				updatepstmt.setString(3, cNumber);
				
				row = updatepstmt.executeUpdate();
			}
				
			}catch (Exception e) {
				e.printStackTrace();
			}
		
		
		return row;
	}
}
