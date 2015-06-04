package com.aice.model;

public class Album {
	private int id;
	private int userId;
	private String name;
	private int count;
	private String createTime;
	private String updateTime;
	public int getCount() {
		return count;
	}
	public String getCreateTime() {
		return createTime;
	}
	public int getId() {
		return id;
	}
	public String getName() {
		return name;
	}
	public String getUpdateTime() {
		return updateTime;
	}
	public int getUserId() {
		return userId;
	}
	public void setCount(int count) {
		this.count = count;
	}
	public void setCreateTime(String createTime) {
		this.createTime = createTime;
	}
	public void setId(int id) {
		this.id = id;
	}
	public void setName(String name) {
		this.name = name;
	}
	public void setUpdateTime(String updateTime) {
		this.updateTime = updateTime;
	}
	public void setUserId(int userId) {
		this.userId = userId;
	}
}
