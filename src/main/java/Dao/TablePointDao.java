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

	public List<BangDiem> selectPoint (String nameClass, int hocKy, String nameSubject) throws ClassNotFoundException, SQLException {
		List<BangDiem> listPointStudent = new ArrayList<>();
		String SELECT_TABLE_POINT = "SELECT distinct HS.TenHS,\r\n"
								+ "    MAX(CASE WHEN LHKT.TenLHKT = 'Miệng' THEN CTLHKT.Diem END) AS DiemMieng,\r\n"
								+ "    MAX(CASE WHEN LHKT.TenLHKT = '15 phút' THEN CTLHKT.Diem END) AS Diem15Phut,\r\n"
								+ "    MAX(CASE WHEN LHKT.TenLHKT = '1 tiết' THEN CTLHKT.Diem END) AS Diem1Tiet,\r\n"
								+ "    MAX(CASE WHEN LHKT.TenLHKT = 'Học kỳ' THEN CTLHKT.Diem END) AS DiemHocKy,\r\n"
								+ "    CTBANGDIEMHS.DiemTBMon\r\n"
								+ "FROM \r\n"
								+ "    HOCSINH HS\r\n"
								+ "    INNER JOIN CT_BANGDIEMMON_HS CTBANGDIEMHS ON HS.MaHS = CTBANGDIEMHS.MaHS\r\n"
								+ "    INNER JOIN BANGDIEMMON BANGDIEM ON CTBANGDIEMHS.MaBangDiemMon = BANGDIEM.MaBangDiemMon\r\n"
								+ "    INNER JOIN LOP L ON L.MaLop = BANGDIEM.MaLop\r\n"
								+ "    INNER JOIN HOCKY HK ON HK.MaHK = BANGDIEM.MaHK\r\n"
								+ "    INNER JOIN MON M ON M.MAMH = BANGDIEM.MAMH\r\n"
								+ "    INNER JOIN CT_BANGDIEMMON_LHKT CTLHKT ON CTBANGDIEMHS.MaCT_BangDiemMon = CTLHKT.MaCT_BangDiemMon\r\n"
								+ "    INNER JOIN LOAIHINHKIEMTRA LHKT ON CTLHKT.MaLHKT = LHKT.MaLHKT\r\n"
								+ "    \r\n"
								+ "WHERE L.TenLop = ? AND HK.TenHK = ? AND M.TenMH = ?\r\n"
								+ "GROUP BY \r\n"
								+ "    HS.TenHS, CTBANGDIEMHS.DiemTBMon\r\n"
								+ "ORDER BY \r\n"
								+ "    HS.TenHS;";
		try (Connection connection = getConnection();
				PreparedStatement preparedStatement = connection.prepareStatement(SELECT_TABLE_POINT);){
			preparedStatement.setString(1, nameClass);
			preparedStatement.setInt(2, hocKy);
			preparedStatement.setString(3, nameSubject);
			ResultSet rs = preparedStatement.executeQuery();
			while (rs.next()) {
				String tenLop = rs.getString(1);
				float diemMieng = rs.getFloat(2);
				float diem15phut = rs.getFloat(3);
				float diem1tiet = rs.getFloat(4);
				float diemHK = rs.getFloat(5);
				float diemTB = rs.getFloat(6);
				BangDiem diem= new BangDiem(tenLop, diemMieng, diem15phut, diem1tiet, diemHK, diemTB);
				listPointStudent.add(diem);
			}
		}	catch (SQLException e) {
			e.printStackTrace();
		}
		return listPointStudent;
	}
}