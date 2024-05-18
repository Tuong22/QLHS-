package Model;

public class Mon {
	private String MaMH;
	private String TenMH;
	private int HeSo;
	public Mon(String maMH, String tenMH, int heSo) {
		MaMH = maMH;
		TenMH = tenMH;
		HeSo = heSo;
	}
	public String getMaMH() {
		return MaMH;
	}
	public void setMaMH(String maMH) {
		MaMH = maMH;
	}
	public String getTenMH() {
		return TenMH;
	}
	public void setTenMH(String tenMH) {
		TenMH = tenMH;
	}
	public int getHeSo() {
		return HeSo;
	}
	public void setHeSo(int heSo) {
		HeSo = heSo;
	}
	
	
}
