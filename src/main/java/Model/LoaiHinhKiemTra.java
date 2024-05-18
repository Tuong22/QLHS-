package Model;

public class LoaiHinhKiemTra {
	private String MaLHKT;
	private String TenLHKT;
	private int HeSo;
	public LoaiHinhKiemTra(String maLHKT, String tenLHKT, int heSo) {
		MaLHKT = maLHKT;
		TenLHKT = tenLHKT;
		HeSo = heSo;
	}
	public String getMaLHKT() {
		return MaLHKT;
	}
	public void setMaLHKT(String maLHKT) {
		MaLHKT = maLHKT;
	}
	public String getTenLHKT() {
		return TenLHKT;
	}
	public void setTenLHKT(String tenLHKT) {
		TenLHKT = tenLHKT;
	}
	public int getHeSo() {
		return HeSo;
	}
	public void setHeSo(int heSo) {
		HeSo = heSo;
	}
}
