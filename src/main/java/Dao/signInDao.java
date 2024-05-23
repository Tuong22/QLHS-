package Dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import Model.signIn;

public class signInDao {
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
	
	public boolean validate(signIn signInModel) throws ClassNotFoundException {
		boolean status = false;

		try (Connection connection = getConnection();
				PreparedStatement preparedStatement = connection
						.prepareStatement("select * from signin where username = ? and password = ? ")) {
			preparedStatement.setString(1, signInModel.getUsername());
			preparedStatement.setString(2, signInModel.getPassword());

			System.out.println(preparedStatement);
			ResultSet rs = preparedStatement.executeQuery();
			status = rs.next();

		} catch (SQLException e) {
			e.printStackTrace();
		}
		return status;
	}


}
