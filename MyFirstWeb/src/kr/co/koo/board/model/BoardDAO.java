package kr.co.koo.board.model;

import java.sql.*;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import kr.co.koo.util.JdbcUtil;

public class BoardDAO {
	
	private static BoardDAO dao = new BoardDAO();
	
	private DataSource ds;
	private Context ct;
	
	private BoardDAO() {
		try {
			ct = new InitialContext();
			ds = (DataSource)ct.lookup("java:comp/env/jdbc/mysql");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public static BoardDAO getInstance() {
		if(dao == null) {
			dao = new BoardDAO();
		}
		return dao;
	}
	
	//글 쓰기 요청에 대한 데이터를 DB에 저장하는 메서드
	public void write(String bName, String bTitle, String bContent) {
		
		String sql = "insert into board (board_name, board_title, board_content) values (?,?,?)";
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, bName);
			pstmt.setString(2, bTitle);
			pstmt.setString(3, bContent);
			
			pstmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JdbcUtil.close(conn);
			JdbcUtil.close(pstmt);
		}
		
	}
	
	//모든 게시글의 정보를 DB로부터 얻어올 메서드
	public ArrayList<BoardVO> list() {
		
		ArrayList<BoardVO> bList = new ArrayList<>();
		
		String sql = "select * from board order by board_no desc";
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				int bNum = rs.getInt("board_no");
				String bName = rs.getString("board_name");
				String bTitle = rs.getString("board_title");
				String bContent = rs.getString("board_content");
				Timestamp bDate = rs.getTimestamp("board_date");
				int bHit = rs.getInt("board_hit");
				
				BoardVO article = new BoardVO(bNum, bName, bTitle, bContent, bDate, bHit);
				bList.add(article);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JdbcUtil.close(conn);
			JdbcUtil.close(pstmt);
			JdbcUtil.close(rs);
		}
		
		return bList;
	}
	
	//특정 게시글의 데이터를 DB로부터 얻어올 메서드
	public BoardVO content(String bNum) {
		
		String sql = "select * from board where board_no=?";
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		BoardVO article = null;
		
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, Integer.parseInt(bNum));
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				int bNo = rs.getInt("board_no");
				String bName = rs.getString("board_name");
				String bTitle = rs.getString("board_title");
				String bContent = rs.getString("board_content");
				Timestamp bDate = rs.getTimestamp("board_date");
				int bHit = rs.getInt("board_hit");
				
				article = new BoardVO(bNo, bName, bTitle, bContent, bDate, bHit);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JdbcUtil.close(conn);
			JdbcUtil.close(pstmt);
			JdbcUtil.close(rs);
		}
		
		return article;
		
	}
	
}








