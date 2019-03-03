package com;

public class VO {
	private int orderNum; // 주문 번호
	private String aname; // 폭탄주 명
	private String type1; // 술1 종류
	private String rate1; // 술1 비율
	private String type2; // 술2 종류
	private String rate2; // 술2 비율
	private String type3; // 술3 종류
	private String rate3; // 술3 비율
	private String io; // 뽑음, 안뽑음 여부
	public VO() { 	}
	public VO(int orderNum, String name, String type1, String rate1, String type2, String rate2, String io) {
		this.orderNum = orderNum;
		this.aname = name;
		this.type1 = type1;
		this.rate1 = rate1;
		this.type2 = type2;
		this.rate2 = rate2;
		this.io = io;
	}
	public VO(int orderNum, String name, String type1, String rate1, String type2, String rate2, String type3,
			String rate3, String io) {
		this.orderNum = orderNum;
		this.aname = name;
		this.type1 = type1;
		this.rate1 = rate1;
		this.type2 = type2;
		this.rate2 = rate2;
		this.type3 = type3;
		this.rate3 = rate3;
		this.io = io;
	}
	public int getOrderNum() {
		return orderNum;
	}
	public void setOrderNum(int orderNum) {
		this.orderNum = orderNum;
	}
	public String getName() {
		return aname;
	}
	public void setName(String name) {
		this.aname = name;
	}
	public String getType1() {
		return type1;
	}
	public void setType1(String type1) {
		this.type1 = type1;
	}
	public String getRate1() {
		return rate1;
	}
	public void setRate1(String rate1) {
		this.rate1 = rate1;
	}
	public String getType2() {
		return type2;
	}
	public void setType2(String type2) {
		this.type2 = type2;
	}
	public String getRate2() {
		return rate2;
	}
	public void setRate2(String rate2) {
		this.rate2 = rate2;
	}
	public String getType3() {
		return type3;
	}
	public void setType3(String type3) {
		this.type3 = type3;
	}
	public String getRate3() {
		return rate3;
	}
	public void setRate3(String rate3) {
		this.rate3 = rate3;
	}
	public String getIo() {
		return io;
	}
	public void setIo(String io) {
		this.io = io;
	}
	@Override
	public String toString() {
		return aname + ":" + type1 + ":" + rate1 + ":" + type2 + ":" + rate2 + ":" + type3 + ":" + rate3 + ":" + io + ":";
	}
	
}
