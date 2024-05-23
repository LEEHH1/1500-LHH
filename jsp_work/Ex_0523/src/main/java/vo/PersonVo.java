package vo;

public class PersonVo {
	
	private String name;// 이름
	private int age;// 나이
	private String tel; // 전화번호
	
	public  PersonVo(String name,int age, String tel) {
		this.name = name;
		this.age = age;
		this.tel = tel;
		
		
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
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	
	
}
