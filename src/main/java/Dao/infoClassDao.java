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

import Model.Lop;
import Model.TraCuuHocSinh;
import Model.TraCuuKhoi;

public class infoClassDao {
	
	private DataSource datasource;
	
	public infoClassDao(DataSource datasource) {
		this.datasource = datasource;
	}
	
	public List<Lop> selectAllClass() throws ClassNotFoundException {
		List<Lop> DSL = new ArrayList<>();
		try	(Connection connection = datasource.getConnection();
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
		try (Connection connection = datasource.getConnection();
				Statement stmt = connection.createStatement();
				PreparedStatement preparedStatement = connection.prepareStatement(SELECT_KHOI)){
			preparedStatement.setString(1, nameKhoi);
			ResultSet rs = preparedStatement.executeQuery();
			
			while (rs.next()) {
				String tenKhoi = rs.getString(1);
				int siSo = rs.getInt(2);
				TraCuuKhoi tck = new TraCuuKhoi(tenKhoi, siSo);
				listNameKhoi.add(tck);
			}
		}	catch (SQLException e) {
			e.printStackTrace();
		}
		return listNameKhoi;
	}
}
