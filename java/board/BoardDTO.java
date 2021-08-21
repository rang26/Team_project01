//Updated 2021.08.09 오전 10:20

package board;

public class BoardDTO {
	private String memCount;
	private String proCount;
	private String boardCount;
	private String boardid;
	private String title;
	private String content;
	private String date;
	private String writer;
	private String ctgry;
	private int views;
	
	public String getMemCount() {
		return memCount;
	}
	public void setMemCount(String memCount) {
		this.memCount = memCount;
	}
	public String getProCount() {
		return proCount;
	}
	public void setProCount(String proCount) {
		this.proCount = proCount;
	}
	public String getBoardCount() {
		return boardCount;
	}
	public void setBoardCount(String boardCount) {
		this.boardCount = boardCount;
	}
	public String getBoardid() {
		return boardid;
	}
	public void setBoardid(String boardid) {
		this.boardid = boardid;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public String getCtgry() {
		return ctgry;
	}
	public void setCtgry(String ctgry) {
		this.ctgry = ctgry;
	}
	public int getViews() {
		return views;
	}
	public void setViews(int views) {
		this.views = views;
	}

}