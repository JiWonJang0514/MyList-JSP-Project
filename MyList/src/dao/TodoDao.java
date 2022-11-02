package dao;

import java.sql.*;
import java.util.ArrayList;

import common.JDBCUtil;

public class TodoDao {
	// 로그인한 사용자의 핳 일 목록 가져오기
	public ArrayList<String> getTodoList(String userId) {
		ArrayList<String> list = new ArrayList<>();
		
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
				list.add(rs.getString("todo")); //todo: 할일을 오브젝트 단위로 묶어서 가져와야 되느데..
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
			
		} finally {
			JDBCUtil.close(conn, pstmt, rs);
		}
		
		return list;
	}
}
