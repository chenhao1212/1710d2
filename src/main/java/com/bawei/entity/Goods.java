package com.bawei.entity;

public class Goods {
	private Integer gid;
	private String gname;
	private Double size;
	private Double price;
	private int count;
	private String lable;
	private String image;
	private Brand brand;
	private Skind skind;
	public Integer getGid() {
		return gid;
	}
	public void setGid(Integer gid) {
		this.gid = gid;
	}
	public String getGname() {
		return gname;
	}
	public void setGname(String gname) {
		this.gname = gname;
	}
	public Double getSize() {
		return size;
	}
	public void setSize(Double size) {
		this.size = size;
	}
	public Double getPrice() {
		return price;
	}
	public void setPrice(Double price) {
		this.price = price;
	}
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	public String getLable() {
		return lable;
	}
	public void setLable(String lable) {
		this.lable = lable;
	}
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}
	public Brand getBrand() {
		return brand;
	}
	public void setBrand(Brand brand) {
		this.brand = brand;
	}
	public Skind getSkind() {
		return skind;
	}
	public void setSkind(Skind skind) {
		this.skind = skind;
	}
	@Override
	public String toString() {
		return "Goods [gid=" + gid + ", gname=" + gname + ", size=" + size + ", price=" + price + ", count=" + count
				+ ", lable=" + lable + ", image=" + image + ", brand=" + brand + ", skind=" + skind + "]";
	}
	
 }
