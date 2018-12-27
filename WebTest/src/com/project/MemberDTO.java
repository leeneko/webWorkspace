package com.project;

public class MemberDTO {
	private String name;
	private int age;
	private String tell;
	
	public MemberDTO(String name, int age, String tell) {
		super();
		this.name = name;
		this.age = age;
		this.tell = tell;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getAge() {
		return age;
	}
	public void setAge(int age) {
		this.age = age;
	}
	public String getTell() {
		return tell;
	}
	public void setTell(String tell) {
		this.tell = tell;
	}
}
