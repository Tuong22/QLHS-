package Dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.Statement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import Model.HocSinh;

public class InfoStudentsDao {
	public static Connection getConnection() throws ClassNotFoundException {
		Connection connection = null;
        try	{
        	Class.forName("com.mysql.jdbc.Driver");
        	connection = DriverManager
    				.getConnection("jdbc:mysql://localhost:3306/QuanLyHocSinh", "root", "123456");
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return connection;
    } 
	
	public List<HocSinh> selectAllStudent() throws ClassNotFoundException {
		List<HocSinh> DSHS = new ArrayList<>();
		try	(Connection connection = getConnection();
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
}
