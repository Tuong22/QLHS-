package Dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import Model.SignIn;

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

	public SignIn Login(String username, String pass) throws SQLException, ClassNotFoundException {

		String sql = "select * from signin where username = ? and password = ?";
		try (Connection connection = getConnection();
				PreparedStatement statement = connection.prepareStatement(sql)) {
			statement.setString(1, username);
			statement.setString(2, pass);
			ResultSet rs = statement.executeQuery();
			while (rs.next()) {
				return new SignIn(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getInt(4));
			}
		} catch (Exception e) {
		}
		return null;
	}

	private void printSQLException(SQLException ex) {
		for (Throwable e : ex) {
			if (e instanceof SQLException) {
				e.printStackTrace(System.err);
				System.err.println("SQLState: " + ((SQLException) e).getSQLState());
				System.err.println("Error Code: " + ((SQLException) e).getErrorCode());
				System.err.println("Message: " + e.getMessage());
				Throwable t = ex.getCause();
				while (t != null) {
					System.out.println("Cause: " + t);
					t = t.getCause();
				}
			}
		}
	}

}
