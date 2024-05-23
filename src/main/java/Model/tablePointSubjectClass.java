package Model;

public class tablePointSubjectClass {
	private String tenHS;
	private float muoiLamPhut;
	private float motTiet;
	private float tbMon;
	public String getTenHS() {
		return tenHS;
	}
	public void setTenHS(String tenHS) {
		this.tenHS = tenHS;
	}
	public float getMuoiLamPhut() {
		return muoiLamPhut;
	}
	public void setMuoiLamPhut(float muoiLamPhut) {
		this.muoiLamPhut = muoiLamPhut;
	}
	public float getMotTiet() {
		return motTiet;
	}
	public void setMotTiet(float motTiet) {
		this.motTiet = motTiet;
	}
	public float getTbMon() {
		return tbMon;
	}
	public void setTbMon(float tbMon) {
		this.tbMon = tbMon;
	}
	public tablePointSubjectClass(String tenHS, float muoiLamPhut, float motTiet, float tbMon) {
		super();
		this.tenHS = tenHS;
		this.muoiLamPhut = muoiLamPhut;
		this.motTiet = motTiet;
		this.tbMon = tbMon;
	}
	
}
