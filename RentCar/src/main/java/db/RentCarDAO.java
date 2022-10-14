package db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class RentCarDAO {
	
	Connection con;
	PreparedStatement pstmt;
	ResultSet rs;
	
	// 커넥션 풀을 이용한 데이터베이스 연결
	public void getCon() {
		try {
			Context initctx = new InitialContext();
			Context envctx = (Context) initctx.lookup("java:comp/env");
			DataSource ds = (DataSource) envctx.lookup("jdbc/pool");
			
			// data source
			con = ds.getConnection();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	// 최신순 3대의 자동차를 리턴하는 메소드
	public	ArrayList<CarListBean> getSelectCar(){
		
		// 리턴 타입 설정
		 ArrayList<CarListBean> arr = new ArrayList<>();
		 
		 getCon(); // 커넥션이 연결 되어야 쿼리 실행 가능 

		 try {
			 
			String sql = "select * from rentcar order by no desc";
			pstmt = con.prepareStatement(sql);
			
			// 쿼리 실행 후 결과를 result 타입으로 리턴
			rs = pstmt.executeQuery();
			int count = 0;
			while(rs.next()) {
				
				CarListBean bean = new CarListBean();
				bean.setNo(rs.getInt(1));
				bean.setName(rs.getString(2));
				bean.setCategory(rs.getInt(3));
				bean.setPrice(rs.getInt(4));
				bean.setUsepeople(rs.getInt(5));
				bean.setCompany(rs.getString(6));
				bean.setImg(rs.getString(7));
				bean.setInfo(rs.getString(8));
				
				// 배열에 bean 클래스 저장
				arr.add(bean);
				
				count++;
				
				if(count > 2) {
					break;
				}
			}
			con.close();
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		 return arr;
		
	}

}
