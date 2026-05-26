package com.pst.smms.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import com.pst.smms.Bo.MarksBo;
import com.pst.smms.DTO.MarksDto;

public class MarksDao {
	
	
	private static final String ADD_MARKS_QUERY="insert into student_marks(exam_type,exam_year,sub1,sub2,sub3,sub4,sub5,sub6,total_marks,percentage,grade,result,roll_number)values(?,?,?,?,?,?,?,?,?,?,?,?,?)";	
	
	private static final String GET_ALL_STUDENT_MARKS="select sm.student_id,st.roll_number ,st.full_name,sm.exam_type,sm.exam_year,sm.sub1,sm.sub2,sm.sub3,sm.sub4,sm.sub5,sm.sub6,sm.total_marks,sm.percentage,sm.grade,sm.result from student st INNER JOIN student_marks sm ON st.roll_number=sm.roll_number";
			private static final String GET_MARKS_BY_ROLLNUMBER_AND_TYPE = """
		    SELECT 
		        sm.student_id,
		        st.roll_number,
		        st.full_name,
		        st.gender,
		        st.dob,
		        st.email,
		        sm.exam_type,
		        sm.exam_year,
		        sm.sub1,
		        sm.sub2,
		        sm.sub3,
		        sm.sub4,
		        sm.sub5,
		        sm.sub6,
		        sm.total_marks,
		        sm.percentage,
		        sm.grade,
		        sm.result
		    FROM 
		        student st
		    INNER JOIN 
		        smms.student_marks sm 
		    ON 
		        st.roll_number = sm.roll_number
		    WHERE 
		        st.roll_number = ? 
		        AND sm.exam_type = ?
		    """;

	
		private static final String UPDATE_STUDENT_MARKS="update smms.student_marks set exam_type=?,exam_year=?,sub1=?,sub2=?,sub3=?,sub4=?,sub5=?,sub6=?,total_marks=?,percentage=?,grade=?,result=? where student_id=?";
		private static final String DELETE_MARKS="delete from smms.student_marks where roll_number=? and exam_type=?";
		private static final String GET_MARKS = """
			    SELECT 
			        st.roll_number,
			        st.full_name,
			        sm.exam_type,
			        sm.exam_year,
			        sm.sub1,
			        sm.sub2,
			        sm.sub3,
			        sm.sub4,
			        sm.sub5,
			        sm.sub6,
			        sm.total_marks,
			        sm.percentage,
			        sm.grade,
			        sm.result
			    FROM 
			        smms.student st
			    INNER JOIN 
			        student_marks sm ON st.roll_number = sm.roll_number
			    WHERE 
			        st.roll_number = ?
			""";
		/*
		 * private static final String UPDATE_MARKS = """ UPDATE student_marks SET
		 * exam_year = ?, exam_type = ?, sub1 = ?, sub2 = ?, sub3 = ?, sub4 = ?, sub5 =
		 * ?, sub6 = ?, total_marks = ?, percentage = ?, grade = ?, result = ? WHERE
		 * roll_number = ? AND full_name = ? """;
		 */


	public int	addMarksData(MarksBo bo) throws  ClassNotFoundException,SQLException{
		
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con=DriverManager.getConnection("jdbc:mysql://shuttle.proxy.rlwy.net:39720/railway?useSSL=false&allowPublicKeyRetrieval=true&serverTimezone=UTC", "root", "awsYxCKkaHAtWDuAftCnfuxWTpnXFruL");
			PreparedStatement ps=con.prepareStatement( ADD_MARKS_QUERY);
			ps.setString(1, bo.getExamType());
			ps.setInt(2, bo.getYear());
			ps.setInt(3,bo.getSub1());
			ps.setInt(4,bo.getSub2());
			ps.setInt(5,bo.getSub3());
			ps.setInt(6,bo.getSub4());
			ps.setInt(7,bo.getSub5());
			ps.setInt(8,bo.getSub6());
			ps.setInt(9,bo.getTotal_marks());
			ps.setDouble(10,bo.getPercentage());
			ps.setString(11,bo.getGrade());
			ps.setString(12,bo.getResult());
			ps.setInt(13,bo.getRollNumber());
			
			int i=ps.executeUpdate();	
			return i;
	}

