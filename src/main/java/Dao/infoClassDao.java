package Dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.Statement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;

import Model.HocSinh;
import Model.Lop;
import Model.Mon;
import Model.TraCuuHocSinh;
import Model.TraCuuKhoi;
import Model.updateLop;

public class infoClassDao {
	
	private DataSource datasource;
	
	public infoClassDao(DataSource datasource) {
		this.datasource = datasource;
	}
	
	public List<Lop> selectAllClass() throws ClassNotFoundException {
		List<Lop> DSL = new ArrayList<>();
		try	(Connection connection = datasource.getConnection();
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
		}catch (SQLException e) {
            e.printStackTrace();
        }
		return DSL;
	}
	
	public void insertClass(Lop l) throws ClassNotFoundException {
		String querySelectId = "SELECT MaLop FROM Lop order by length(MaLop), MaLop";
		String INSERT_CLASS = "INSERT INTO Lop VALUES (?,?,?,?,?)";
		String maKhoi = idKhoi(l.getTenLop());
        String maNH = "NH1"; 
		try (Connection connection = datasource.getConnection();
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
			
			statement.execute();
			statement.close();
			rs.close();
			stmt.close();
			connection.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
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
		try (Connection connection = datasource.getConnection();
				Statement stmt = connection.createStatement();
				PreparedStatement preparedStatement = connection.prepareStatement(SELECT_KHOI)){
			preparedStatement.setString(1, nameKhoi);
			ResultSet rs = preparedStatement.executeQuery();
			
			while (rs.next()) {
				String tenKhoi = rs.getString(1);
				int siSo = rs.getInt(2);
				TraCuuKhoi tck = new TraCuuKhoi(tenKhoi, siSo);
				listNameKhoi.add(tck);
			}
		}	catch (SQLException e) {
			e.printStackTrace();
		}
		return listNameKhoi;
	}
	
	public void updateClass(Lop nameClass, String nameClassOld) throws ClassNotFoundException {
		String SELECT_CLASS = "select * from lop";
		String UPDATE_CLASS = "update lop set TenLop = ? where MaLop = ?";
		try (Connection connection = datasource.getConnection();
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
			statement.setString(1, nameClass.getTenLop());
			statement.setString(2, currentClassId);	
			statement.execute();

			statement.close();
			connection.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	public void deleteClass(String nameClass) throws ClassNotFoundException {
		String SELECT_CLASS = "select * from lop";
		String DELETE_CLASS = "delete from lop where MaLop = ?";
		try (Connection connection = datasource.getConnection();
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
			statement.execute();
			statement.close();
			connection.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	public boolean checkDeleteClass(String nameClass) throws ClassNotFoundException {
		String querySelectId = "SELECT COUNT(*) AS studentCount FROM Lop WHERE TenLop = ?";
		boolean isvalid = false;
		try (Connection connection = datasource.getConnection();
		         PreparedStatement preparedStatement = connection.prepareStatement(querySelectId)) {
		        preparedStatement.setString(1, nameClass);
		        try (ResultSet rs = preparedStatement.executeQuery()) {
		            if (rs.next()) {
		                int studentCount = rs.getInt("studentCount");
		                isvalid = studentCount < 1;
		            }
		        }
		    } catch (SQLException e) {
		        e.printStackTrace();
		    }
		return isvalid;
	}
	
}
