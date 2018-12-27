package project;

public class AddressDTO {
	private String name;
	private int age;
	private String tell;
	
	public AddressDTO(String name, int age, String tell) {
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
