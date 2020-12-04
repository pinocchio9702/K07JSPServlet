package model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletContext;

public class MyFileDAO {
	Connection con;
	PreparedStatement psmt;
	ResultSet rs;

	/*
	인자생성자 2 : JSP에서는 application내장객체를 파라미터로
		전달하고 생성자에서 web.xml을 직접 접근한다. application
		내장객체는 javax.servlet.ServletContext타입으로
		정의되었으므로 매개변수를 이와같이 정의해준다.
	*/
	public MyFileDAO(ServletContext ctx) {

		try {
			Class.forName(ctx.getInitParameter("JDBCDriver"));
			String id = "kosmo";
			String pw = "1234";
			con = DriverManager.getConnection(ctx.getInitParameter("ConnectionURL"), id, pw);
			System.out.println("DB연결 성공(인자생성자)");
		} catch (Exception e) {
			System.out.println("DB연결 실패(인자생성자)");
			e.printStackTrace();
		}
	}
	
	public int myfileInsert(MyfileDTO dto) {
		int affected = 0;
		try {
			String query = "INSERT INTO myfile( "
					+ " idx, name, title, inter, ofile, sfile) "
					+ " VALUES( "
					+ " SEQ_BBS_NUM.nextval, ?,?,?,?,?";
			
			psmt = con.prepareStatement(query);
			psmt.setString(1, dto.getName());
			psmt.setString(2, dto.getTitle());
			psmt.setNString(3, dto.getInter());
			psmt.setString(4, dto.getOfile());
			psmt.setString(5, dto.getSfile());
			
			affected = psmt.executeUpdate();
		}catch (Exception e) {
			System.out.println("insert중 예외발생");
			e.printStackTrace();
		}
		
		return affected;
	}
	
	
	
	
	
	
	
	
	
	
	
}
