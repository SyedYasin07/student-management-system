package com.pst.smms.service;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.List;

import com.pst.smms.Bo.MarksBo;
import com.pst.smms.DTO.MarksDto;
import com.pst.smms.Vo.MarksVo;

import com.pst.smms.dao.MarksDao;

public class MarksService {

	 private MarksDao dao = new MarksDao(); 
	
	
	public int	addStudentMarks(MarksVo vo) throws ClassNotFoundException,SQLException{
		MarksBo bo;
		int total;
		double percentage;
		String grade;
		String result;
		int i;
		
		bo=new MarksBo();
		bo.setExamType(vo.getExamType());
		bo.setYear(vo.getYear());
		bo.setSub1(vo.getSub1());
		bo.setSub2(vo.getSub2());
		bo.setSub3(vo.getSub3());
		bo.setSub4(vo.getSub4());
		bo.setSub5(vo.getSub5());
		bo.setSub6(vo.getSub6());
		total=calculatetotalMarks(vo);
		percentage=calculatePercentage( total);
		grade=calculateGrade(percentage);
		result=calculateResult(vo);
		
		
		bo.setTotal_marks(total);
		bo.setPercentage(percentage);
		bo.setGrade(grade);
		bo.setResult(result);
		bo.setRollNumber(vo.getRollNumber());
		
		dao=new MarksDao();
		i =dao.addMarksData(bo);
		return i;
}
	
	public int UpdateStudent(int student_id, MarksVo vo) throws ClassNotFoundException, SQLException {
		dao=new MarksDao();
		
		MarksBo bo=null;
		int total;
		double percentage;
		String grade;
		String result;
		int i;
		
		bo=new MarksBo();
		bo.setExamType(vo.getExamType());
		bo.setYear(vo.getYear());
		bo.setSub1(vo.getSub1());
		bo.setSub2(vo.getSub2());
		bo.setSub3(vo.getSub3());
		bo.setSub4(vo.getSub4());
		bo.setSub5(vo.getSub5());
		bo.setSub6(vo.getSub6());
		total=calculatetotalMarks(vo);
		percentage=calculatePercentage( total);
		grade=calculateGrade(percentage);
		result=calculateResult(vo);
		
		
		bo.setTotal_marks(total);
		bo.setPercentage(percentage);
		bo.setGrade(grade);
		bo.setResult(result);
		bo.setRollNumber(vo.getRollNumber());
		
		return dao.updateMarksData(student_id, bo);
	}
	
	public List<MarksDto> getAllMarks() throws ClassNotFoundException , SQLException{
		dao =new MarksDao();
		List<MarksDto> marksList=dao.getAllStudentMarks();
		return marksList;
	}
	public MarksDto getStudentMarks(int rollNumber,String examType)throws ClassNotFoundException, SQLException {
		dao=new MarksDao();
		return dao.getMarksByRollNumberAndExamType(rollNumber, examType);
	}
	public int deleteStudentMarks(int rollNumber,String examType)throws ClassNotFoundException, SQLException  {
		dao=new MarksDao();
		return dao.DeleteMarksByRollNumberAndExamType(rollNumber, examType);
		}
	public List<MarksDto> getRollNumber(String rollNumber) throws ClassNotFoundException, SQLException{
		dao=new MarksDao();
		List<MarksDto> marksList=dao.getRollNumber(rollNumber);
		return marksList;
	}

	/*
	 * public int updateMarks(int rollNumber,MarksVo vo) throws
	 * ClassNotFoundException,SQLException{ MarksBo bo=null; int total; double
	 * percentage; String grade; String result; int i;
	 * 
	 * bo=new MarksBo(); bo.setExamType(vo.getExamType()); bo.setYear(vo.getYear());
	 * bo.setSub1(vo.getSub1()); bo.setSub2(vo.getSub2()); bo.setSub3(vo.getSub3());
	 * bo.setSub4(vo.getSub4()); bo.setSub5(vo.getSub5()); bo.setSub6(vo.getSub6());
	 * total=calculatetotalMarks(vo); percentage=calculatePercentage( total);
	 * grade=calculateGrade(percentage); result=calculateResult(vo);
	 * 
	 * 
	 * bo.setTotal_marks(total); bo.setPercentage(percentage); bo.setGrade(grade);
	 * bo.setResult(result); bo.setRollNumber(vo.getRollNumber());
	 * 
	 * return dao.updateMarksData(rollNumber, bo); }
	 * 
	 */
	/*
	 * public MarksDto getUpdateMarks(int rollNumber, String fullName) throws
	 * ClassNotFoundException, SQLException { dao = new MarksDao();
	 * 
	 * return dao.getMarksByRollAndName(rollNumber, fullName); }
	 */

	private String calculateResult(MarksVo vo) {
		String result="Fail";
		if(vo.getSub1()>=35 && vo.getSub2()>=35 && vo.getSub3()>=35 && vo.getSub4()>=35 && vo.getSub5()>=35 && vo.getSub6()>=35 ) {
			result="Pass";
	}
		return result;
	}
	private int calculatetotalMarks(MarksVo vo) {
		
		int total=vo.getSub1()+vo.getSub2()+vo.getSub3()+vo.getSub4()+vo.getSub5()+vo.getSub6();
		return total;
		
	}
	private double calculatePercentage(int total_marks) {
		double percentage=((double)total_marks/600*100);
		return percentage;
	}
	private String calculateGrade(double percentage) {
		String grade="";
		if(percentage>=75) {
			grade="A-Grade";
		}else if(percentage>=65 && percentage<75) {
			grade="B-Grade";
		}else if(percentage>=50 && percentage<65) {
			grade="C-Grade";
		}else if(percentage>=35 && percentage<50) {
			grade="D-Grade";
		}else {
			grade="Fail";
		}
		return grade;
	}

	
	
	
}