	public int	updateMarksData(int student_id,MarksBo bo) throws  ClassNotFoundException,SQLException{
		
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con=DriverManager.getConnection("jdbc:mysql://shuttle.proxy.rlwy.net:39720/railway?useSSL=false&allowPublicKeyRetrieval=true&serverTimezone=UTC", "root", "awsYxCKkaHAtWDuAftCnfuxWTpnXFruL");
			PreparedStatement ps=con.prepareStatement( UPDATE_STUDENT_MARKS);
			ps.setString(1, bo.getExamType());
			ps.setInt(2, bo.getYear());
			ps.setInt(3,bo.getSub1());
			ps.setInt(4,bo.getSub2());
			ps.setInt(5,bo.getSub3());
			ps.setInt(6,bo.getSub4());
			ps.setInt(7,bo.getSub5());
			ps.setInt(8,bo.getSub6());
			ps.setInt(9,bo.getTotal_marks());
			ps.setDouble(10,bo.getPercentage());
			ps.setString(11,bo.getGrade());
			ps.setString(12,bo.getResult());
			ps.setInt(13,student_id);
			
			
			int i=ps.executeUpdate();	
			return i;
	}
	
	public List<MarksDto> getAllStudentMarks() throws  ClassNotFoundException,SQLException {
		List<MarksDto> markslist=new ArrayList<MarksDto>();
		Class.forName("com.mysql.cj.jdbc.Driver");
		Connection con=DriverManager.getConnection("jdbc:mysql://shuttle.proxy.rlwy.net:39720/railway?useSSL=false&allowPublicKeyRetrieval=true&serverTimezone=UTC", "root", "awsYxCKkaHAtWDuAftCnfuxWTpnXFruL");
		PreparedStatement ps=con.prepareStatement( GET_ALL_STUDENT_MARKS);
		ResultSet rs =ps.executeQuery();
		while(rs.next()) {
			MarksDto dto= new MarksDto();
			dto.setRollNumber(rs.getInt(1));
			dto.setRollNumber(rs.getInt(2));
			dto.setFullName(rs.getString(3));
			dto.setExamType(rs.getString(4));
			dto.setExamYear(rs.getInt(5));
			dto.setSub1(rs.getInt(6));
			dto.setSub2(rs.getInt(7));
			dto.setSub3(rs.getInt(8));
			dto.setSub4(rs.getInt(9));
			dto.setSub5(rs.getInt(10));
			dto.setSub6(rs.getInt(11));
			dto.setTotal_marks(rs.getInt(12));
			dto.setPercentage(rs.getDouble(13));
			dto.setGrade(rs.getString(14));
			dto.setResult(rs.getString(15));
			markslist.add(dto);
		}
		return markslist;
		
	}
	public MarksDto getMarksByRollNumberAndExamType(int rollNumber,String examType) throws ClassNotFoundException, SQLException{
		MarksDto dto =null;
		Class.forName("com.mysql.cj.jdbc.Driver");
		Connection con=DriverManager.getConnection("jdbc:mysql://shuttle.proxy.rlwy.net:39720/railway?useSSL=false&allowPublicKeyRetrieval=true&serverTimezone=UTC", "root", "awsYxCKkaHAtWDuAftCnfuxWTpnXFruL");
		PreparedStatement ps=con.prepareStatement( GET_MARKS_BY_ROLLNUMBER_AND_TYPE );
		ps.setInt(1, rollNumber);
		ps.setString(2,examType );
		ResultSet rs=ps.executeQuery();
		if(rs.next()) {
			dto=new MarksDto(rs.getInt(1),rs.getInt(2),rs.getString(3),rs.getString(4),rs.getDate(5).toString(),rs.getString(6),rs.getString(7),rs.getInt(8),rs.getInt(9),rs.getInt(10),rs.getInt(11),rs.getInt(12),rs.getInt(13),rs.getInt(14),rs.getInt(15),rs.getDouble(16),rs.getString(17),rs.getString(18));
			
		}
		return dto;
	}
	public int DeleteMarksByRollNumberAndExamType(int rollNumber, String examType)throws ClassNotFoundException, SQLException {
		Class.forName("com.mysql.cj.jdbc.Driver");
		Connection con=DriverManager.getConnection("jdbc:mysql://shuttle.proxy.rlwy.net:39720/railway?useSSL=false&allowPublicKeyRetrieval=true&serverTimezone=UTC", "root", "awsYxCKkaHAtWDuAftCnfuxWTpnXFruL");
		PreparedStatement ps=con.prepareStatement( DELETE_MARKS);
		ps.setInt(1, rollNumber);
		ps.setString(2, examType);
		int i=ps.executeUpdate();
		return i;
		
	}
	public List<MarksDto> getRollNumber(String rollNumber) throws  ClassNotFoundException,SQLException {
		List<MarksDto> markslist=new ArrayList<MarksDto>();
		Class.forName("com.mysql.cj.jdbc.Driver");
		Connection con=DriverManager.getConnection("jdbc:mysql://shuttle.proxy.rlwy.net:39720/railway?useSSL=false&allowPublicKeyRetrieval=true&serverTimezone=UTC", "root", "awsYxCKkaHAtWDuAftCnfuxWTpnXFruL");
		PreparedStatement ps=con.prepareStatement( GET_MARKS );
		ps.setString(1, rollNumber);
		ResultSet rs =ps.executeQuery();
		while(rs.next()) {
			MarksDto dto= new MarksDto();
			dto.setRollNumber(rs.getInt(1));
			dto.setFullName(rs.getString(2));
			dto.setExamType(rs.getString(3));
			dto.setExamYear(rs.getInt(4));
			dto.setSub1(rs.getInt(5));
			dto.setSub2(rs.getInt(6));
			dto.setSub3(rs.getInt(7));
			dto.setSub4(rs.getInt(8));
			dto.setSub5(rs.getInt(9));
			dto.setSub6(rs.getInt(10));
			dto.setTotal_marks(rs.getInt(11));
			dto.setPercentage(rs.getDouble(12));
			dto.setGrade(rs.getString(13));
			dto.setResult(rs.getString(14));
			markslist.add(dto);
		}
		return markslist;
}
/*
 * public MarksDto getMarksByRollAndName(int rollNumber, String fullName) throws
 * ClassNotFoundException, SQLException {
 * 
 * Class.forName("com.mysql.cj.jdbc.Driver"); Connection con =
 * DriverManager.getConnection("jdbc:mysql://localhost:3306/smms", "root",
 * "$yasin4758");
 * 
 * String query =
 * "update student_marks set exam_type=?,exam_year=?,sub1=?,sub2=?,sub3=?,sub4=?,sub5=?,sub6=?,total_marks=?,percentage=?,grade=?,result=? where =?"
 * ; PreparedStatement ps = con.prepareStatement(query); ps.setInt(1,
 * rollNumber); ps.setString(2, fullName);
 * 
 * ResultSet rs = ps.executeQuery(); // ✅ now valid
 * 
 * if (rs.next()) { MarksDto dto = new MarksDto();
 * 
 * dto.setRollNumber(rs.getInt("roll_number"));
 * dto.setFullName(rs.getString("full_name"));
 * dto.setExamType(rs.getString("exam_type"));
 * dto.setExamYear(rs.getInt("exam_year")); dto.setSub1(rs.getInt("sub1"));
 * dto.setSub2(rs.getInt("sub2")); dto.setSub3(rs.getInt("sub3"));
 * dto.setSub4(rs.getInt("sub4")); dto.setSub5(rs.getInt("sub5"));
 * dto.setSub6(rs.getInt("sub6")); return dto; }
 * 
 * return null;
 * 
 * 
 * }
 */

}
