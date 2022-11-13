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
	
    // 멤버 인서트
	public int insertMember(String id, String pwd, String birth, String motto, String isPublic) {
		int n = 0;
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = "insert into members values(?, ?, ?, ?, ?)";
		
		conn = JDBCUtil.getConnection();
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, pwd);
			pstmt.setString(3, birth);
			pstmt.setString(4, motto);
			pstmt.setString(5, isPublic);
			
			n = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
			
		} finally {
			JDBCUtil.close(conn, pstmt);
		}
		
		return n;
	}
	
	// 멤버 한 개 셀렉트
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
				vo.setMotto(rs.getString("userMotto"));
				vo.setIsPublic(rs.getString("isPublic"));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
			
		} finally {
			JDBCUtil.close(conn, pstmt, rs);
		}
		
		return vo;
	}
	
	// 공개 멤버 전체 셀렉트
	public ArrayList<MemberVO> getOthersList(String id) {
		ArrayList<MemberVO> list = new ArrayList<>();
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		// 공개 계정인 사용자 중에서 자신(현재 로그인한 사용자)를 제외한 모든 사용자 셀렉트
		String sql = "select * from members where isPublic='T' and userId !=?";
		
		conn = JDBCUtil.getConnection();
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				// 사용자 정보를 담는 vo 객체 생성
				MemberVO vo = new MemberVO();
				
				// vo에 정보 설정
				vo.setUserId(rs.getString("userId"));
				vo.setUserPwd(rs.getString("userPwd"));
				vo.setUserBirth(rs.getString("userBirth"));
				vo.setMotto(rs.getString("userMotto"));
				vo.setIsPublic(rs.getString("isPublic"));
				
				// 반환할 리스트에 추가
				list.add(vo);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
			
		} finally {
			JDBCUtil.close(conn, pstmt, rs);
		}
		
		return list;
	}
	
	// 멤버 좌우명 업데이트
	public int updateMotto(String motto, String id) {
		int n = 0;
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = "update members set userMotto=? where userId=?";
		
		conn = JDBCUtil.getConnection();
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, motto);
			pstmt.setString(2, id);
			n = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
			
		} finally {
			JDBCUtil.close(conn, pstmt);
		}
		
		return n;
	}
}
