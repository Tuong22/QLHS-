package Model;

public class HocSinh {
	private String MaHS;
	private String TenHS;
	private String GioiTinh;
	private int NamSinh;
	private String DiaChi;
	private String Email;
	private String MaLop;
	

	public HocSinh(String maHS, String tenHS, String gioiTinh, int namSinh, String diaChi, String email, String maLop) {
		MaHS = maHS;
		TenHS = tenHS;
		GioiTinh = gioiTinh;
		NamSinh = namSinh;
		DiaChi = diaChi;
		Email = email;
		setMaLop(maLop);
	}

	public String getMaHS() {
		return MaHS;
	}

	public void setMaHS(String maHS) {
		MaHS = maHS;
	}

	public String getTenHS() {
		return TenHS;
	}

	public void setTenHS(String tenHS) {
		TenHS = tenHS;
	}

	public String getGioiTinh() {
		return GioiTinh;
	}

	public void setGioiTinh(String gioiTinh) {
		GioiTinh = gioiTinh;
	}

	public int getNamSinh() {
		return NamSinh;
	}

	public void setNamSinh(int namSinh) {
		NamSinh = namSinh;
	}

	public String getDiaChi() {
		return DiaChi;
	}

	public void setDiaChi(String diaChi) {
		DiaChi = diaChi;
	}

	public String getEmail() {
		return Email;
	}

	public void setEmail(String email) {
		Email = email;
	}

	public String getMaLop() {
		return MaLop;
	}

	public void setMaLop(String maLop) {
		MaLop = maLop;
	}
	
	
}
