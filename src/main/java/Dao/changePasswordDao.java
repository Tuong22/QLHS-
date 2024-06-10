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
				int role = rs.getInt(4);

				signIn acc = new signIn(id, username, password, role);
				DSTK.add(acc);
			} 
		}catch (SQLException e) {
            e.printStackTrace();
        }
		return DSTK;
	}
	
	public boolean addAccount(signIn newAccount) throws SQLException, ClassNotFoundException {
		String querySelectId = "SELECT MaID FROM signin order by length(MaID), MaID";
		String INSERT_ACCOUNT = "INSERT INTO signin VALUES (?,?,?,?)";
		boolean isvalid = false;
        try (Connection connection = datasource.getConnection();
        	 Statement stmt = connection.createStatement();
             PreparedStatement statement = connection.prepareStatement(INSERT_ACCOUNT);
        	 ResultSet rs = stmt.executeQuery(querySelectId)) {

        	String currentAccId = "";
			String nextAccId = "";
			String prefixAccId = "";
			int max = 1;
			int traceUnindexed = 1;
			int fillUnindexed = 0;
			while (rs.next()) {
				currentAccId = rs.getString(1);
				
				if(currentAccId != "") {
					if(traceUnindexed != Integer.valueOf(currentAccId)) {
						fillUnindexed = 1;
						break;
					}
					else {
						traceUnindexed++;
					}
					if(Integer.parseInt(currentAccId) > max){
						max = Integer.parseInt(currentAccId);
					}
				}
			}
			if(currentAccId != "") {
				if(fillUnindexed == 1) {
					nextAccId = prefixAccId + Integer.toString(traceUnindexed);
				}
				else {
					nextAccId = prefixAccId + Integer.toString(max + 1);
				}
			} else
				nextAccId = prefixAccId + "1";	
			statement.setString(1, nextAccId);
			statement.setString(2, newAccount.getUsername());
			statement.setString(3, newAccount.getPassword());
			statement.setInt(4, newAccount.getIsAdmin());
			int rowAffected = statement.executeUpdate();
			
			if (rowAffected > 0) {
				isvalid = true;
			} else {
				isvalid = false;
			}

			connection.close();
        } catch (SQLException e) {
			e.printStackTrace();
		}
        return isvalid;
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
