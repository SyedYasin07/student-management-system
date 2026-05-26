package com.pst.smms.Bo;

public class MarksBo {
	private int rollNumber;
	private String fullName;
	private String examType;
	private int year;
	private int sub1;
	private int sub2;
	private int sub3;
	private int sub4;
	private int sub5;
	private int sub6;
	private int total_marks;
	private double percentage;
	private String grade;
	private String result;
	
	public MarksBo() {
		
	}
	
	public MarksBo(int rollNumber,String fullName, String examType, int year, int sub1, int sub2, int sub3, int sub4, int sub5,
			int sub6, int total_marks, double percentage, String grade, String result) {
		
		this.rollNumber = rollNumber;
		this.fullName=fullName;
		this.examType = examType;
		this.year = year;
		this.sub1 = sub1;
		this.sub2 = sub2;
		this.sub3 = sub3;
		this.sub4 = sub4;
		this.sub5 = sub5;
		this.sub6 = sub6;
		this.total_marks = total_marks;
		this.percentage = percentage;
		this.grade = grade;
		this.result = result;
	}

	public int getRollNumber() {
		return rollNumber;
	}
	public void setRollNumber(int rollNumber) {
		this.rollNumber = rollNumber;
	}
	
	public String getFullName() {
		return fullName;
	}

	public void setFullName(String fullName) {
		this.fullName = fullName;
	}

	public String getExamType() {
		return examType;
	}
	public void setExamType(String examType) {
		this.examType = examType;
	}
	public int getYear() {
		return year;
	}
	public void setYear(int year) {
		this.year = year;
	}
	public int getSub1() {
		return sub1;
	}
	public void setSub1(int sub1) {
		this.sub1 = sub1;
	}
	public int getSub2() {
		return sub2;
	}
	public void setSub2(int sub2) {
		this.sub2 = sub2;
	}
	public int getSub3() {
		return sub3;
	}
	public void setSub3(int sub3) {
		this.sub3 = sub3;
	}
	public int getSub4() {
		return sub4;
	}
	public void setSub4(int sub4) {
		this.sub4 = sub4;
	}
	public int getSub5() {
		return sub5;
	}
	public void setSub5(int sub5) {
		this.sub5 = sub5;
	}
	public int getSub6() {
		return sub6;
	}
	public void setSub6(int sub6) {
		this.sub6 = sub6;
	}
	public int getTotal_marks() {
		return total_marks;
	}
	public void setTotal_marks(int total_marks) {
		this.total_marks = total_marks;
	}
	public double getPercentage() {
		return percentage;
	}
	public void setPercentage(double percentage) {
		this.percentage = percentage;
	}
	public String getGrade() {
		return grade;
	}
	public void setGrade(String grade) {
		this.grade = grade;
	}
	public String getResult() {
		return result;
	}
	public void setResult(String result) {
		this.result = result;
	}

	@Override
	public String toString() {
		return "MarksBo [rollNumber=" + rollNumber + ", fullName=" + fullName + ", examType=" + examType + ", year="
				+ year + ", sub1=" + sub1 + ", sub2=" + sub2 + ", sub3=" + sub3 + ", sub4=" + sub4 + ", sub5=" + sub5
				+ ", sub6=" + sub6 + ", total_marks=" + total_marks + ", percentage=" + percentage + ", grade=" + grade
				+ ", result=" + result + "]";
	}
	
	
	
}
