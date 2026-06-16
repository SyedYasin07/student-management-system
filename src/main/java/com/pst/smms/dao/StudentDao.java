package com.pst.smms.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.pst.smms.Bo.StudentBo;
import com.pst.smms.DTO.StudentDto;

public class StudentDao {

    private static final String SELECT_ALL_STUDENTS = "SELECT * FROM railway.student";
    private static final String ADD_NEW_STUDENT = "INSERT INTO railway.student VALUES (?, ?, ?, ?, ?, ?, ?)";
    private static final String UPDATE_STUDENT_BY_ROLLNUMBER = 
        "UPDATE railway.student SET full_name=?, gender=?, dob=?, mobile=?, email=?, password=? WHERE roll_number=?";
	
	  private static final String GET_STUDENT_BY_ROLL =
	  "SELECT * FROM railway.student WHERE roll_number=?";
	//   private static final String DELETE_MARKS="DELETE FROM railway.student WHERE roll_number = ?";
	  private static final String SEARCH_MARKS="select*from railway.student where roll_number=?";
       private static final String STUDENT_LOGIN =
  			"SELECT * FROM railway.student WHERE roll_number=? AND password=?";
	 

    // ✅ Fetch all students
    public List<StudentDto> getAllStudents() {
    	  List<StudentDto> list = new ArrayList<StudentDto>(); 
        try {
        	 Class.forName("com.mysql.cj.jdbc.Driver");
             Connection con = DriverManager.getConnection("jdbc:mysql://shuttle.proxy.rlwy.net:39720/railway?useSSL=false&allowPublicKeyRetrieval=true&serverTimezone=UTC", "root", "awsYxCKkaHAtWDuAftCnfuxWTpnXFruL");

             PreparedStatement ps = con.prepareStatement(SELECT_ALL_STUDENTS);
             ResultSet rs=ps.executeQuery();
           
             while(rs.next()) {
            	 StudentDto dto=new StudentDto(
            			 rs.getInt(1),rs.getString(2),rs.getString(3),rs.getDate(4),rs.getString(5),rs.getString(6),rs.getString(7)
            			 ) ;
            	 list.add(dto);
             }
        }catch(Exception e) {
        	e.printStackTrace();
        }
           return list;
    }

    // ✅ Insert new student
    public int createNewStudent(StudentBo bo) throws ClassNotFoundException, SQLException {
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://shuttle.proxy.rlwy.net:39720/railway?useSSL=false&allowPublicKeyRetrieval=true&serverTimezone=UTC", "root", "awsYxCKkaHAtWDuAftCnfuxWTpnXFruL");
             PreparedStatement ps = con.prepareStatement(ADD_NEW_STUDENT) ;
            		 

            ps.setInt(1, bo.getRollnumber());
            ps.setString(2, bo.getName());
            ps.setString(3, bo.getGender());
            ps.setDate(4, bo.getDob());
            ps.setString(5, bo.getMobile());
            ps.setString(6, bo.getEmail());
            ps.setString(7, bo.getPassword());
            int i=ps.executeUpdate();
            return i;
        }
    

    // ✅ Get student by roll number
    public StudentDto getStudentByRoll(int rollNumber) {
        StudentDto dto = null;

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://shuttle.proxy.rlwy.net:39720/railway?useSSL=false&allowPublicKeyRetrieval=true&serverTimezone=UTC", "root", "awsYxCKkaHAtWDuAftCnfuxWTpnXFruL");

            PreparedStatement ps = con.prepareStatement(GET_STUDENT_BY_ROLL);
            ps.setInt(1, rollNumber);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                dto = new StudentDto();
                dto.setRollNumber(rs.getInt("roll_number"));
                dto.setFullName(rs.getString("full_name"));
                dto.setGender(rs.getString("gender"));
                dto.setDateofbirth(rs.getDate("dob"));
                dto.setMobileNumber(rs.getString("mobile"));
                dto.setEmail(rs.getString("email"));
                dto.setPassword(rs.getString("password"));
            }

