package dao;

import java.sql.*;
import java.util.ArrayList;

import common.JDBCUtil;
import vo.TodoVO;

public class TodoDao {
	
	// 로그인한 사용자의 핳 일 목록 가져오기
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
}
