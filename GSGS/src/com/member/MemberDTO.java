package com.member;

public class MemberDTO {
	private String member_email;
	private String member_pw;
	private String member_tel;
	private String member_name;
	private String member_addr;
	
	public MemberDTO() {
	}
	public MemberDTO(String member_email, String member_pw, String member_tel, String member_name, String member_addr) {
		this.member_email = member_email;
		this.member_pw = member_pw;
		this.member_tel = member_tel;
		this.member_name = member_name;
		this.member_addr = member_addr;
	}
	public String getMember_email() {
		return member_email;
	}
	public void setMember_email(String member_email) {
		this.member_email = member_email;
	}
	public String getMember_pw() {
		return member_pw;
	}
	public void setMember_pw(String member_pw) {
		this.member_pw = member_pw;
	}
	public String getMember_tel() {
		return member_tel;
	}
	public void setMember_tel(String member_tel) {
		this.member_tel = member_tel;
	}
	public String getMember_name() {
		return member_name;
	}
	public void setMember_name(String member_name) {
		this.member_name = member_name;
	}
	public String getMember_addr() {
		return member_addr;
	}
	public void setMember_addr(String member_addr) {
		this.member_addr = member_addr;
	}
}