            rs.close();
            ps.close();
            con.close();

        } catch (Exception e) {
            e.printStackTrace();
        }

        return dto;
    }
 // StudentDao.java
    public int updateStudent(StudentBo bo) {
        int rows = 0;
        try (
            Connection con = DriverManager.getConnection("jdbc:mysql://shuttle.proxy.rlwy.net:39720/railway?useSSL=false&allowPublicKeyRetrieval=true&serverTimezone=UTC", "root", "awsYxCKkaHAtWDuAftCnfuxWTpnXFruL");
            PreparedStatement ps = con.prepareStatement(
                "UPDATE railway.student SET full_name = ?, gender = ?, dob = ?, mobile = ?, email = ?, password = ? WHERE roll_number = ?");
        ) {
            Class.forName("com.mysql.cj.jdbc.Driver");
            ps.setString(1, bo.getName());
            ps.setString(2, bo.getGender());
            ps.setDate(3, bo.getDob());
            ps.setString(4, bo.getMobile());
            ps.setString(5, bo.getEmail());
            ps.setString(6, bo.getPassword());
            ps.setInt(7, bo.getRollnumber());

            rows = ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return rows;
    }
     public int deleteByRollNumber(int rollNumber) {
    int result = 0;

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");

        Connection con = DriverManager.getConnection(
            "jdbc:mysql://shuttle.proxy.rlwy.net:39720/railway?useSSL=false&allowPublicKeyRetrieval=true&serverTimezone=UTC",
            "root",
            "awsYxCKkaHAtWDuAftCnfuxWTpnXFruL"
        );

        con.setAutoCommit(false);

        PreparedStatement ps1 = con.prepareStatement(
            "DELETE FROM railway.student_marks WHERE roll_number = ?"
        );
        ps1.setInt(1, rollNumber);
        ps1.executeUpdate();

        PreparedStatement ps2 = con.prepareStatement(
            "DELETE FROM railway.student WHERE roll_number = ?"
        );
        ps2.setInt(1, rollNumber);

        result = ps2.executeUpdate();

        con.commit();

        ps1.close();
        ps2.close();
        con.close();

    } catch (Exception e) {
        e.printStackTrace();
    }

    return result;
}
    public StudentDto SearchByRollNumber(int rollNumber) throws Exception {
    	StudentDto dto = null;
        int result = 0;
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://shuttle.proxy.rlwy.net:39720/railway?useSSL=false&allowPublicKeyRetrieval=true&serverTimezone=UTC", "root", "awsYxCKkaHAtWDuAftCnfuxWTpnXFruL");
        PreparedStatement ps = con.prepareStatement(SEARCH_MARKS);
        ps.setInt(1, rollNumber);
        ResultSet rs = ps.executeQuery();

        if (rs.next()) {
            dto = new StudentDto();
            dto.setRollNumber(rs.getInt("roll_number"));
            dto.setFullName(rs.getString("full_name"));
            dto.setGender(rs.getString("gender"));
            dto.setDateofbirth(rs.getDate("dob"));
            dto.setMobileNumber(rs.getString("mobile"));
            dto.setEmail(rs.getString("email"));
            dto.setPassword(rs.getString("password"));
        }

        rs.close();
        ps.close();
        con.close();

    
        return dto;
    }
    public StudentDto loginStudent(int rollNumber, String password) {    	
        StudentDto dto = null;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
           
            Connection con =
                    DriverManager.getConnection(
                            "jdbc:mysql://shuttle.proxy.rlwy.net:39720/railway?useSSL=false&allowPublicKeyRetrieval=true&serverTimezone=UTC", "root", "awsYxCKkaHAtWDuAftCnfuxWTpnXFruL");

            PreparedStatement ps =
                    con.prepareStatement(STUDENT_LOGIN);

            ps.setInt(1, rollNumber);
            ps.setString(2, password);

            ResultSet rs = ps.executeQuery();

            if(rs.next()) {

                dto = new StudentDto();

                dto.setRollNumber(rs.getInt("roll_number"));
                dto.setFullName(rs.getString("full_name"));
                dto.setGender(rs.getString("gender"));
                dto.setDateofbirth(rs.getDate("dob"));
                dto.setMobileNumber(rs.getString("mobile"));
                dto.setEmail(rs.getString("email"));
                dto.setPassword(rs.getString("password"));
            }

            rs.close();
            ps.close();
            con.close();

        } catch(Exception e) {
            e.printStackTrace();
        }

        return dto;
    }


	
}


