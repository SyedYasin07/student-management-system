package com.pst.smms.service;

import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.List;

import com.pst.smms.Bo.StudentBo;
import com.pst.smms.DTO.StudentDto;
import com.pst.smms.Vo.StudentVo;
import com.pst.smms.dao.StudentDao;


public class StudentService {
	private StudentDao dao;

	public StudentService() {
        dao = new StudentDao();  // ensure DAO is initialized
    }
	// ✅ Get all students
	public List<StudentDto> retrieveAllStudents() {
        return dao.getAllStudents();
    }
	// ✅ Save new student
	public int saveStudent(StudentVo vo) throws ClassNotFoundException, SQLException {
		StudentBo bo = null;
		Date dob = convertToSqlDate(vo.getDob());
		bo = new StudentBo(
			vo.getRollnumber(),
			vo.getName(),
			vo.getGender(),
			dob,
			vo.getMobile(),
			vo.getEmail(),
			vo.getPassword()
		);
		/* dao = new StudentDao(); */
		int i = dao.createNewStudent(bo);
		return i;
	}

	// ✅ Convert dob (String) to java.sql.Date
	private Date convertToSqlDate(String date) {
		Date sqlDate = null;
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd"); // fixed incorrect format (was yyyy-MM-DD)
		try {
			java.util.Date utilDate = dateFormat.parse(date);
			sqlDate = new Date(utilDate.getTime());
		} catch (ParseException e) {
			e.printStackTrace();
		}
		return sqlDate;
	}

	 public StudentDto getStudentByRoll(int rollNumber) {
	        return dao.getStudentByRoll(rollNumber);
	    }

	    // ✅ Update student (with conversion and logic)
	    public int updateStudent(StudentVo vo) {
	        StudentDto existing = dao.getStudentByRoll(vo.getRollnumber());

	        if (existing == null) {
	            System.out.println("Student not found with roll: " + vo.getRollnumber());
	            return 0;
	        }

	        Date dob = convertToSqlDate(vo.getDob());

	        StudentBo bo = new StudentBo(
	            vo.getRollnumber(),
	            vo.getName(),
	            vo.getGender(),
	            dob,
	            vo.getMobile(),
	            vo.getEmail(),
	            vo.getPassword()
	        );

	        return dao.updateStudent(bo);
	    }
	    
	    public int deleteStudentByRollNumber(int rollNumber) throws ClassNotFoundException, SQLException {
	        StudentDao dao = new StudentDao();
	        try {
				return dao.deleteByRollNumber(rollNumber);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				return 0;
			}
	    }
	    public StudentDto SearchStudentByRollNumber(int rollNumber) throws Exception {
	        StudentDao dao = new StudentDao();
	        return dao.SearchByRollNumber(rollNumber);
	    }



			}

	


