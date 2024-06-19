package Model;

import java.util.List;

public class LoaiHinhKiemTra {
	private String maLHKT;
	private String tenLHKT;
	private int heSo;
	public String getMaLHKT() {
		return maLHKT;
	}
	public void setMaLHKT(String maLHKT) {
		this.maLHKT = maLHKT;
	}
	public String getTenLHKT() {
		return tenLHKT;
	}
	public void setTenLHKT(String tenLHKT) {
		this.tenLHKT = tenLHKT;
	}
	public int getHeSo() {
		return heSo;
	}
	public void setHeSo(int heSo) {
		this.heSo = heSo;
	}
	public LoaiHinhKiemTra(String maLHKT, String dSLHKT, int heSo) {
		super();
		this.maLHKT = maLHKT;
		this.tenLHKT = dSLHKT;
		this.heSo = heSo;
	}
	
	
}
