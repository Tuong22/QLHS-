package Dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import Model.signIn;

public class AccountDao {
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
	
	public void updateAccount(signIn acc, String username) throws ClassNotFoundException {
		String SELECT_ACCOUNT = "select * from signin";
		String UPDATE_ACCOUNT = "update signin set password = ? where id = ?";
		try (Connection connection = getConnection();
				Statement stmt = connection.createStatement();
				PreparedStatement statement = connection.prepareStatement(UPDATE_ACCOUNT);
				ResultSet rs = stmt.executeQuery(SELECT_ACCOUNT))
				{
			String currentUsername = "";
			String currentId = "";
			while(rs.next()) {
				currentUsername = rs.getString(2);
				if (currentUsername.equalsIgnoreCase(username.trim())) {
					currentId = rs.getString(1);
				}
			}

			statement.setString(1, acc.getPassword());
			statement.setString(2, currentId);	
			statement.execute();

			statement.close();
			connection.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
}
