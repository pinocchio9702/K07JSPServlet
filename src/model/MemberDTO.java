package model;

import java.sql.Date;


/*
DTO객체(Data Transfer Object)
 	 : 데이터를 저장하기 위한 객체로 맴버변수, 생성자, getter/setter
 	 메소드를 가지고 있는 클래스로 일반적인 자바빈(Bean)규약을 따른다.
 */
public class MemberDTO {
	private String id;
	private String pass;
	private String name;
	private java.sql.Date regidate;
	//기본생성자
	public MemberDTO() {
		// TODO Auto-generated constructor stub
	}
	//인자생성자
	public MemberDTO(String id, String pass, String name, Date regiadate) {
		super();
		this.id = id;
		this.pass = pass;
		this.name = name;
		this.regidate = regidate;
	}
	/**
	 * @return the id
	 */
	public String getId() {
		return id;
	}
	/**
	 * @param id the id to set
	 */
	public void setId(String id) {
		this.id = id;
	}
	/**
	 * @return the pass
	 */
	public String getPass() {
		return pass;
	}
	/**
	 * @param pass the pass to set
	 */
	public void setPass(String pass) {
		this.pass = pass;
	}
	/**
	 * @return the name
	 */
	public String getName() {
		return name;
	}
	/**
	 * @param name the name to set
	 */
	public void setName(String name) {
		this.name = name;
	}
	/**
	 * @return the regiadate
	 */
	public java.sql.Date getRegidate() {
		return regidate;
	}
	/**
	 * @param regiadate the regiadate to set
	 */
	public void setRegidate(java.sql.Date regiadate) {
		this.regidate = regidate;
	}
	
	//getter/setter

	
	
}
