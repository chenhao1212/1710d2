package com.bawei.entity;

public class Condition {
	private String gname;
	private Integer pageNum;
	public String getGname() {
		return gname;
	}
	public void setGname(String gname) {
		this.gname = gname;
	}
	public Integer getPageNum() {
		return pageNum;
	}
	public void setPageNum(Integer pageNum) {
		this.pageNum = pageNum;
	}
	@Override
	public String toString() {
		return "Condition [gname=" + gname + ", pageNum=" + pageNum + "]";
	}
	
}
