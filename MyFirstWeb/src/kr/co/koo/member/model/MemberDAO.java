package kr.co.koo.member.model;

import java.sql.*;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import kr.co.koo.util.JdbcUtil;

public class MemberDAO {
	
	/*
	 * DAO객체는 메모리 영역에 1개만 존재하는 것이
	 * 메모리 관리상 유리하기 때문에 싱글톤 패턴을 적용하여
	 * 클래스를 디자인해서 객체가 단 1개만 생성되도록 제한합니다.
	 */
	private static MemberDAO dao = new MemberDAO();
	private DataSource ds;
	private Context ct;
	
	//회원관리에 필요한 상수들 선언.
	public static final int JOIN_SUCCESS = 1;
	public static final int JOIN_FAIL = 0;
	
	public static final int MEMBER_EXISTENT = 1;
	public static final int MEMBER_NONEXISTENT = 0;
	
	public static final int LOGIN_SUCCESS = 1;
	public static final int LOGIN_FAIL_PW = 0;
	public static final int LOGIN_FAIL_ID = -1;
	
	public static final int UPDATE_SUCCESS = 1;
	public static final int UPDATE_FAIL = 0;
	
	public static final int DELETE_SUCCESS = 1;
	public static final int DELETE_FAIL = 0;
	
	private MemberDAO() {
		try {
			ct = new InitialContext();
			ds = (DataSource)ct.lookup("java:comp/env/jdbc/mysql");			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public static MemberDAO getInstance() {
		if(dao!=null) {
			dao = new MemberDAO();
		}
		return dao;
	}
	
	
	//회원가입 요청을 DB처리하는 메서드 선언.
	public int insertMember(MemberVO member) {
		
		int rn = JOIN_FAIL;
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		String sql = "insert into members (user_id, user_pw, user_name, user_email, user_address) values (?,?,?,?,?)";
		
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, member.getId());
			pstmt.setString(2, member.getPw());
			pstmt.setString(3, member.getName());
			pstmt.setString(4, member.getEmail());
			pstmt.setString(5, member.getAddress());
			
			int i = pstmt.executeUpdate();
			
			if(i == 1) {
				rn = JOIN_SUCCESS;
			}else {
				rn = JOIN_FAIL;
			}			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JdbcUtil.close(conn);
			JdbcUtil.close(pstmt);
		}
		
		return rn;
	}
	
	//이미 가입된 회원인지의 여부를 검증하는 메서드
	public int confirmId(String id) {
		int rn = 0;
		
		String sql = "select user_id from members where user_id=?";
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				rn = MEMBER_EXISTENT;
			}else {
				rn = MEMBER_NONEXISTENT;
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JdbcUtil.close(conn);
			JdbcUtil.close(pstmt);
			JdbcUtil.close(rs);
		}
		
		return rn;
	}
	
	//로그인의 유효성을 검증하는 메서드 선언.
	public int userCheck(String id, String pw) {
		int rn = 0;
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
				
		String sql = "select user_pw from members where user_id=?";
		
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				String dbPw = rs.getString("user_pw");
				if(pw.equals(dbPw)) {
					rn = LOGIN_SUCCESS;
				}else {
					rn = LOGIN_FAIL_PW;
				}
			}else {
				rn = LOGIN_FAIL_ID;
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JdbcUtil.close(conn);
			JdbcUtil.close(pstmt);
			JdbcUtil.close(rs);
		}
		return rn;
	}
	
	//로그인한 회원의 정보를 DB로부터 가져오는 메서드 선언.
	public MemberVO getMemberInfo(String id) {
		
		String sql = "select * from members where user_id=?";
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		MemberVO vo = null;
		
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				String userId = rs.getString("user_id");
				String pw = rs.getString("user_pw");
				String name = rs.getString("user_name");
				String email = rs.getString("user_email");
				String address = rs.getString("user_address");
				Timestamp rDate = rs.getTimestamp("user_reg_date");
				
				vo = new MemberVO(userId, pw, name, email, rDate, address);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JdbcUtil.close(conn);
			JdbcUtil.close(pstmt);
			JdbcUtil.close(rs);
		}
		
		return vo;
	}
	
	//비밀번호 변경 메서드
	public int changePassword(String pw, String id) {
		
		int rn = 0;
		
		String sql = "update members set user_pw=? where user_id=?";
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, pw);
			pstmt.setString(2, id);
			
			int i = pstmt.executeUpdate();
			
			if(i == 1) {
				rn = UPDATE_SUCCESS;
			} else {
				rn = UPDATE_FAIL;
			}			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JdbcUtil.close(conn);
			JdbcUtil.close(pstmt);
		}
		
		return rn;
	}
	
	//회원정보 수정을 처리하는 메서드
	public int updateUser(MemberVO member) {
		int rn = 0;
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		String sql = "update members set user_name=?, user_email=?, user_address=? where user_id=?";
		
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, member.getName());
			pstmt.setString(2, member.getEmail());
			pstmt.setString(3, member.getAddress());
			pstmt.setString(4, member.getId());
			
			int i = pstmt.executeUpdate();
			
			if(i == 1) {
				rn = UPDATE_SUCCESS;
			}else {
				rn = UPDATE_FAIL;
			}			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JdbcUtil.close(conn);
			JdbcUtil.close(pstmt);
		}
		
		return rn;
	}
	
	//회원탈퇴를 처리하는 메서드 선언.
	public int deleteUser(String id) {
		
		int rn = 0;
		
		String sql = "delete from members where user_id=?";
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			
			int i = pstmt.executeUpdate();
			
			if(i == 1) {
				rn = DELETE_SUCCESS;
			} else {
				rn = DELETE_FAIL;
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JdbcUtil.close(conn);
			JdbcUtil.close(pstmt);
		}
		
		return rn;
	}
	
	//전체 회원정보를 조회하는 메서드
	public ArrayList<MemberVO> membersAll() {
		
		String sql = "SELECT * FROM MEMBERS";
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		ArrayList<MemberVO> userList = new ArrayList<>();
		
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				String id = rs.getString("user_id");
				String pw = rs.getString("user_pw");
				String name = rs.getString("user_name");
				String email = rs.getString("user_email");
				Timestamp rDate = rs.getTimestamp("user_reg_date");
				String address = rs.getString("user_address");
				
				MemberVO member = new MemberVO(id, pw, name, email, rDate, address);
				
				userList.add(member);
				
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JdbcUtil.close(conn);
			JdbcUtil.close(pstmt);
			JdbcUtil.close(rs);
		}
		
		return userList;
		
	}
	
}//end class








