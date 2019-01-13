package com.rgst;

public class RgstDTO {
	private int num;
	private String addr;
	private String title;
	private String writer;
	private String wdate;
	private String kind;
	private String gender;
	private String birth;
	private String content;
	private String prev;
	private String imgpath;
	private String dogsize;
	private String pers;
	private String ap1;
	private String ap2;
	private String ap3;
	private String ap4;
	public RgstDTO() {
	}
	public RgstDTO(int num, String addr, String title, String writer, String wdate, String kind, String gender,
			String birth, String content, String prev, String imgpath, String dogsize, String pers, String ap1,
			String ap2, String ap3, String ap4) {
		this.num = num;
		this.addr = addr;
		this.title = title;
		this.writer = writer;
		this.wdate = wdate;
		this.kind = kind;
		this.gender = gender;
		this.birth = birth;
		this.content = content;
		this.prev = prev;
		this.imgpath = imgpath;
		this.dogsize = dogsize;
		this.pers = pers;
		this.ap1 = ap1;
		this.ap2 = ap2;
		this.ap3 = ap3;
		this.ap4 = ap4;
	}
	public RgstDTO(String addr, String title, String writer, String kind, String gender, String birth, String content,
			String prev, String imgpath, String dogsize, String pers, String ap1, String ap2, String ap3, String ap4) {
		this.addr = addr;
		this.title = title;
		this.writer = writer;
		this.kind = kind;
		this.gender = gender;
		this.birth = birth;
		this.content = content;
		this.prev = prev;
		this.imgpath = imgpath;
		this.dogsize = dogsize;
		this.pers = pers;
		this.ap1 = ap1;
		this.ap2 = ap2;
		this.ap3 = ap3;
		this.ap4 = ap4;
	}
	public RgstDTO(int num, String title, String writer, String wdate) {
		super();
		this.num = num;
		this.title = title;
		this.writer = writer;
		this.wdate = wdate;
	}
	public RgstDTO(int num, String imgpath, String dogsize, String pers, String ap1, String ap2, String ap3,
			String ap4) {
		super();
		this.num = num;
		this.imgpath = imgpath;
		this.dogsize = dogsize;
		this.pers = pers;
		this.ap1 = ap1;
		this.ap2 = ap2;
		this.ap3 = ap3;
		this.ap4 = ap4;
	}
	public RgstDTO(int num, String imgpath) {
		super();
		this.num = num;
		this.imgpath = imgpath;
	}
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public String getAddr() {
		return addr;
	}
	public void setAddr(String addr) {
		this.addr = addr;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public String getWdate() {
		return wdate;
	}
	public void setWdate(String wdate) {
		this.wdate = wdate;
	}
	public String getKind() {
		return kind;
	}
	public void setKind(String kind) {
		this.kind = kind;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getBirth() {
		return birth;
	}
	public void setBirth(String birth) {
		this.birth = birth;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getPrev() {
		return prev;
	}
	public void setPrev(String prev) {
		this.prev = prev;
	}
	public String getImgpath() {
		return imgpath;
	}
	public void setImgpath(String imgpath) {
		this.imgpath = imgpath;
	}
	public String getDogsize() {
		return dogsize;
	}
	public void setDogsize(String dogsize) {
		this.dogsize = dogsize;
	}
	public String getPers() {
		return pers;
	}
	public void setPers(String pers) {
		this.pers = pers;
	}
	public String getAp1() {
		return ap1;
	}
	public void setAp1(String ap1) {
		this.ap1 = ap1;
	}
	public String getAp2() {
		return ap2;
	}
	public void setAp2(String ap2) {
		this.ap2 = ap2;
	}
	public String getAp3() {
		return ap3;
	}
	public void setAp3(String ap3) {
		this.ap3 = ap3;
	}
	public String getAp4() {
		return ap4;
	}
	public void setAp4(String ap4) {
		this.ap4 = ap4;
	}
}
