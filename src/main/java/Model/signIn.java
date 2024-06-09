package Model;

import java.io.Serializable;

public class signIn implements Serializable {
	private int iD;
	private String username;
	private String password;
	private int isAdmin;
	private int isBanGiamHieu;
	private int isGiaoVien;
	public signIn(int iD, String username, String password, int isAdmin, int isBanGiamHieu, int isGiaoVien) {
		super();
		this.iD = iD;
		this.username = username;
		this.password = password;
		this.isAdmin = isAdmin;
		this.isBanGiamHieu = isBanGiamHieu;
		this.isGiaoVien = isGiaoVien;
	}
	
	public signIn() {
		
	}
	public int getiD() {
		return iD;
	}
	public void setiD(int iD) {
		this.iD = iD;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public int getIsAdmin() {
		return isAdmin;
	}
	public void setIsAdmin(int isAdmin) {
		this.isAdmin = isAdmin;
	}
	public int getIsBanGiamHieu() {
		return isBanGiamHieu;
	}
	public void setIsBanGiamHieu(int isBanGiamHieu) {
		this.isBanGiamHieu = isBanGiamHieu;
	}
	public int getIsGiaoVien() {
		return isGiaoVien;
	}
	public void setIsGiaoVien(int isGiaoVien) {
		this.isGiaoVien = isGiaoVien;
	}
	

}
