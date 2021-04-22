package kr.or.bit.member.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.servlet.http.HttpSession;
import javax.sql.DataSource;
import kr.or.bit.member.dto.MemberDto;



public class MemberDao {
	
	DataSource ds = null;
	
	
	public MemberDao() {
		try {
			Context context = new InitialContext();
			ds = (DataSource) context.lookup("java:comp/env/jdbc/oracle");				
		
		} catch (Exception e) {
			System.out.println("DB 연결 실패 : " + e.getMessage());
			return;
		}
	}
	
	//회원가입
	public int RegisterMember(MemberDto memberDto) {
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		int result = 0;
		
		try {
			conn = ds.getConnection();
			String sql = "insert into member values(?,?,?,?)";
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, memberDto.getEmail());
			pstmt.setString(2, memberDto.getPassword());
			pstmt.setString(3, "1");
			pstmt.setString(4, memberDto.getNickname());
			
			result = pstmt.executeUpdate();
			
		} catch (Exception e) {
			System.out.println("RegisterMember 에러(memberDao 52번째줄) : " + e.getMessage());
		
		}finally {
			if(pstmt!=null) try{pstmt.close();}catch(Exception e){}
			if(conn!=null) try{conn.close();}catch(Exception e){}
		}
		return result;
	}
	
	//로그인
	public MemberDto loginMember(MemberDto memberDto) {
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		MemberDto user = null;
		
		
		try {
			conn = ds.getConnection();
			String sql = "select email, password, division, nickname from member where email=?";

			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, memberDto.getEmail());
			rs = pstmt.executeQuery();
			
			
			if(rs.next()) {
				if (rs.getString("password").equals(memberDto.getPassword())) {
					user = new MemberDto();
					//일치
					user.setEmail(rs.getString("email"));
					user.setDivision(rs.getString("division"));
					user.setNickname(rs.getString("nickname"));
					
				} else {
					//불일치
				}
			}
		} catch (Exception e) {
			System.out.println("로그인 에러 : " + e.getMessage());
		} finally {
			
			 
			try {
				rs.close();
				pstmt.close();
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return user;  
	}
	
	//로그인 완료 후 처리
	public boolean loginOkMember(String email , String pwd) {
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		boolean result = false;
		ResultSet rs = null;
		try {
			conn = ds.getConnection();
			String sql = "select password from member where email = ? ";
			
			pstmt.setString(1, email);
			pstmt = conn.prepareStatement(sql);
			
			rs = pstmt.executeQuery();
			if(rs.next()) {
				if(rs.getString("password").equals(pwd)) {
					result = true;
				} else {
					result = false;
				}
			}
		} catch(Exception e) {
			e.getMessage();
		} finally {
			try {
				rs.close();
				pstmt.close();
				conn.close();
			} catch(Exception e2) {
				
			}
		}
		return result;
		
	}
	
	//개인정보수정
	public boolean editInfo(MemberDto memberdto){
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		boolean result = false;
		
		try {
			conn = ds.getConnection();
			String sql = "select email,password,nickname from member where email=?";
			//String sql = "UPDATE member SET nickname=?, password=?, where email=?";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, memberdto.getEmail());

			pstmt.executeQuery();
			
			System.out.println("memberDao 156번째줄");
			
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("개인정보수정 에러(memberDao 159번째줄) : " + e.getMessage());
		} finally {
			try {
				pstmt.close();
				conn.close(); 
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return result;
		
	}
	
	public boolean editInfoOk(MemberDto memberdto){
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		int result = 0;
		
		try {
			conn = ds.getConnection();
			//String sql = "select email,password,nickname from member where email=?";
			String sql = "UPDATE member SET nickname=?, password=?, where email=?";
			
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, memberdto.getNickname());
			pstmt.setString(2, memberdto.getPassword());
			pstmt.setString(3, memberdto.getEmail());

			result = pstmt.executeUpdate();
			
			System.out.println("memberDao 192번째줄");
			
			if(result > 0){
				
			}
			
			
			
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("개인정보수정 에러(memberDao 159번째줄) : " + e.getMessage());
		} finally {
			try {
				pstmt.close();
				conn.close(); 
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return false;
	
	}
}