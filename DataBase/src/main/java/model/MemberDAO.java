package model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

// 오라클 데이터 베이스에 연결 하고 select, insert, update, delete 작업을 실행 해 주는 클래스 
public class MemberDAO {
	
	// oracle에 접속하는 소스를 작성
	String id = "ONDD";
	String pass = "1234";
	String url = "jdbc:oracle:thin:@localhost:1521:XE"; // 접속 url
	
	Connection con; // 데이터베이스에 접근 할 수 있도록 설정 해 주는 객체 
	PreparedStatement pstmt; // 데이터 베이스에서 쿼리를 실행시켜주는 객체 
	ResultSet rs; // 데이터베이스의 테이블의 결과를 리턴받아 자바에 저장해주는 객체
	
	// 데이터 베이스에 접근할 수 있도록 도와주는 메소드 생성
	public void getCon() {
		
		try {
			// 1.해당 데이터 베이스를 사용한다고 선언(클래스를 등록 = 오라클용을 사용)
			Class.forName("oracle.jdbc.driver.OracleDriver");
			// 2.해당 데이터 베이스에 접속
			con = DriverManager.getConnection(url,id,pass);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	// 데이터베이스에 한 사람의 회원 정보를 저장해주는 메소드
	public void insertMember(MemberBean mbean) {

		try{
			getCon();
			// 3.접속 후 쿼리 준비하여  
			String sql = "insert into member values(?,?,?,?,?,?,?,?)";
			// 4.쿼리를 사용하도록 설정
			PreparedStatement pstmt = con.prepareStatement(sql);//jsp에서 쿼리를 사용하도록 설정 
			// 물음표에 맞게 데이터를 맵핑
			pstmt.setString(1, mbean.getId());
			pstmt.setString(2, mbean.getPass1());
			pstmt.setString(3, mbean.getEmail());
			pstmt.setString(4, mbean.getTel());
			pstmt.setString(5, mbean.getHobby());
			pstmt.setString(6, mbean.getJob());
			pstmt.setString(7, mbean.getAge());
			pstmt.setString(8, mbean.getInfo());
			// 5.오라클에서 쿼리를 실행하시오.
			pstmt.executeUpdate(); // insert나 update, delete시 사용하는 메소드
			
			// 6.자원 반납
			con.close();
		}catch(Exception e){
			e.printStackTrace();
		}
	}

}
