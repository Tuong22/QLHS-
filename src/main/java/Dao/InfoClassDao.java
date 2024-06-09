package Dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.Statement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import Model.HocSinh;
import Model.Lop;
import Model.TraCuuKhoi;

public class InfoClassDao {
	
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
	
	public List<Lop> selectAllClass() throws ClassNotFoundException {
		List<Lop> DSL = new ArrayList<>();
		try (Connection connection = getConnection();
				Statement statement = connection.createStatement();
				ResultSet rs = statement.executeQuery("select * from Lop")) {
			while (rs.next()) {
				String maLop = rs.getString(1);
				String tenLop = rs.getString(2);
				int siSo = rs.getInt(3);
				String maKhoi = rs.getString(4);
				String maNH = rs.getString(5);

				Lop l = new Lop(maLop, tenLop, siSo, maKhoi, maNH);
				DSL.add(l);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return DSL;
	}
	
	public boolean insertClass(Lop l) throws ClassNotFoundException {
		String querySelectId = "SELECT MaLop FROM Lop order by length(MaLop), MaLop";
		String INSERT_CLASS = "INSERT INTO Lop VALUES (?,?,?,?,?)";
		String maKhoi = idKhoi(l.getTenLop());
        String maNH = "NH1"; 
        boolean isvalid = false;
		try (Connection connection = getConnection();
				Statement stmt = connection.createStatement();
				PreparedStatement statement = connection.prepareStatement(INSERT_CLASS);
				ResultSet rs = stmt.executeQuery(querySelectId)) {
			String currentClassId = "";
			String nextClassId = "";
			String prefixClassId = "L";
			int max = 1;
			int traceUnindexed = 1;
			int fillUnindexed = 0;
			while (rs.next()) {
				currentClassId = rs.getString(1);
				if(currentClassId != "") {
					if(traceUnindexed != Integer.valueOf(currentClassId.substring(1))) {
						fillUnindexed = 1;
						break;
					}
					else {
						traceUnindexed++;
					}
					if(Integer.parseInt(currentClassId.substring(1)) > max){
						max = Integer.parseInt(currentClassId.substring(1));
					}
				}
			}
			if(currentClassId != "") {
				if(fillUnindexed == 1) {
					nextClassId = prefixClassId + Integer.toString(traceUnindexed);
				}
				else {
					nextClassId = prefixClassId + Integer.toString(max + 1);
				}
			} else {
				nextClassId = prefixClassId + "1";	
			}
				
			statement.setString(1, nextClassId);
			statement.setString(2, l.getTenLop());
			statement.setInt(3, l.getSiSo());
			statement.setString(4, maKhoi);
            statement.setString(5, maNH);
            
            int rowAffected = statement.executeUpdate();
			if (rowAffected > 0) {
				isvalid = true;
			} else {
				isvalid = false;
			}
			
			statement.execute();
			statement.close();
			rs.close();
			stmt.close();
			connection.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return isvalid;
	}
	
	private String idKhoi(String tenLop) {
        if (tenLop.startsWith("10")) {
            return "K1";
        } else if (tenLop.startsWith("11")) {
            return "K2";
        } else if (tenLop.startsWith("12")) {
            return "K3";
        } else {
            return "K1"; 
        }
    }
	
	public List<TraCuuKhoi> selectKhoi (String nameKhoi) throws ClassNotFoundException, SQLException {
		List<TraCuuKhoi> listNameKhoi = new ArrayList<>();
		String SELECT_KHOI = "SELECT l.TenLop, l.siSo"
							+ " FROM KHOI k, LOP l"
							+ " WHERE k.TenKhoi = ? AND l.MaKhoi = k.MaKhoi;";
		try (Connection connection = getConnection();
				PreparedStatement preparedStatement = connection.prepareStatement(SELECT_KHOI)){
			preparedStatement.setString(1, nameKhoi);
			ResultSet rs = preparedStatement.executeQuery();
			
			while (rs.next()) {
				String tenLop= rs.getString(1);
				int siSo = rs.getInt(2);
				TraCuuKhoi tck = new TraCuuKhoi(tenLop, siSo);
				listNameKhoi.add(tck);
			}
			preparedStatement.close();
			rs.close();
			connection.close();
			
		}	catch (SQLException e) {
			e.printStackTrace();
		}
		return listNameKhoi;
	}
	
	public boolean updateClass(Lop lop, String nameClassOld) throws ClassNotFoundException {
		String SELECT_CLASS = "select * from lop";
		String UPDATE_CLASS = "update lop set TenLop = ?, SiSo = ? where MaLop = ?";
		boolean isvalid = false;
		try (Connection connection = getConnection();
				Statement stmt = connection.createStatement();
				PreparedStatement statement = connection.prepareStatement(UPDATE_CLASS);
				ResultSet rs = stmt.executeQuery(SELECT_CLASS))
				{
			String currentClassName = "";
			String currentClassId = "";
			while(rs.next()) {
				currentClassName = rs.getString(2);
				if (currentClassName.equalsIgnoreCase(nameClassOld.trim())) {
					currentClassId = rs.getString(1);
				}
			}

			statement.setString(1, lop.getTenLop());
			statement.setInt(2, lop.getSiSo());	
			statement.setString(3, currentClassId);	
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
	
	public boolean deleteClass(String nameClass) throws ClassNotFoundException {
		String SELECT_CLASS = "select * from lop";
		String DELETE_CLASS = "delete from lop where MaLop = ?";
		boolean isvalid = false;
		try (Connection connection = getConnection();
				Statement stmt = connection.createStatement();
				PreparedStatement statement = connection.prepareStatement(DELETE_CLASS);
				ResultSet rs = stmt.executeQuery(SELECT_CLASS))
				{
			String currentClassName = "";
			String currentClassId = "";
			while(rs.next()) {
				currentClassName = rs.getString(2);
				if (currentClassName.equalsIgnoreCase(nameClass.trim())) {
					currentClassId = rs.getString(1);
				}
			}

			statement.setString(1, currentClassId);
			int rowsAffected = statement.executeUpdate();

			if (rowsAffected > 0) {
				isvalid = true;
				System.out.println("Xóa lớp thành công.");
			} else {
				isvalid = false;
				System.out.println("Lớp không tồn tại hoặc không thể xóa.");
			}

			statement.close();
			connection.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return isvalid;
	}

	
}
