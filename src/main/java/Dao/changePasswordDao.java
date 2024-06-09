package Dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.sql.DataSource;

public class changePasswordDao {
	private DataSource datasource;
	
	public changePasswordDao(DataSource datasource) {
		this.datasource = datasource;
	}
	
	private void close(Connection conn, Statement stmt, ResultSet rs) throws SQLException {
		if(conn != null) conn.close();
		if(stmt != null) stmt.close();
		if(rs != null) rs.close();
	}
	
	public void updatePassword(String newPass) throws SQLException, ClassNotFoundException {
        String UPDATE_PASS = "UPDATE signin SET password=?";
        try (Connection connection = datasource.getConnection();
             PreparedStatement statement = connection.prepareStatement(UPDATE_PASS)) {
            statement.setString(1, newPass);
            statement.executeUpdate();
        } catch (SQLException e) {
			e.printStackTrace();
		}
    }
}
