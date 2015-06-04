package com.aice.model;

public class Sort {
	private int id;

	private int userid;

	private String sortName;

	private String createTime;

	private String updateTime;

	private int count;
	
	public int getCount() {
		return count;
	}

	public String getCreateTime() {
		return createTime;
	}

	public int getId() {
		return id;
	}

	public String getSortName() {
		return sortName;
	}

	public String getUpdateTime() {
		return updateTime;
	}

	public int getUserid() {
		return userid;
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
	public void setSortName(String sortName) {
		this.sortName = sortName;
	}
	public void setUpdateTime(String updateTime) {
		this.updateTime = updateTime;
	}
	public void setUserid(int userid) {
		this.userid = userid;
	}
}
