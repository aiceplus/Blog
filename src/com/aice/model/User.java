package com.aice.model;

public class User {
	private int id;

	private String name;

	private String niname;

	private String psw;
	
	private int age;

	private int sex;

	private String headImgUrl;

	private String birthday;

	private String address;

	private String contact;

	private int grade;

	private int score;

	private String createTime;

	private String updateTime;

	public User(){
	}
	public String getAddress() {
		return address;
	}

	public int getAge() {
		return age;
	}

	public String getBirthday() {
		return birthday;
	}

	public String getContact() {
		return contact;
	}

	public String getCreateTime() {
		return createTime;
	}

	public int getGrade() {
		return grade;
	}

	public String getHeadImgUrl() {
		return headImgUrl;
	}

	public int getId() {
		return id;
	}

	public String getName() {
		return name;
	}

	public String getNiname() {
		return niname;
	}

	public int getScore() {
		return score;
	}

	public int getSex() {
		return sex;
	}

	public String getUpdateTime() {
		return updateTime;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public void setAge(int age) {
		this.age = age;
	}
	public void setBirthday(String birthday) {
		this.birthday = birthday;
	}
	public void setContact(String contact) {
		this.contact = contact;
	}
	public void setCreateTime(String createTime) {
		this.createTime = createTime;
	}
	public void setGrade(int grade) {
		this.grade = grade;
	}
	public void setHeadImgUrl(String headImgUrl) {
		this.headImgUrl = headImgUrl;
	}
	public void setId(int id) {
		this.id = id;
	}
	public void setName(String name) {
		this.name = name;
	}
	public void setNiname(String niname) {
		this.niname = niname;
	}
	public void setScore(int score) {
		this.score = score;
	}
	public void setSex(int sex) {
		this.sex = sex;
	}
	public void setUpdateTime(String updateTime) {
		this.updateTime = updateTime;
	}
	public String getPsw() {
		return psw;
	}
	public void setPsw(String psw) {
		this.psw = psw;
	}
}
