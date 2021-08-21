// Updated 2021.08.09 오전 10:20

package cart;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class CartDAO {
	Connection con;

	public CartDAO() {

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
			System.out.println("2. BAIRBNB db연결 성공!!!");
		} catch (ClassNotFoundException e) {
			System.out.println("1번에러>> 드라이버없음");
		} catch (SQLException e) {
			System.out.println("2~4번에러>> DB관련 에러");
		}

	}

	public int cartCreate(CartDTO cart) {
		int result = 0;
		try {

			// 3. sql문을 만든다.
			String sql = "insert into cart values (null, ?, ?, ?, ?, ?)";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, cart.getMemid());
			ps.setInt(2, cart.getProid());
			ps.setString(3, cart.getCcheckin());
			ps.setString(4, cart.getCcheckout());
			ps.setInt(5, cart.getCartprice());
			System.out.println("3. sql문 생성 성공!!!");

			// 4. sql문을 mysql로 전송한다.
			result = ps.executeUpdate();
			System.out.println("4. sql문 전송 전송");
			System.out.println(result); // 확인용
		} catch (SQLException e) {
			System.out.println("2~4번에러>> DB관련 에러");
		}
		return result;
	}

	// 전체검색
	public ArrayList<CartDTO> cartRead(String memid) {

		ArrayList<CartDTO> result = new ArrayList<CartDTO>();

		try {
			// 3. sql문을 만든다.
			String sql = "select * from cart where memid = ? order by ccheckin asc";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, memid);
			System.out.println("3. SQL문 생성 완료");

			// 4. sql문을 mysql로 전송한다.
			ResultSet rs = ps.executeQuery();
			System.out.println("4. sql문 전송 전송");

			while (rs.next()) {
				result.add(new CartDTO(rs.getInt("cartidx"), rs.getString("memid"), rs.getInt("proid"), 
						rs.getString("ccheckin"), rs.getString("ccheckout"),rs.getInt("cartprice")));
				System.out.println("read완료");
			}

		} catch (SQLException e) {
			System.out.println("2~4번에러>> DB관련 에러");
		}

		return result;
	}

	// cartidx로 검색
	public CartDTO cartRead(int cartidx) {

		CartDTO result = null;

		try {
			// 3. sql문을 만든다.
			String sql = "select * from cart where cartidx = ?";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setInt(1, cartidx);
			System.out.println("3. SQL문 생성 완료");

			// 4. sql문을 mysql로 전송한다.
			ResultSet rs = ps.executeQuery();
			System.out.println("4. sql문 전송");

			if (rs.next()) {
				result = new CartDTO(rs.getInt("cartidx"), rs.getString("memid"), rs.getInt("proid"), 
						rs.getString("ccheckin"), rs.getString("ccheckout"),rs.getInt("cartprice"));
				System.out.println("read완료");
			}

		} catch (SQLException e) {
			System.out.println("2~4번에러>> DB관련 에러");
		}

		return result;

	}

	public int cartUpdate(CartDTO cart) {
		int result = 0;
		try {
			// 3. sql문을 만든다.
			String sql = "update cart set ccheckin = ?, ccheckout = ?, cartprice = ? where cartidx = ?";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, cart.getCcheckin());
			ps.setString(2, cart.getCcheckout());
			ps.setInt(3, cart.getCartprice());
			ps.setInt(4, cart.getCartidx());
			System.out.println("3. sql문 생성 성공!!!");

			// 4. sql문을 mysql로 전송한다.
			result = ps.executeUpdate();
			System.out.println("4. sql문 전송 전송");
			System.out.println(result); // 확인용
		} catch (SQLException e) {
			System.out.println("2~4번에러>> DB관련 에러");
		}
		return result;
	}

	// 장바구니 내 카트 선택 삭제
	public int cartDelete(int cartidx) {
		int result = 0;
		try {
			// 3. sql문을 만든다.
			String sql = "delete from cart where cartidx = ?";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setInt(1, cartidx);
			System.out.println("3. SQL문 생성 완료");

			// 4. sql문을 mysql로 전송한다.
			result = ps.executeUpdate();
			System.out.println("4. sql문 전송 전송");

		} catch (SQLException e) {
			System.out.println("2~4번에러>> DB관련 에러");
		}
		return result;
	}

}
