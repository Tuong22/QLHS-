package Dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import Model.BangDiem;

public class TablePointDao {
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

	public List<BangDiem> selectPoint(String nameClass, int hocKy, String nameSubject)
			throws ClassNotFoundException, SQLException {
		List<BangDiem> listPointStudent = new ArrayList<>();
		String SELECT_TABLE_POINT = "SELECT HS.TenHS,\r\n"
				+ "    MAX(CASE WHEN LHKT.TenLHKT = '15 phút' THEN CT_LHKT.Diem ELSE NULL END),\r\n"
				+ "    MAX(CASE WHEN LHKT.TenLHKT = '1 tiết' THEN CT_LHKT.Diem ELSE NULL END),\r\n"
				+ "    HS_CT.DiemTBMon\r\n" + "FROM HOCSINH HS\r\n"
				+ "INNER JOIN CT_BANGDIEMMON_HS HS_CT ON HS.MaHS = HS_CT.MaHS\r\n"
				+ "INNER JOIN BANGDIEMMON BDM ON BDM.MaBangDiemMon = HS_CT.MaBangDiemMon\r\n"
				+ "INNER JOIN MON M ON M.MaMH = BDM.MaMH\r\n" + "INNER JOIN HOCKY HK ON HK.MaHK = BDM.MaHK\r\n"
				+ "INNER JOIN LOP L ON L.MaLop = BDM.MaLop\r\n"
				+ "INNER JOIN CT_BANGDIEMMON_LHKT CT_LHKT ON HS_CT.MaCT_BangDiemMon = CT_LHKT.MaCT_BangDiemMon\r\n"
				+ "INNER JOIN LOAIHINHKIEMTRA LHKT ON CT_LHKT.MaLHKT = LHKT.MaLHKT\r\n"
				+ "WHERE L.TenLop = ? AND HK.TenHK = ? AND M.TenMH = ?\r\n"
				+ "GROUP BY HS.TenHS, HS_CT.DiemTBMon;";

		try (Connection connection = getConnection();
				PreparedStatement preparedStatement = connection.prepareStatement(SELECT_TABLE_POINT)) {
			preparedStatement.setString(1, nameClass);
			preparedStatement.setInt(2, hocKy);
			preparedStatement.setString(3, nameSubject);
			ResultSet rs = preparedStatement.executeQuery();
			while (rs.next()) {
				String tenHS = rs.getString(1);
				float diem15phut = rs.getFloat(2);
				float diem1tiet = rs.getFloat(3);
				float diemTB = rs.getFloat(4);

				BangDiem diem = new BangDiem(tenHS, diem15phut, diem1tiet, diemTB);
				listPointStudent.add(diem);

				preparedStatement.close();
				rs.close();
				connection.close();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return listPointStudent;
	}
}