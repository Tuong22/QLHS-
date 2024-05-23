package Dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.Statement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import Model.Lop;
import Model.TraCuuKhoi;

public class InfoClassDao {
	
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
	
	public List<Lop> selectAllClass() throws ClassNotFoundException {
		List<Lop> DSL = new ArrayList<>();
		try	(Connection connection = getConnection();
			Statement statement = connection.createStatement();	
			ResultSet rs = statement.executeQuery("select * from Lop")) {
			while (rs.next()) {
				String maLop = rs.getString(1);
				String tenLop = rs.getString(2);
				int siSo = rs.getInt(3);
				String maKhoi = rs.getString(4);
				String maNH = rs.getString(5);

				Lop l = new Lop(maLop, tenLop, siSo, maKhoi, maNH);
				DSL.add(l);
			} 
		}catch (SQLException e) {
            e.printStackTrace();
        }
		return DSL;
	}
	
	public List<TraCuuKhoi> selectKhoi (String nameKhoi) throws ClassNotFoundException, SQLException {
		List<TraCuuKhoi> listNameKhoi = new ArrayList<>();
		String SELECT_KHOI = "SELECT l.TenLop, l.siSo"
							+ " FROM KHOI k, LOP l"
							+ " WHERE k.TenKhoi = ? AND l.MaKhoi = k.MaKhoi;";
		try (Connection connection = getConnection();
				PreparedStatement preparedStatement = connection.prepareStatement(SELECT_KHOI)){
			preparedStatement.setString(1, nameKhoi);
			ResultSet rs = preparedStatement.executeQuery();
			
			while (rs.next()) {
				String tenLop= rs.getString(1);
				int siSo = rs.getInt(2);
				TraCuuKhoi tck = new TraCuuKhoi(tenLop, siSo);
				listNameKhoi.add(tck);
			}
			preparedStatement.close();
			rs.close();
			connection.close();
			
		}	catch (SQLException e) {
			e.printStackTrace();
		}
		return listNameKhoi;
	}
	
	public void updateClass(Lop lop, String nameClassOld) throws ClassNotFoundException {
		String SELECT_CLASS = "select * from lop";
		String UPDATE_CLASS = "update lop set TenLop = ?, SiSo = ? where MaLop = ?";
		try (Connection connection = getConnection();
				Statement stmt = connection.createStatement();
				PreparedStatement statement = connection.prepareStatement(UPDATE_CLASS);
				ResultSet rs = stmt.executeQuery(SELECT_CLASS))
				{
			String currentClassName = "";
			String currentClassId = "";
			while(rs.next()) {
				currentClassName = rs.getString(2);
				if (currentClassName.equalsIgnoreCase(nameClassOld.trim())) {
					currentClassId = rs.getString(1);
				}
			}

			statement.setString(1, lop.getTenLop());
			statement.setInt(2, lop.getSiSo());	
			statement.setString(3, currentClassId);	
				
			statement.execute();

			statement.close();
			connection.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	public void deleteClass(String nameClass) throws ClassNotFoundException {
		String SELECT_CLASS = "select * from lop";
		String DELETE_CLASS = "delete from lop where MaLop = ?";
		try (Connection connection = getConnection();
				Statement stmt = connection.createStatement();
				PreparedStatement statement = connection.prepareStatement(DELETE_CLASS);
				ResultSet rs = stmt.executeQuery(SELECT_CLASS))
				{
			String currentClassName = "";
			String currentClassId = "";
			while(rs.next()) {
				currentClassName = rs.getString(2);
				if (currentClassName.equalsIgnoreCase(nameClass.trim())) {
					currentClassId = rs.getString(1);
				}
			}

			statement.setString(1, currentClassId);
				
			statement.execute();

			statement.close();
			connection.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
}
