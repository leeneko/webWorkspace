package com;

public class FileDTO {
	private int num;
	private String writter;
	private String title;
	private String content;
	private String fileName;
	private String sendate;
	public FileDTO(int num, String writter, String title, String content, String fileName, String sendate) {
		super();
		this.num = num;
		this.writter = writter;
		this.title = title;
		this.content = content;
		this.fileName = fileName;
		this.sendate = sendate;
	}
	public FileDTO(String writter, String title, String content, String fileName) {
		super();
		this.writter = writter;
		this.title = title;
		this.content = content;
		this.fileName = fileName;
	}
	public FileDTO() {
	}
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public String getWritter() {
		return writter;
	}
	public void setWritter(String writter) {
		this.writter = writter;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getFileName() {
		return fileName;
	}
	public void setFileName(String fileName) {
		this.fileName = fileName;
	}
	public String getSendate() {
		return sendate;
	}
	public void setSendate(String sendate) {
		this.sendate = sendate;
	}
	
}
