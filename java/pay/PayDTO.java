// Updated 2021.08.09 오전 10:20

package pay;

public class PayDTO {

	private int payid;
	private String paydate;		//YYYY-MM-DD
	private String memid;
	private int proid;
	private String checkin;	//YYYY-MM-DD 
	private String checkout;	//YYYY-MM-DD
	private int payprice;
	
	public PayDTO(int payid, String paydate, String memid, int proid, 
			String checkin, String checkout, int payprice) {
		this.payid = payid;
		this.paydate = paydate;
		this.memid = memid;
		this.proid = proid;
		this.checkin = checkin;
		this.checkout = checkout;
		this.payprice = payprice;
	}

	public int getPayid() {
		return payid;
	}

	public void setPayid(int payid) {
		this.payid = payid;
	}

	public String getPaydate() {
		return paydate;
	}

	public void setPaydate(String paydate) {
		this.paydate = paydate;
	}

	public String getMemid() {
		return memid;
	}

	public void setMemid(String memid) {
		this.memid = memid;
	}

	public int getProid() {
		return proid;
	}

	public void setProid(int proid) {
		this.proid = proid;
	}

	public String getCheckin() {
		return checkin;
	}

	public void setCheckin(String checkin) {
		this.checkin = checkin;
	}

	public String getCheckout() {
		return checkout;
	}

	public void setCheckout(String checkout) {
		this.checkout = checkout;
	}

	public int getPayprice() {
		return payprice;
	}

	public void setPayprice(int payprice) {
		this.payprice = payprice;
	}

	@Override
	public String toString() {
		return "PayDTO [payid=" + payid + ", paydate=" + paydate + ", memid=" + memid + ", proid=" + proid
				+ ", checkin=" + checkin + ", checkout=" + checkout + ", payprice=" + payprice + "]";
	}
	
	
	
	
	
	
	
	
}
