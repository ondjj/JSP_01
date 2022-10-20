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

			if (rs.next()) {
				count = rs.getInt(1);
			}

			con.close();

		} catch (Exception e) {
			e.printStackTrace();
		}

		return count;
	}

	// 화면에 보여질 데이터를 10개씩 추출해서 리턴하는 메소드 작성
	public ArrayList<BoardBean> getAllBoard(int startRow, int endRow) {

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

			while (rs.next()) {

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

	// 하나의 게시글을 저장하는 메소드 호출
	public void insertBoard(BoardBean bean) {

		getCon();
		int ref = 0;
		int re_step = 1; // 새 글
		int re_level = 1; // 새 글

		try {

			String refsql = "select max(ref) from board";
			pstmt = con.prepareStatement(refsql);
			// 쿼리 실행 후 결과 리턴
			rs = pstmt.executeQuery();
			if (rs.next()) {
				ref = rs.getInt(1) + 1; // 가장 큰 값의 1을 더해줌
			}
			// 데이터를 삽입하는 쿼리 준비
			String sql = "insert into board values(board_seq.NEXTVAL,?,?,?,?,sysdate,?,?,?,0,?)";
			pstmt = con.prepareStatement(sql);
			// ?
			pstmt.setString(1, bean.getWriter());
			pstmt.setString(2, bean.getEmail());
			pstmt.setString(3, bean.getSubject());
			pstmt.setString(4, bean.getPassword());
			pstmt.setInt(5, ref);
			pstmt.setInt(6, re_step);
			pstmt.setInt(7, re_level);
			pstmt.setString(8, bean.getContent());

			pstmt.executeUpdate();

			con.close();

		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
	}

	// 하나의 게시글을 읽어드리는 메소드 작성
	public BoardBean getOneBoard(int num) {

		getCon();

		BoardBean bean = null;

		try {

			// 하나의 게시글을 읽었다는 조회수 증가
			String countsql = "update board set readcount = readcount+1 where num = ?";
			pstmt = con.prepareStatement(countsql);
			// ?
			pstmt.setInt(1, num);
			pstmt.executeUpdate();

			// 한 게시글에 대한 정보를 리턴해주는 쿼리를 작성
			String sql = "select * from board where num=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);

			rs = pstmt.executeQuery();

			if (rs.next()) { // 하나의 게시글이 존재한다면
				bean = new BoardBean();
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
			}
			con.close();

		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}

		return bean;
	}

	// 답변 글을 저장하는 메소드
	public void reInsertBoard(BoardBean bean) {

		getCon();

		int ref = bean.getRef();
		int re_step = bean.getRe_step();
		int re_level = bean.getRe_level();

		try {

			// 핵심 코드
			String levelsql = "update board set re_level = re_level+1 where ref=? and re_level > ?";
			pstmt = con.prepareStatement(levelsql);
			pstmt.setInt(1, ref);
			pstmt.setInt(2, re_level);
			// 쿼리 실행 후 결과 리턴
			pstmt.executeUpdate();
			// 데이터를 삽입하는 쿼리 준비
			String sql = "insert into board values(board_seq.NEXTVAL,?,?,?,?,sysdate,?,?,?,0,?)";
			pstmt = con.prepareStatement(sql);
			// ?
			pstmt.setString(1, bean.getWriter());
			pstmt.setString(2, bean.getEmail());
			pstmt.setString(3, bean.getSubject());
			pstmt.setString(4, bean.getPassword());
			pstmt.setInt(5, ref);
			pstmt.setInt(6, re_step + 1); // 기존 부모 글의 스탭보다 1 증가
			pstmt.setInt(7, re_level + 1); // 기존 부모 글의 레벨보다 1 증가
			pstmt.setString(8, bean.getContent());

			pstmt.executeUpdate();

			con.close();

		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
	}

	// 조회수가 증가하지않는 하나의 게시글을 리턴하는 메소드
	public BoardBean getoneUpdateBoard(int num) {
		getCon();

		BoardBean bean = null;

		try {
			// 한 게시글에 대한 정보를 리턴해주는 쿼리를 작성
			String sql = "select * from board where num=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);

			rs = pstmt.executeQuery();

			if (rs.next()) { // 하나의 게시글이 존재한다면
				bean = new BoardBean();
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
			}
			con.close();

		} catch (Exception e) {
			e.printStackTrace();
		}

		return bean;
	}

	// 하나의 게시글을 수정하는 메소드
	public void updateBoard(int num, String subject, String content) {

		getCon();
		
		try {
			String sql ="update board set subject=?, content=? where num=?";
			
			pstmt = con.prepareStatement(sql);

			pstmt.setString(1, subject);
			pstmt.setString(2, content);
			pstmt.setInt(3, num);
			
			pstmt.executeUpdate();
			
			con.close();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	// 하나의 게시글을 삭제하는 메소드 
	public void deleteBoard(int num) {
		getCon();
		try {
			
			String sql = "delete from board where num=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);
			pstmt.executeUpdate();
			
			con.close();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
}
