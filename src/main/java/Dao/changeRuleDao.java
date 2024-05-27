package Dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;

import Model.ChangeRule;
import Model.Mon;

public class changeRuleDao {
	
	private DataSource datasource;
	
	public changeRuleDao(DataSource datasource) {
		this.datasource = datasource;
	}
	
	private void close(Connection conn, Statement stmt, ResultSet rs) throws SQLException {
		if(conn != null) conn.close();
		if(stmt != null) stmt.close();
		if(rs != null) rs.close();
	}
	
	public List<ChangeRule> getChangeRule() throws SQLException {
        String SELECT_RULE = "SELECT * FROM THAMSO LIMIT 1";
        List<ChangeRule> cr = new ArrayList<>();
        try (Connection connection = datasource.getConnection();
        	Statement statement = connection.createStatement();	
            ResultSet rs = statement.executeQuery(SELECT_RULE)) {
            if (rs.next()) {
                int tuoiHSToiDa = rs.getInt(1);
                int tuoiHSToiThieu = rs.getInt(2);
                ChangeRule c = new ChangeRule(tuoiHSToiDa, tuoiHSToiThieu);
                cr.add(c);
            }
        }catch (SQLException e) {
            e.printStackTrace();
        }
        return cr;
    }

    public void updateTuoiToiThieuToiDa(int tuoiThieu, int tuoiDa) throws SQLException {
        String UPDATE_RULE = "UPDATE THAMSO SET TuoiHSToiThieu = ?, TuoiHSToiDa = ?";
        try (Connection connection = datasource.getConnection();
             PreparedStatement statement = connection.prepareStatement(UPDATE_RULE)) {
            statement.setInt(1, tuoiThieu);
            statement.setInt(2, tuoiDa);
            statement.executeUpdate();
        }
    }
}
