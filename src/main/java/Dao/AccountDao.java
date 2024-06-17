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
	
	public boolean addAccount(SignIn newAccount) throws SQLException, ClassNotFoundException {
		String querySelectId = "SELECT MaID FROM signin order by length(MaID), MaID";
		String INSERT_ACCOUNT = "INSERT INTO signin VALUES (?,?,?,?)";
		boolean isvalid = false;
        try (Connection connection = getConnection();
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
	
	public boolean updatePassword(String newPass, String username) throws SQLException, ClassNotFoundException {
		String SELECT_PASS = "SELECT * FROM signin;";
        String UPDATE_PASS = "UPDATE signin SET password=? where MaID=?";
        boolean isvalid = false;
        try (Connection connection = getConnection();
        	 Statement stmt = connection.createStatement();
             PreparedStatement statement = connection.prepareStatement(UPDATE_PASS);
        	 ResultSet rs = stmt.executeQuery(SELECT_PASS)) {
            
        	String currentUserName = "";
        	String currentId = "";
        	while(rs.next()) {
        		currentUserName = rs.getString(2);
				if (currentUserName.equalsIgnoreCase(username.trim())) {
					currentId = rs.getString(1);
				}
			}
        	statement.setString(1, newPass);
        	statement.setString(2, currentId);
        	int rowsAffected = statement.executeUpdate();

			if (rowsAffected > 0) {
				isvalid = true;
			} else {
				isvalid = false;
			}
			statement.close();
			connection.close();
        } catch (SQLException e) {
			e.printStackTrace();
		}
        return isvalid;
    }
	
	public boolean updateRole(int newRole, String usernameRole) throws SQLException, ClassNotFoundException {
		String SELECT_ROLE = "SELECT * FROM signin;";
        String UPDATE_ROLE = "UPDATE signin SET isAdmin=? where maid=?";
        boolean isvalid = false;
        try (Connection connection = getConnection();
        	 Statement stmt = connection.createStatement();
             PreparedStatement statement = connection.prepareStatement(UPDATE_ROLE);
        	 ResultSet rs = stmt.executeQuery(SELECT_ROLE)) {
            
        	String currentUserName = "";
        	String currentId = "";
        	while(rs.next()) {
        		currentUserName = rs.getString(2);
				if (currentUserName.equalsIgnoreCase(usernameRole.trim())) {
					currentId = rs.getString(1);
				}
			}
        
        	statement.setInt(1, newRole);
        	statement.setString(2, currentId);
        	
        	int rowsAffected = statement.executeUpdate();

			if (rowsAffected > 0) {
				isvalid = true;
			} else {
				isvalid = false;
			}
        	
            statement.executeUpdate();
        } catch (SQLException e) {
			e.printStackTrace();
		}
        return isvalid;
    }
	
	public boolean deleteAccount(String userNameRoleDelete) throws SQLException, ClassNotFoundException {
		String SELECT_ROLE = "SELECT * FROM signin;";
        String DELETE_ROLE = "DELETE FROM SIGNIN WHERE MaID = ?";
        boolean isvalid = false;
        try (Connection connection = getConnection();
        	 Statement stmt = connection.createStatement();
             PreparedStatement statement = connection.prepareStatement(DELETE_ROLE);
        	 ResultSet rs = stmt.executeQuery(SELECT_ROLE)) {
            
        	String currentUserName = "";
        	String currentId = "";
        	while(rs.next()) {
        		currentUserName = rs.getString(2);
				if (currentUserName.equalsIgnoreCase(userNameRoleDelete.trim())) {
					currentId = rs.getString(1);
				}
			}
        
        	statement.setString(1, currentId);
        	
        	int rowsAffected = statement.executeUpdate();

			if (rowsAffected > 0) {
				isvalid = true;
			} else {
				isvalid = false;
			}
        	
            statement.executeUpdate();
        } catch (SQLException e) {
			e.printStackTrace();
		}
        return isvalid;
    }
}

