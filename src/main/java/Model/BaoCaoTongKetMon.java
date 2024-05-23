package Model;

public class BaoCaoTongKetMon {
	private String maBCTKM;
	private String maMH;
	private String maHK;
	private String maNh;
	private String tenLop;
	private String siSo;
	public BaoCaoTongKetMon(String maBCTKM, String maMH, String maHK, String maNh, String tenLop, String siSo) {
		super();
		this.maBCTKM = maBCTKM;
		this.maMH = maMH;
		this.maHK = maHK;
		this.maNh = maNh;
		this.tenLop = tenLop;
		this.siSo = siSo;
	}
	public String getMaBCTKM() {
		return maBCTKM;
	}
	public void setMaBCTKM(String maBCTKM) {
		this.maBCTKM = maBCTKM;
	}
	public String getMaMH() {
		return maMH;
	}
	public void setMaMH(String maMH) {
		this.maMH = maMH;
	}
	public String getMaHK() {
		return maHK;
	}
	public void setMaHK(String maHK) {
		this.maHK = maHK;
	}
	public String getMaNh() {
		return maNh;
	}
	public void setMaNh(String maNh) {
		this.maNh = maNh;
	}
	public String getTenLop() {
		return tenLop;
	}
	public void setTenLop(String tenLop) {
		this.tenLop = tenLop;
	}
	public String getSiSo() {
		return siSo;
	}
	public void setSiSo(String siSo) {
		this.siSo = siSo;
	}
	
	
}
