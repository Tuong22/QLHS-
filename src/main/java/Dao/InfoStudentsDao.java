package Dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.Statement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;

import Model.HocSinh;
import Model.TraCuuHocSinh;

public class InfoStudentsDao {
	
	private DataSource datasource;
	
	public InfoStudentsDao(DataSource datasource) {
		this.datasource = datasource;
	}
	
	public List<HocSinh> selectAllStudent() throws ClassNotFoundException {
		List<HocSinh> DSHS = new ArrayList<>();
		try	(Connection connection = datasource.getConnection();
			Statement statement = connection.createStatement();	
			ResultSet rs = statement.executeQuery("select * from HocSinh")) {
			while (rs.next()) {
				String id = rs.getString(1);
				String name = rs.getString(2);
				String gender = rs.getString(3);
				int namsinh = rs.getInt(4);
				String address = rs.getString(5);
				String email = rs.getString(6);

				HocSinh hs = new HocSinh(id, name, gender, namsinh, address, email);
				DSHS.add(hs);
			} 
		}catch (SQLException e) {
            e.printStackTrace();
        }
		return DSHS;
	}
	
	public List<TraCuuHocSinh> selectStudent (String name) throws ClassNotFoundException, SQLException {
		List<TraCuuHocSinh> tchsList = new ArrayList<>();
		String SELECT_STUDENT_BY_NAME = "SELECT HocSinh.TenHS, Lop.TenLop, qthk1.DiemTBHK, qthk2.DiemTBHK"
				+ " FROM HocSinh JOIN QuaTrinh qthk1 ON HocSinh.MaHS = qthk1.MaHS"
				+ " JOIN HocKy hk1 ON qthk1.MaHK = hk1.MaHK AND hk1.TenHK = '1'"
				+ " JOIN QuaTrinh qthk2 ON HocSinh.MaHS = qthk2.MaHS"
				+ " JOIN HocKy hk2 ON qthk2.MaHK = hk2.MaHK AND hk2.TenHK = '2'"
				+ " JOIN Lop ON qthk1.MaLop = Lop.MaLop WHERE HocSinh.TenHS = ?;";
		try (Connection connection = datasource.getConnection();
				Statement stmt = connection.createStatement();
				PreparedStatement preparedStatement = connection.prepareStatement(SELECT_STUDENT_BY_NAME)){
			preparedStatement.setString(1, name);
			ResultSet rs = preparedStatement.executeQuery();
			
			while (rs.next()) {
				String namehs = rs.getString(1);
				String lop = rs.getString(2);
				float tbhk1 = rs.getFloat(3);
				float tbhk2 = rs.getFloat(4);
				TraCuuHocSinh tchs = new TraCuuHocSinh(namehs, lop, tbhk1,tbhk2);
				tchsList.add(tchs);
			}
		}	catch (SQLException e) {
			e.printStackTrace();
		}
		return tchsList;
	}

	public void insertStudent(HocSinh hs) throws ClassNotFoundException {
		String querySelectId = "SELECT MaHS FROM HocSinh order by length(MaHS), MaHS";
		String INSERT_STUDENT = "INSERT INTO HocSinh VALUES (?,?,?,?,?,?)";
		try (Connection connection = datasource.getConnection();
				Statement stmt = connection.createStatement();
				PreparedStatement statement = connection.prepareStatement(INSERT_STUDENT);
				ResultSet rs = stmt.executeQuery(querySelectId)) {
			String currentStudentId = "";
			String nextStudentId = "";
			String prefixStudentId = "HS";
			int max = 1;
			int traceUnindexed = 1;
			int fillUnindexed = 0;
			while (rs.next()) {
				currentStudentId = rs.getString(1);
				
				if(currentStudentId != "") {
					if(traceUnindexed != Integer.valueOf(currentStudentId.substring(2))) {
						fillUnindexed = 1;
						break;
					}
					else {
						traceUnindexed++;
					}
					if(Integer.parseInt(currentStudentId.substring(2)) > max){
						max = Integer.parseInt(currentStudentId.substring(2));
					}
				}
			}
			if(currentStudentId != "") {
				//System.out.println(currentRoomBillId);
				if(fillUnindexed == 1) {
					nextStudentId = prefixStudentId + Integer.toString(traceUnindexed);
				}
				else {
					nextStudentId = prefixStudentId + Integer.toString(max + 1);
				}
			} else
				nextStudentId = prefixStudentId + "1";	
				
			statement.setString(1, nextStudentId);
			statement.setString(2, hs.getTenHS());
			statement.setString(3, hs.getGioiTinh());
			statement.setInt(4, hs.getNamSinh());
			statement.setString(5, hs.getDiaChi());
			statement.setString(6, hs.getEmail());
				
			statement.execute();
			statement.close();
			rs.close();
			stmt.close();
			connection.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}

	}
}
