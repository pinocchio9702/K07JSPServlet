package controller;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.List;
import java.util.Map;
import java.util.Vector;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import model.BbsDTO;

public class DataroomDAO {
	Connection con;
	PreparedStatement psmt;
	ResultSet rs;
	
	//기본생성자에 DBCP(커넥션풀)을 통해 DB연결
	public DataroomDAO() {
		try {
			Context initctx = new InitialContext();
			Context ctx = (Context)initctx.lookup("java:comp/env");
			DataSource source = (DataSource)ctx.lookup("jdbc/myoracle");
			con = source.getConnection();
			
			
			System.out.println("DBCP연결 성공(인자생성자)");
		} catch (Exception e) {
			System.out.println("DBCP연결 실패(인자생성자)");
			e.printStackTrace();
		}
	}
	
	
	//게시물의 갯수를 카운트
	public int getTotalRecordCount(Map map) {
		//게시물의 갯수는 최초 0으로 초기화
		int totalCount = 0;
		
		try {
		//기본쿼리문(전체레코드를 대상으로 함)
		String sql = "SELECT COUNT(*) FROM dataroom";
		
		//JSP페이지에서 검색어를 입력한 경우 where절이 동적으로 추가된다.
		if(map.get("Word")!=null) {
			sql += "   WHERE  " + map.get("Column") + " "
					+"  LIKE '%" + map.get("Word") + "%'";
		}
		
		System.out.println("query=" + sql);
		
			//쿼리 실행후 결과값 반환
			psmt = con.prepareStatement(sql);
			rs = psmt.executeQuery();
			rs.next();
			totalCount = rs.getInt(1);
		}
		catch (Exception e) {}
		
		return totalCount;
	}
	
	//게시물을 가져와서 ResultSet형태로 반환
	public List<DataroomDTO> selectList(Map<String, Object> map){
		//리스트 컬렉션을 생성
		List<DataroomDTO> dataroom = new Vector<DataroomDTO>();
		//기본 쿼리문
		String sql = "SELECT * FROM dataroom  ";
		
		//검색어가 있을경우 조건절 동작 추가
		if(map.get("Word")!=null) {
			sql += "   WHERE  " + map.get("Column") + " "
					+"  LIKE '%" + map.get("Word") + "%'";
		}
		
		//최근게시물을 항상 위로 노출해야 하므로 작성된 순서의 역순으로 정렬한다.
		sql += "   ORDER BY idx DESC";
		
		try {
			psmt = con.prepareStatement(sql);
			rs = psmt.executeQuery();
			//오라클이 반환해주는 Result의 갯수만큼 반복
			while(rs.next()) {
				//하나의 레코드를 DTO객체에 저장하기 위해 새로운 객체생성
				DataroomDTO dto = new DataroomDTO();
				//setter()를 통해 각각의 컬럼에 데이터 저장
				dto.setIdx(rs.getString(1));
				dto.setName(rs.getString(2));
				dto.setTitle(rs.getString(3));
				dto.setContent(rs.getString(4));
				dto.setPostdate(rs.getDate(5));
				dto.setAttachedfile(rs.getString(6));
				dto.setDowncount(rs.getInt(7));
				dto.setPass(rs.getString(8));
				dto.setVisitcount(rs.getInt(9));
				
				//DTO객체를 List컬렉션에 추가
				dataroom.add(dto);
				System.out.println("쿼리 토스 성공");
			}
		}
		catch (Exception e) {
			System.out.println("select시 예외발생");
			e.printStackTrace();
		}
		
		return dataroom;
		
	}
	
	public int insert(DataroomDTO dto) {
		int affected = 0;
		try {
			String sql = "INSERT INTO dataroom ( "
					+ "  idx, title, name, content, attachedfile, pass, downcount)  "
					+ "  VALUES ( "
					+ "  dataroom_seq.NEXTVAL, ?,?,?,?,?,0)";
			psmt = con.prepareStatement(sql);
			psmt.setString(1, dto.getTitle());
			psmt.setString(2, dto.getName());
			psmt.setString(3, dto.getContent());
			psmt.setString(4, dto.getAttachedfile());
			psmt.setString(5, dto.getPass());
			
			affected = psmt.executeUpdate();
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		return affected;
	}
	
	public void close() {
		try {
			//연결을 해제하는 것이 아니고 풀에 다시 반납한다.
			if(rs!=null) rs.close();
			if(psmt !=null) psmt.close();
			if(con !=null) con.close();
		}
		catch (Exception e) {
			System.out.println("자원반납시 예외발생");
		}
	}
}
