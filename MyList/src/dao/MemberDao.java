package dao;

import java.sql.*;
import java.util.ArrayList;

import common.JDBCUtil;
import vo.MemberVO;

public class MemberDao {
	// 로그인 입력정보 확인
	public boolean getMemberPwd(String id, String pwd) {
		boolean result = false;
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select userPwd from members where userId=?";
		
		conn = JDBCUtil.getConnection();
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			
			if (rs.next()) {
				if ( pwd.equals(rs.getString("userPwd")) )
					result = true;
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
			
		} finally {
			JDBCUtil.close(conn, pstmt, rs);
		}
		
		return result;
	}
	
//	멤버 인서트
	public int insertMember(String id, String pwd, String birth, String isPublic) {
		int n = 0;
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = "insert into members values(?, ?, ?, ?)";
		
		conn = JDBCUtil.getConnection();
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, pwd);
			pstmt.setString(3, birth);
			pstmt.setString(4, isPublic);
			
			n = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
			
		} finally {
			JDBCUtil.close(conn, pstmt);
		}
		
		return n;
	}
	
//	멤버 한 개 셀렉트
	public MemberVO getMember(String id) {
		MemberVO vo = new MemberVO();
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select * from members where userId=?";
		
		conn = JDBCUtil.getConnection();
		try {
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				vo.setUserId(rs.getString("userId"));
				vo.setUserPwd(rs.getString("userPwd"));
				vo.setUserBirth(rs.getString("userBirth"));
				vo.setIsPublic(rs.getString("isPublic"));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
			
		} finally {
			JDBCUtil.close(conn, pstmt, rs);
		}
		
		return vo;
	}
	
//	공개 멤버 전체 셀렉트
	public ArrayList<MemberVO> getPublicMemberList() {
		ArrayList<MemberVO> list = new ArrayList<>();
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select * from members where isPublic='T'";
		
		conn = JDBCUtil.getConnection();
		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				MemberVO vo = new MemberVO();
				
				vo.setUserId(rs.getString("userId"));
				vo.setUserPwd(rs.getString("userPwd"));
				vo.setUserBirth(rs.getString("userBirth"));
				vo.setIsPublic(rs.getString("isPublic"));
				
				list.add(vo);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
			
		} finally {
			JDBCUtil.close(conn, pstmt, rs);
		}
		
		return list;
	}
	
	
	
	
	
	
	
	
	
	
	
//	---------------------------------------------------------------
	

	//	멤버 업데이트
	public int updateMember(String userId, String userPwd) {
		int n = 0;
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = "update member set userpwd=? where userid=?";
		
		conn = JDBCUtil.getConnection();
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userPwd);
			pstmt.setString(2, userId);
			n = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
			
		} finally {
			JDBCUtil.close(conn, pstmt);
		}
		
		return n;
	}
	
	// 멤버 딜리트
	public int deleteMember(String userId) {
		int n = 0;
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = "delete from member where userid=?";
		
		conn = JDBCUtil.getConnection();
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userId);
			n = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
			
		} finally {
			JDBCUtil.close(conn, pstmt);
		}
		
		return n;
	}
}
