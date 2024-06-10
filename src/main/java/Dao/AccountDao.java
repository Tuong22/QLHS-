package Dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import Model.SignIn;


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
	
	private void close(Connection conn, Statement stmt, ResultSet rs) throws SQLException {
		if(conn != null) conn.close();
		if(stmt != null) stmt.close();
		if(rs != null) rs.close();
	}
	
	public List<SignIn> renderAccountRoleAdmin() throws ClassNotFoundException {
		List<SignIn> DSTK = new ArrayList<>();
		try	(Connection connection = getConnection();
			Statement statement = connection.createStatement();	
			ResultSet rs = statement.executeQuery("select * from signin")) {
			while (rs.next()) {
				int id = rs.getInt(1);
				String username = rs.getString(2);
				String password = rs.getString(3);
				int role = rs.getInt(4);

				SignIn acc = new SignIn(id, username, password, role);
				DSTK.add(acc);
			} 
		}catch (SQLException e) {
            e.printStackTrace();
        }
		return DSTK;
	}
	
	public void updatePassword(String newPass) throws SQLException, ClassNotFoundException {
        String UPDATE_PASS = "UPDATE signin SET password=?";
        try (Connection connection = getConnection();
             PreparedStatement statement = connection.prepareStatement(UPDATE_PASS)) {
            statement.setString(1, newPass);
            statement.executeUpdate();
        } catch (SQLException e) {
			e.printStackTrace();
		}
    }
}
