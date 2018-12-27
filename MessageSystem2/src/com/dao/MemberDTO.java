package com.dao;

public class MemberDTO {
	String email;
	String address;
	String tel;
	public MemberDTO(String email, String address, String tel) {
		super();
		this.email = email;
		this.address = address;
		this.tel = tel;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
}
