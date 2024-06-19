package Dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import Model.LoaiHinhKiemTra;
import Model.Mon;

public class SubjectDao {
	public static Connection getConnection() throws ClassNotFoundException {
		Connection connection = null;
		try {
			Class.forName("com.mysql.jdbc.Driver");
			connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/QuanLyHocSinh", "root", "123456");
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return connection;
	}
	
	public List<Mon> selectAllSubject() throws ClassNotFoundException {
		List<Mon> DSM = new ArrayList<>();
		try	(Connection connection = getConnection();
			Statement statement = connection.createStatement();	
			ResultSet rs = statement.executeQuery("select * from Mon")) {
			while (rs.next()) {
				String id = rs.getString(1);
				String tenMH = rs.getString(2);
				int heSo = rs.getInt(3);

				Mon m = new Mon(id, tenMH, heSo);
				DSM.add(m);
			} 
		}catch (SQLException e) {
            e.printStackTrace();
        }
		return DSM;
	}
	
	public List<LoaiHinhKiemTra> selectLHKT() throws ClassNotFoundException {
		List<LoaiHinhKiemTra> DSLHKT = new ArrayList<>();
		try	(Connection connection = getConnection();
			Statement statement = connection.createStatement();	
			ResultSet rs = statement.executeQuery("select * from loaihinhkiemtra")) {
			while (rs.next()) {
				String id = rs.getString(1);
				String tenLHKT = rs.getString(2);
				int heSo = rs.getInt(3);

				LoaiHinhKiemTra m = new LoaiHinhKiemTra(id, tenLHKT, heSo);
				DSLHKT.add(m);
			} 
		}catch (SQLException e) {
            e.printStackTrace();
        }
		return DSLHKT;
	}
	
	
	public boolean insertMon(Mon m) throws ClassNotFoundException {
		String querySelectId = "SELECT MaMH FROM Mon order by length(MaMH), MaMH";
		String INSERT_STUDENT = "INSERT INTO Mon VALUES (?,?,?)";
		boolean isvalid = false;
		try (Connection connection = getConnection();
				Statement stmt = connection.createStatement();
				PreparedStatement statement = connection.prepareStatement(INSERT_STUDENT);
				ResultSet rs = stmt.executeQuery(querySelectId)) {
			String currentSubjectId = "";
			String nextSubjectId = "";
			String prefixSubjectId = "MH";
			int max = 1;
			int traceUnindexed = 1;
			int fillUnindexed = 0;
			while (rs.next()) {
				currentSubjectId = rs.getString(1);
				
				if(currentSubjectId != "") {
					if(traceUnindexed != Integer.valueOf(currentSubjectId.substring(2))) {
						fillUnindexed = 1;
						break;
					}
					else {
						traceUnindexed++;
					}
					if(Integer.parseInt(currentSubjectId.substring(2)) > max){
						max = Integer.parseInt(currentSubjectId.substring(2));
					}
				}
			}
			if(currentSubjectId != "") {
				if(fillUnindexed == 1) {
					nextSubjectId = prefixSubjectId + Integer.toString(traceUnindexed);
				}
				else {
					nextSubjectId = prefixSubjectId + Integer.toString(max + 1);
				}
			} else
				nextSubjectId = prefixSubjectId + "1";	
				
			statement.setString(1, nextSubjectId);
			statement.setString(2, m.getTenMH());
			statement.setInt(3, m.getHeSo());
				
			int rowAffected = statement.executeUpdate();
			if (rowAffected > 0) {
				isvalid = true;
			} else {
				isvalid = false;
			}
			statement.close();
			rs.close();
			stmt.close();
			connection.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return isvalid;
	}
	
	
	public boolean updateSubject(Mon mon, String nameSubjectOld) throws ClassNotFoundException {
		String SELECT_SUBJECT = "select * from mon";
		String UPDATE_SUBJECT = "update mon set TenMH = ?, HeSo = ? where MaMH = ?";
		boolean isvalid = false;
		try (Connection connection = getConnection();
				Statement stmt = connection.createStatement();
				PreparedStatement statement = connection.prepareStatement(UPDATE_SUBJECT);
				ResultSet rs = stmt.executeQuery(SELECT_SUBJECT))
				{
			String currentSubjectName = "";
			String currentSubjectId = "";
			while(rs.next()) {
				currentSubjectName = rs.getString(2);
				if (currentSubjectName.equalsIgnoreCase(nameSubjectOld.trim())) {
					currentSubjectId = rs.getString(1);
				}
			}

			statement.setString(1, mon.getTenMH());
			statement.setInt(2, mon.getHeSo());	
			statement.setString(3, currentSubjectId);	
				
			int rowsAffected = statement.executeUpdate();

			if (rowsAffected > 0) {
				isvalid = true;
			} else {
				isvalid = false;
			}

			statement.close();
			connection.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return isvalid;
	}
	
	public boolean deleteSubject(String nameSubject) throws ClassNotFoundException {
		String SELECT_SUBJECT = "select * from mon";
		String DELETE_SUBJECT = "delete from mon where MaMH = ?";
		boolean isvalid = false;
		try (Connection connection = getConnection();
				Statement stmt = connection.createStatement();
				PreparedStatement statement = connection.prepareStatement(DELETE_SUBJECT);
				ResultSet rs = stmt.executeQuery(SELECT_SUBJECT))
				{
			String currentSubjectName = "";
			String currentSubjectId = "";
			while(rs.next()) {
				currentSubjectName = rs.getString(2);
				if (currentSubjectName.equalsIgnoreCase(nameSubject.trim())) {
					currentSubjectId = rs.getString(1);
				}
			}

			statement.setString(1, currentSubjectId);
				
			int rowsAffected = statement.executeUpdate();

			if (rowsAffected > 0) {
				isvalid = true;
			} else {
				isvalid = false;
			}

			statement.close();
			connection.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return isvalid;
	}
}
