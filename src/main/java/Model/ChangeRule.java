package Model;

public class ChangeRule {
    private int tuoiHSToiDa;
    private int tuoiHSToiThieu;
    
    public ChangeRule() {
    	
    }

    public ChangeRule(int tuoiHSToiDa, int tuoiHSToiThieu) {
        this.tuoiHSToiDa = tuoiHSToiDa;
        this.tuoiHSToiThieu = tuoiHSToiThieu;
    }

    public int getTuoiHSToiDa() {
        return tuoiHSToiDa;
    }

    public void setTuoiHSToiDa(int tuoiHSToiDa) {
        this.tuoiHSToiDa = tuoiHSToiDa;
    }

    public int getTuoiHSToiThieu() {
        return tuoiHSToiThieu;
    }

    public void setTuoiHSToiThieu(int tuoiHSToiThieu) {
        this.tuoiHSToiThieu = tuoiHSToiThieu;
    }
}
