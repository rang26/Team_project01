//Updated 2021.08.09 오전 10:20

package board;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class ReplyDAO {

	Connection con;

	// db접속 생성자
	public ReplyDAO() {
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");	//mac
//			Class.forName("com.mysql.jdbc.Driver");			//window
			
			String url = "jdbc:mysql://localhost:3306/bairbnb";
			//String url = "jdbc:mysql://localhost:3306/bairbnb?useUnicode=true&characterEncoding=utf8"; //순선
			String user = "root";
			
//			String password = "1234";						//주현,순선,이랑
			//String password = "cnzk0531";					//혜윤
			String password = "atempause26"; 				//성민
			con = DriverManager.getConnection(url, user, password);
		} catch (ClassNotFoundException e) {
			System.out.println("1번 에러>> 드라이버 없음");
		} catch (SQLException e) {
			System.out.println("2-4번 에러>> DB 관련된 처리 에러발생");
		}
	}

	// 댓글 입력 create(bag)
	public void create(ReplyDTO bag) throws Exception {
		String sql = "insert into reply values (null, ?, ?, now(), ?)";
		// replyid, boardid, writer, date, comment
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, bag.getBoardid());
		ps.setString(2, bag.getWriter());
		ps.setString(3, bag.getComment());
		ps.executeUpdate();
	} // end of create

	// 댓글 삭제 delete(bag)
	public void delete(ReplyDTO bag) throws Exception {
		String sql = "delete from reply where replyid = ?";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, bag.getReplyid());
		ps.executeUpdate();
	} // end of delete;

	// 댓글 개수 가져오기 readReplyCount(boardid)
	public ReplyDTO readReplyCount(String boardid) throws Exception {
		ReplyDTO bag = new ReplyDTO();
		String sql = "select count(replyid) from reply where boardid = ?";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, boardid);
		ResultSet rs = ps.executeQuery();
		while (rs.next()) {
			bag.setReplyCount(rs.getString("count(replyid)"));
		}
		return bag;
	} // end of readReplyCount

	// 특정 boardid의 댓글 전체 보기 readList(boardid)
	public ArrayList<ReplyDTO> readList(int boardid) throws Exception {
		ArrayList<ReplyDTO> list = new ArrayList<ReplyDTO>();
		String sql = "select * from reply where boardid = ?";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setInt(1, boardid);
		ResultSet rs = ps.executeQuery();
		while (rs.next()) {
			ReplyDTO bag = new ReplyDTO();
			bag.setReplyid(rs.getString("replyid"));
			bag.setWriter(rs.getString("writer"));
			bag.setDate(rs.getString("date"));
			bag.setComment(rs.getString("comment"));
			list.add(bag);
		}
		return list;
	} // end of readList
} // class
