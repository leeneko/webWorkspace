package com.message;

public class MessageDTO {
	private String num;
	private String name;
	private String email;
	private String content;
	private String date;
	
	public MessageDTO(String num, String name, String email, String content, String date) {
		super();
		this.num = num;
		this.name = name;
		this.email = email;
		this.content = content;
		this.date = date;
	}
	public MessageDTO(String name, String email, String content) {
		super();
		this.name = name;
		this.email = email;
		this.content = content;
	}
	public String getNum() {
		return num;
	}
	public void setNum(String num) {
		this.num = num;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
}
