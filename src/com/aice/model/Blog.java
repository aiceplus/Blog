package com.aice.model;

public class Blog {
	private int id;
	private int userId;
	private String title;
	private String content;
	private int sortId;
	private String createTime;
	private String updateTime;
	
	public String getContent() {
		return content;
	}
	public String getCreateTime() {
		return createTime;
	}
	public int getId() {
		return id;
	}
	public int getSortId() {
		return sortId;
	}
	public String getTitle() {
		return title;
	}
	public String getUpdateTime() {
		return updateTime;
	}
	public int getUserId() {
		return userId;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public void setCreateTime(String createTime) {
		this.createTime = createTime;
	}
	public void setId(int id) {
		this.id = id;
	}
	public void setSortId(int sortId) {
		this.sortId = sortId;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public void setUpdateTime(String updateTime) {
		this.updateTime = updateTime;
	}
	public void setUserId(int userId) {
		this.userId = userId;
	}
}
