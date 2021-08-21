//Updated 2021.08.09 오전 10:20

package member;

public class MemberDTO {
	private String memid;
	private String pw;
	private String name;
	private String tel;
	private String ssn;
	
	public String getMemid() {
		return memid;
	}
	public void setMemid(String memid) {
		this.memid = memid;
	}
	public String getPw() {
		return pw;
	}
	public void setPw(String pw) {
		this.pw = pw;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public String getSsn() {
		return ssn;
	}
	public void setSsn(String ssn) {
		this.ssn = ssn;
	}
	@Override
	public String toString() {
		return "MemberDTO [memid=" + memid + ", pw=" + pw + ", name=" + name + ", tel=" + tel + ", ssn=" + ssn + "]";
	}
	
	

}
