package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class BoardDAO {
	
	Connection con;
	PreparedStatement pstmt;
	ResultSet rs;
	
	// 데이터베이스에 연결해주는 메소드
	public void getCon() {
		
		try {
			
			Context initctx = new InitialContext();
			Context envctx = (Context) initctx.lookup("java:comp/env");
			DataSource ds = (DataSource) envctx.lookup("jdbc/pool");
			con = ds.getConnection(); // 커넥션 연결 해주는 메소드
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
	}
	
	// 전체 글의 개 수를 리턴하는 메서드 
	public int getAllCount() {
		
		int count = 0;
		
		getCon();
		
		try {
			
			// 쿼리 준비 
			String sql = "select count(*) from board";
			
			// 쿼리 실행
			pstmt = con.prepareStatement(sql);
			
			// 쿼리 실행 후 결과 리턴
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				count = rs.getInt(1);
			}
			
			con.close();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return count; 
	}
	
	// 화면에 보여질 데이터를 10개씩 추출해서 리턴하는 메소드 작성
	public ArrayList<BoardBean> getAllBoard(int startRow, int endRow){
		
		ArrayList<BoardBean> arr = new ArrayList<>();
		
		getCon();
		
		try {
			
			String sql = "select * from (select A.* ,Rownum Rnum from (select * from board order by ref desc, re_step asc)A) "
					+ "where Rnum >= ? and Rnum <= ?";
			
			pstmt = con.prepareStatement(sql);
			
			// ? 
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				
				// 데이터를 패키징(BoardBean 클래스를 이용)
				BoardBean bean = new BoardBean();
				bean.setNum(rs.getInt(1));
				bean.setWriter(rs.getString(2));
				bean.setEmail(rs.getString(3));
				bean.setSubject(rs.getString(4));
				bean.setPassword(rs.getString(5));
				bean.setReg_date(rs.getDate(6).toString());
				bean.setRef(rs.getInt(7));
				bean.setRe_step(rs.getInt(8));
				bean.setRe_level(rs.getInt(9));
				bean.setReadcount(rs.getInt(10));
				bean.setContent(rs.getString(11));

				// 패키징한 데이터를 어레이에 저장
				arr.add(bean);
			}
			
			con.close();
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return arr;
	}
	

}
