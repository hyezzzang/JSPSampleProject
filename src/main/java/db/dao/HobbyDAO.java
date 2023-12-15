package db.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import db.dto.HobbyDTO;
import db.util.DBConnectionManager;

public class HobbyDAO {

	//필드변수
	Connection conn;
	PreparedStatement psmt;
	ResultSet rs;

	public List<HobbyDTO> findThobbyList() {
		
		//DB연결코드
		conn = DBConnectionManager.connectDB();

		String sql =  " SELECT * from t_hobby_list ORDER BY id, no"; 
		
		 List<HobbyDTO> hobbyList = null;		
		 //if (hobbyList == null)
		
		try {
			psmt = conn.prepareStatement(sql);
			rs = psmt.executeQuery(); //준비된 sql 쿼리문 실행!
			
			hobbyList = new ArrayList<HobbyDTO>();
			//if (hobbyList.size() > 0)
			
			while(rs.next()) { 

//				if(hobbyList == null) {
//					hobbyList = new ArrayList<HobbyDTO>();
//				}
				
				HobbyDTO hobby = new HobbyDTO(rs.getInt("id"), rs.getInt("no"), rs.getString("hobby"), rs.getInt("prefer"));
				
				hobbyList.add(hobby);
				
				//System.out.println(id + " " + no + " " + hobby + " " + prefer);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBConnectionManager.closeDB(conn, psmt, rs);
		}
		
		return hobbyList;	//return 0;
	}
	
	
	

}