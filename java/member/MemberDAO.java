//Updated 2021.08.09 오전 10:20

package member;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class MemberDAO {

	Connection con;

	public MemberDAO() {

		try {
			Class.forName("com.mysql.cj.jdbc.Driver"); // mac
			// Class.forName("com.mysql.jdbc.Driver"); //window

			String url = "jdbc:mysql://localhost:3306/bairbnb";
			// String url =
			// "jdbc:mysql://localhost:3306/bairbnb?useUnicode=true&characterEncoding=utf8";
			// //순선
			String user = "root";

			// String password = "1234"; //주현,순선,이랑
			// String password = "cnzk0531"; //혜윤
			String password = "atempause26"; // 성민
			con = DriverManager.getConnection(url, user, password);
			System.out.println("2. bairbnb db연결 성공!!!");

		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	public int create(MemberDTO dto) {
		// 회원가입 메서드
		int result = 0;

		try {
			String sql = "insert into member values (?,?,?,?,?)";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, dto.getMemid());
			ps.setString(2, dto.getPw());
			ps.setString(3, dto.getName());
			ps.setString(4, dto.getTel());
			ps.setString(5, dto.getSsn());
			System.out.println("3. sql문 생성 성공!!!");

			result = ps.executeUpdate();
			System.out.println("4. sql문 전송 성공");
			System.out.println(result);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return result;
	}

	public int update(String memid, String[] all) throws Exception {
//      회원정보 수정 메서드
		int result = 0;

		if (!all[0].equals("")) {
			String sql = "update member set pw = ? where memid = ?";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, all[0]);
			ps.setString(2, memid);
			result += ps.executeUpdate();
		}
		if (!all[1].equals("")) {
			String sql = "update member set name = ? where memid = ?";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, all[1]);
			ps.setString(2, memid);
			result += ps.executeUpdate();
		}
		if (!all[2].equals("")) {
			String sql = "update member set tel = ? where memid = ?";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, all[2]);
			ps.setString(2, memid);
			result += ps.executeUpdate();
		}

		System.out.println("3. sql문 생성 성공!!!");
		// 4.sql문을 mysql로 전송한다.
		System.out.println("4. sql문 전송 성공");
		System.out.println(result);
		return result;
	}

	public boolean delete(String memid, String pw) throws Exception {
		boolean result = false;
		String dbpw = ""; //DB에서 읽어 올 pw를 저장 할 변수를 선언하고 초기화.
		
		//비밀번호 조회
		String sql1 = "select pw from member where memid=?";
		//회원 삭제
		// 자동 커밋을 false로 한다.
		//con.setAutoCommit(false);
		PreparedStatement ps = con.prepareStatement(sql1);
		ps.setString(1, memid);
		System.out.println("3. sql문 생성 성공!!!");
		ResultSet rs = ps.executeQuery();
		System.out.println("4. sql문 전송 성공");

		if (rs.next()) {
			//DB의 쿼리문의 결과값으로 가져온 rs에서 password칼럼에 있는 값을 getString을 통해 가져와 dbpw에 저장.
			dbpw = rs.getString("pw");
			String sql2 = "delete from member where memid = ?";
			if (dbpw.equals(pw)) // 입력된 비밀번호와 DB비번 비교
			{
				// 같을경우 회원삭제 진행
				ps = con.prepareStatement(sql2);
				ps.setString(1, memid);
				ps.executeUpdate();
				//con.commit();
				result = true; // 삭제 성공
			} 
		}

		return result;

	}

	public ArrayList read(MemberDTO dto) throws Exception {

		String sql = "select pw, name, tel from member where memid = ?";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, dto.getMemid());
		System.out.println("3. sql문 생성 성공!!!");
		ResultSet rs = ps.executeQuery();
		ArrayList list = new ArrayList();
		if (rs.next()) {
			String pw = rs.getString(1);
			String name = rs.getString(2);
			String tel = rs.getString(3);
			list.add(pw);
			list.add(name);
			list.add(tel);
		}
		System.out.println("4. sql문 전송 전송");
		return list;
	}

	public int read2(MemberDTO dto) {

		String dbpw = "";// db에서 꺼낸 비밀번호 담을 변수
		int result = -1;

		try {
			String sql = "select pw from member where memid = ?";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, dto.getMemid());
			System.out.println("3. sql문 생성 성공!!!");
			ResultSet rs = ps.executeQuery();
			System.out.println("4. sql문 전송 성공");

			if (rs.next()) {
				dbpw = rs.getString("pw");

				if (dbpw.equals(dto.getPw()))
					result = 1; // 넘겨받은 비번과 꺼내온 배번 비교. 같으면 인증성공
				else
					result = 0; // DB의 비밀번호와 입력받은 비밀번호 다름, 인증실패
			} else {
				result = -1; // 해당 아이디가 없을 경우
			}

			return result;

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return result;
	}

	// 아이디 중복 확인
	public int read3(String memid) {// 3
		int result = 0;

		try {
			String sql = "select * from member where memid = ?";

			PreparedStatement ps = con.prepareStatement(sql);// java.sql
			ps.setString(1, memid);

			System.out.println("3.sql문 생성 성공");
			ResultSet rs = ps.executeQuery(); // ★얘만다름
			System.out.println("4.sql문 전송 성공");

			if (rs.next()) {
				result = 1;
			} else {
				result = 0;
			}
			System.out.println("아이디 중복체크결과 : " + result);

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return result;

	}// read3 end

	public MemberDTO read(String memid) {
		MemberDTO result = null;
		try {
			// 3. sql문을 만든다.
			String sql = "select pw, name, tel from member where memid = ?";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, memid);
			System.out.println("3. SQL문 생성 완료");

			// 4. sql문을 mysql로 전송한다.
			ResultSet rs = ps.executeQuery();
			System.out.println("4. sql문 전송");

			if (rs.next()) {
				result = new MemberDTO();
				result.setPw(rs.getString(1));
				result.setName(rs.getString(2));
				result.setTel(rs.getString(3));
				System.out.println("read완료");
			}

		} catch (SQLException e) {
			System.out.println("2~4번에러>> DB관련 에러");
		}

		return result;

	}

}// class