package Model;

public class Lop {
	private String MaLop;
	private String TenLop;
	private int SiSo;
	private String MaKhoi;
	private String MaNH;
	public Lop(String maLop, String tenLop, int siSo, String maKhoi, String maNH) {
		MaLop = maLop;
		TenLop = tenLop;
		SiSo = siSo;
		MaKhoi = maKhoi;
		MaNH = maNH;
	}
	public String getMaLop() {
		return MaLop;
	}
	public void setMaLop(String maLop) {
		MaLop = maLop;
	}
	public String getTenLop() {
		return TenLop;
	}
	public void setTenLop(String tenLop) {
		TenLop = tenLop;
	}
	public int getSiSo() {
		return SiSo;
	}
	public void setSiSo(int siSo) {
		SiSo = siSo;
	}
	public String getMaKhoi() {
		return MaKhoi;
	}
	public void setMaKhoi(String maKhoi) {
		MaKhoi = maKhoi;
	}
	public String getMaNH() {
		return MaNH;
	}
	public void setMaNH(String maNH) {
		MaNH = maNH;
	}
	
	
}
