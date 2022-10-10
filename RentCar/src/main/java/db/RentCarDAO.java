package db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

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

}
