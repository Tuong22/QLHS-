package Dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;

import Model.tablePointSubjectClass;

public class tablePointDao {
	private DataSource datasource;
	
	public tablePointDao(DataSource datasource) {
		this.datasource = datasource;
	}
	
	public List<tablePointSubjectClass> selectPoint (String nameClass, int hocKy, String nameSubject) throws ClassNotFoundException, SQLException {
		List<tablePointSubjectClass> listPointStudent = new ArrayList<>();
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
		try (Connection connection = datasource.getConnection();
				Statement stmt = connection.createStatement();
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
				tablePointSubjectClass diem = new tablePointSubjectClass(tenLop, diemMieng, diem15phut, diem1tiet, diemHK, diemTB);
				listPointStudent.add(diem);
			}
		}	catch (SQLException e) {
			e.printStackTrace();
		}
		return listPointStudent;
	}
}
