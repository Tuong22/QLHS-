package Dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;

import Model.HocSinh;
import Model.signIn;

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
	
	public List<signIn> renderAccountRoleAdmin() throws ClassNotFoundException {
		List<signIn> DSTK = new ArrayList<>();
		try	(Connection connection = datasource.getConnection();
			Statement statement = connection.createStatement();	
			ResultSet rs = statement.executeQuery("select * from signin")) {
			while (rs.next()) {
				int id = rs.getInt(1);
				String username = rs.getString(2);
				String password = rs.getString(3);

				signIn acc = new signIn(id, username, password, 0, 0, 0);
				DSTK.add(acc);
			} 
		}catch (SQLException e) {
            e.printStackTrace();
        }
		return DSTK;
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
