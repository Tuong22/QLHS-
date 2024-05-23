package Dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import Model.TraCuuBaoCao;

public class ReportDao {
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
	
	public List<TraCuuBaoCao> selectReport (String reportType, String subject, String semester) throws ClassNotFoundException, SQLException {
		List<TraCuuBaoCao> listReport = new ArrayList<>();
		String SELECT_BCTKHK = "SELECT l.TenLop, l.siSO, bctkhk.SLDat, bctkhk.TiLe"
							+ " FROM BaoCaoTongKetHocKy  bctkhk, LOP l, HocKy hk"
							+ " WHERE hk.TenHK = ? AND bctkhk.MaLop = l.MaLop AND bctkhk.MaHK = hk.MaHK;";
		String SELECT_BCTKM = "SELECT l.TenLop, l.SiSo, ct_bctkm.SLDat, ct_bctkm.TiLe"
							+ " FROM BaoCaoTongKetMon bctkhk, CT_BCTKM ct_bctkm, LOP l, HocKy hk, MON m"
							+ " WHERE ct_bctkm.MaLop = l.MaLop AND bctkhk.MaHK = hk.MaHK AND bctkhk.MaBCTKM = ct_bctkm.MaBCTKM"
							+ " AND bctkhk.MaMH = m.MaMH AND hk.TenHK = ? AND m.TenMH = ?;";
		if(reportType.equalsIgnoreCase("report-semester")) {
			
			try (Connection connection = getConnection();
					PreparedStatement preparedStatement = connection.prepareStatement(SELECT_BCTKHK)){
				preparedStatement.setString(1, semester);
				ResultSet rs = preparedStatement.executeQuery();
				
				while (rs.next()) {
					String tenLop= rs.getString(1);
					int siSo = rs.getInt(2);
					int slDat = rs.getInt(3);
					float tile = rs.getFloat(4);
					
					TraCuuBaoCao tcbc = new TraCuuBaoCao(tenLop, siSo, slDat, tile);
					listReport.add(tcbc);
				}
				preparedStatement.close();
				rs.close();
				connection.close();
			}	catch (SQLException e) {
				e.printStackTrace();
			}
		} else if (reportType.equalsIgnoreCase("report-subject")) {
			try (Connection connection = getConnection();
					PreparedStatement preparedStatement = connection.prepareStatement(SELECT_BCTKM)){
				preparedStatement.setString(1, semester);
				preparedStatement.setString(2, subject);
				ResultSet rs = preparedStatement.executeQuery();
				
				while (rs.next()) {
					String tenLop= rs.getString(1);
					int siSo = rs.getInt(2);
					int slDat = rs.getInt(3);
					float tile = rs.getFloat(4);
					
					TraCuuBaoCao tcbc = new TraCuuBaoCao(tenLop, siSo, slDat, tile);
					listReport.add(tcbc);
				}
				preparedStatement.close();
				rs.close();
				connection.close();
			}	catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return listReport;
	}
}
