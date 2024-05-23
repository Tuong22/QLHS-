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
		String SELECT_TABLE_POINT = "SELECT HS.TenHS,\r\n"
									+ " MAX(CASE WHEN LHKT.TenLHKT = '15 phút' THEN CT_LHKT.Diem ELSE NULL END),\r\n"
									+ " MAX(CASE WHEN LHKT.TenLHKT = '1 tiết' THEN CT_LHKT.Diem ELSE NULL END),\r\n"
									+ " HS_CT.DiemTBMon"
									+ " FROM HOCSINH HS\r\n"
									+ " INNER JOIN CT_BANGDIEMMON_HS HS_CT ON HS.MaHS = HS_CT.MaHS\r\n"
									+ " INNER JOIN CT_BANGDIEMMON_LHKT CT_LHKT ON HS_CT.MaCT_BangDiemMon = CT_LHKT.MaCT_BangDiemMon\r\n"
									+ " INNER JOIN LOAIHINHKIEMTRA LHKT ON CT_LHKT.MaLHKT = LHKT.MaLHKT"
									+ " GROUP BY HS.TenHS, HS_CT.DiemTBMon;";
		try (Connection connection = datasource.getConnection();
				Statement stmt = connection.createStatement();
				ResultSet rs = stmt.executeQuery(SELECT_TABLE_POINT);){
			
			while (rs.next()) {
				String tenLop = rs.getString(1);
				float diem15phut = rs.getFloat(2);
				float diem1tiet = rs.getFloat(3);
				float diemTB = rs.getFloat(4);
				System.out.print(diem15phut);
				tablePointSubjectClass diem = new tablePointSubjectClass(tenLop, diem15phut, diem1tiet, diemTB);
				listPointStudent.add(diem);
			}
		}	catch (SQLException e) {
			e.printStackTrace();
		}
		return listPointStudent;
	}
}
