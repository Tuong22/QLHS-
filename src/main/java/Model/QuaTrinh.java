package Model;

public class QuaTrinh {
	private String MaHS;
	private String MaLop;
	private String MaHK;
	private double DiemTBHK;
	public QuaTrinh(String maHS, String maLop, String maHK, double diemTBHK) {
		MaHS = maHS;
		MaLop = maLop;
		MaHK = maHK;
		DiemTBHK = diemTBHK;
	}
	public String getMaHS() {
		return MaHS;
	}
	public void setMaHS(String maHS) {
		MaHS = maHS;
	}
	public String getMaLop() {
		return MaLop;
	}
	public void setMaLop(String maLop) {
		MaLop = maLop;
	}
	public String getMaHK() {
		return MaHK;
	}
	public void setMaHK(String maHK) {
		MaHK = maHK;
	}
	public double getDiemTBHK() {
		return DiemTBHK;
	}
	public void setDiemTBHK(double diemTBHK) {
		DiemTBHK = diemTBHK;
	}
	
}
