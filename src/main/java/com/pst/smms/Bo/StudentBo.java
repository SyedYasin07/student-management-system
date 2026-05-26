package com.pst.smms.Bo;

import java.sql.Date;

public class StudentBo {

	
	private int rollnumber;
	private String name;
	private String gender;
	private Date dob;
	private String mobile;
	private String email;
	private String password;
	public StudentBo() {}
	public StudentBo(int rollnumber, String name, String gender, Date dob, String mobile, String email,
			String password) {
		
		this.rollnumber = rollnumber;
		this.name = name;
		this.gender = gender;
		this.dob = dob;
		this.mobile = mobile;
		this.email = email;
		this.password = password;
	}
	public int getRollnumber() {
		return rollnumber;
	}
	public void setRollnumber(int rollnumber) {
		this.rollnumber = rollnumber;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public Date getDob() {
		return dob;
	}
	public void setDob(Date dob) {
		this.dob = dob;
	}
	public String getMobile() {
		return mobile;
	}
	public void setMobile(String mobile) {
		this.mobile = mobile;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	@Override
	public String toString() {
		return "StudentBo [rollnumber=" + rollnumber + ", name=" + name + ", gender=" + gender + ", dob=" + dob
				+ ", mobile=" + mobile + ", email=" + email + ", password=" + password + "]";
	}
	
	
	
	
}
