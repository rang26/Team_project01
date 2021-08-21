//Updated 2021.08.09 18:00
//Updated 2021.08.09 오전 10:20

package search.dto;

public class searchBag {
	
	private int proid;
	private String memid;
	private String pronam;
	private String proadd;
	private String protel;
	private String propk;
	private String prowifi;
	private String propet;
	private String probk;
	private int proprice;
	private String proimg;
	
	public int getProid() {
		return proid;
	}
	public void setProid(int proid) {
		this.proid = proid;
	}
	public String getMemid() {
		return memid;
	}
	public void setMemid(String memid) {
		this.memid = memid;
	}
	public String getPronam() {
		return pronam;
	}
	public void setPronam(String pronam) {
		this.pronam = pronam;
	}
	public String getProadd() {
		return proadd;
	}
	public void setProadd(String proadd) {
		this.proadd = proadd;
	}
	public String getProtel() {
		return protel;
	}
	public void setProtel(String protel) {
		this.protel = protel;
	}
	public String getPropk() {
		return propk;
	}
	public void setPropk(String propk) {
		this.propk = propk;
	}
	public String getProwifi() {
		return prowifi;
	}
	public void setProwifi(String prowifi) {
		this.prowifi = prowifi;
	}
	public String getPropet() {
		return propet;
	}
	public void setPropet(String propet) {
		this.propet = propet;
	}
	public String getProbk() {
		return probk;
	}
	public void setProbk(String probk) {
		this.probk = probk;
	}
	public int getProprice() {
		return proprice;
	}
	public void setProprice(int proprice) {
		this.proprice = proprice;
	}
	public String getProimg() {
		return proimg;
	}
	public void setProimg(String proimg) {
		this.proimg = proimg;
	}
	
	@Override
	public String toString() {
		return "searchBag [proid=" + proid + ", pronam=" + pronam + ", proadd=" + proadd + ", protel=" + protel
				+ ", propk=" + propk + ", prowifi=" + prowifi + ", propet=" + propet + ", probk=" + probk
				+ ", proprice=" + proprice + ", proimg=" + proimg + "]";
	}

}
