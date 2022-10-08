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
	
	// 데이터 베이스의 커넥션 풀을 사용하도록 설정 하는 메소드 생성
	public void getCon() {
		try {
			Context initctx = new InitialContext();
			Context envctx = (Context) initctx.lookup("java:comp/env");
			DataSource ds = (DataSource) envctx.lookup("jdbc/pool");
			
			// datasource
			con = ds.getConnection();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	// 하나의 새로운 게시글이 넘어와서 저장되는 메소드
	public void insertBoard(BoardBean bean) {
		
		getCon();
		// bean 클래스에 넘어오지 않았던 데이터들을 초기화 해주어야한다.
		int ref = 0; // 글 그룹을 의미 = 쿼리를 실행 시켜서 가장 큰 ref 값을 가져 온 후 1을 더한다.
		int re_step = 1; // 새 글이기에 = 부모 글
		int re_level = 1;
		
		try {
			// 가장 큰 ref 값을 읽어오는 쿼리 준비
			String refsql = "select max(ref) from board";
			// 쿼리 실행 객체
			pstmt = con.prepareStatement(refsql);
			// 쿼리 실행 후 결과를 리턴
			rs = pstmt.executeQuery();
			if(rs.next()) { // 결과 값이 있다면 
				ref = rs.getInt(1)+1; // 최대 값에 + 1을 더해서 글 그룹을 설정
			}
			// 실제로 게시글 전체 값을 데이터 테이블에 저장하는 소스 생성
			String sql = "insert into board values(board_seq.NEXTVAL,?,?,?,?,sysdate,?,?,?,0,?)";
			pstmt = con.prepareStatement(sql);
			// ? 값을 맵핑
			pstmt.setString(1, bean.getWriter());
			pstmt.setString(2, bean.getEmail());
			pstmt.setString(3, bean.getSubject());
			pstmt.setString(4, bean.getPassword());
			pstmt.setInt(5, ref);
			pstmt.setInt(6, re_step);
			pstmt.setInt(7, re_level);
			pstmt.setString(8, bean.getContent());
			
			// 쿼리를 실행
			pstmt.executeUpdate();
			//자원반납
			con.close();
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
	}
	
	// 모든 게시글을 리턴해주는 메소드 작성
	public ArrayList<BoardBean> getAllBoard(){
			// 리턴할 객체 선언
		ArrayList<BoardBean> arr = new ArrayList<>();
		getCon();
		try {
			// 쿼리 준비 
			String sql = "select * from board order by ref desc, re_step asc";
			// 쿼리 실행 객체 선언 
			pstmt = con.prepareStatement(sql);
			// 쿼리 실행 후 결과 저장 
			rs = pstmt.executeQuery();
			// 데이터 개 수를 모르기 때문에 반복문을 사용하여 데이터를 추출
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
			e.printStackTrace();
		}
		return arr;
	}
}
