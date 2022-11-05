package dao;

import java.sql.*;
import java.util.ArrayList;

import common.JDBCUtil;
import vo.TodoVO;

public class TodoDao {
	
	// 로그인한 사용자의 할 일 목록 가져오기
	public ArrayList<TodoVO> getTodoList(String userId) {
		ArrayList<TodoVO> list = new ArrayList<>();
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select * from todoList where userId=?";
		
		conn = JDBCUtil.getConnection();
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userId);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				// 할 일 객체 생성
				TodoVO vo = new TodoVO();
				
				vo.setTodo(rs.getString("todo"));
				vo.setUserId(rs.getString("userId"));
				vo.setDeadline(rs.getString("deadline"));
				
				list.add(vo);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
			
		} finally {
			JDBCUtil.close(conn, pstmt, rs);
		}
		
		return list;
	}
	
	// 할 일 추가하기
	public int insertTodo(String todo, String deadline, String userid) {
		int n = 0;
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = "insert into todoList values(?, ?, ?)";
		
		conn = JDBCUtil.getConnection();
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, todo);
			pstmt.setString(2, deadline);
			pstmt.setString(3, userid);
			
			n = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
			
		} finally {
			JDBCUtil.close(conn, pstmt);
		}
		
		return n;
	}
}
