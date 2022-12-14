package dao;

import java.sql.*;
import java.util.ArrayList;

import common.JDBCUtil;
import vo.TodoVO;

public class TodoDao {
	
	// 기한 남은 할 일 목록 가져오기
	public ArrayList<TodoVO> getTodoList(String userId) {
		ArrayList<TodoVO> list = new ArrayList<>();
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		// 사용자가 작성한 모든 기한이 남은 할 일 셀렉트.
		// 투두 기한을 오늘 날짜와 둘다 시간 제외한 날짜 형태로 포맷해서 비교. 오늘보다 크다-> 기한이 남은 것
		String sql = "select idx, todo, userId, TO_CHAR(deadline,'YYYY-MM-DD') deadline from todoList where userId=? and TO_CHAR(deadline,'YYYY-MM-DD') >= TO_CHAR(sysdate,'YYYY-MM-DD') order by deadline desc";
		
		conn = JDBCUtil.getConnection();
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userId);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				// 할 일 vo 객체 생성
				TodoVO vo = new TodoVO();

				// vo 값 설정
				vo.setIdx(rs.getInt("idx"));
				vo.setTodo(rs.getString("todo"));
				vo.setUserId(rs.getString("userId"));
				vo.setDeadline(rs.getString("deadline"));
				
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
	
	// 기한 지난(어제까지인) 할 일 목록 가져오기
	public ArrayList<TodoVO> getOverTodoList(String userId) {
		ArrayList<TodoVO> list = new ArrayList<>();
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		// 사용자가 작성한 모든 기한이 지난 할 일 셀렉트.
		// 투두 기한을 오늘 날짜와 둘다 시간 제외한 날짜 형태로 포맷해서 비교. 오늘보다 작다-> 기한 이미 지난 것.
		String sql = "select idx, todo, userId, TO_CHAR(deadline,'YYYY-MM-DD') deadline from todoList where userId=? and TO_CHAR(deadline,'YYYY-MM-DD') < TO_CHAR(sysdate,'YYYY-MM-DD') order by deadline desc";
		
		conn = JDBCUtil.getConnection();
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userId);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				// 할 일 객체 생성
				TodoVO vo = new TodoVO();

				// vo 값 설정
				vo.setIdx(rs.getInt("idx"));
				vo.setTodo(rs.getString("todo"));
				vo.setUserId(rs.getString("userId"));
				vo.setDeadline(rs.getString("deadline"));
				
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
	
	// 할 일 한 개 가져오기
	public TodoVO getTodo(String idx) {
		TodoVO vo = new TodoVO();
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select idx, todo, userId, TO_CHAR(deadline,'YYYY-MM-DD') deadline from todoList where idx=?";
		
		conn = JDBCUtil.getConnection();
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, idx);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				vo.setIdx(rs.getInt("idx"));
				vo.setTodo(rs.getString("todo"));
				vo.setUserId(rs.getString("userId"));
				vo.setDeadline(rs.getString("deadline"));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
			
		} finally {
			JDBCUtil.close(conn, pstmt, rs);
		}
		
		return vo;
	}
	
	// 할 일 추가하기
	public int insertTodo(String todo, String deadline, String userid) {
		int n = 0;
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		// 입력받은 값으로 할 일 인서트. idx는 시퀀스 값으로 자동증가하게.
		String sql = "insert into todoList values(seq_todo_idx.nextval, ?, ?, ?)";
		
		conn = JDBCUtil.getConnection();
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, todo);
			pstmt.setString(2, userid);
			pstmt.setString(3, deadline);
			
			n = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
			
		} finally {
			JDBCUtil.close(conn, pstmt);
		}
		
		return n;
	}
	
	// 할 일 삭제
	public int deleteTodo(String idx) {
		int n = 0;
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		// 특정 idx 값인 할 일 삭제
		String sql = "delete from todoList where idx=?";
		
		conn = JDBCUtil.getConnection();
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, idx);
			
			n = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
			
		} finally {
			JDBCUtil.close(conn, pstmt);
		}
		
		return n;
	}
	
	// 할 일 수정하기
	public int updateTodo(String idx, String todo, String deadline) {
		int n = 0;
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		// 입력받은 값으로 할 일과 기한 수정.
		String sql = "update todoList set todo=?, deadline=? where idx=?";
		
		conn = JDBCUtil.getConnection();
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, todo);
			pstmt.setString(2, deadline);
			pstmt.setString(3, idx);
			
			n = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
			
		} finally {
			JDBCUtil.close(conn, pstmt);
		}
		
		return n;
	}
}
