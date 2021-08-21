//Updated 2021.08.09 오전 10:20

package search.db;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import search.dto.searchBag;

public class searchDAO {

	Connection con;

	public searchDAO() {

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

			e.printStackTrace();
		} catch (SQLException e) {

			e.printStackTrace();
		}
	}
	
	public ArrayList<searchBag> read(String word) {

		ResultSet rs = null;
		ArrayList<searchBag> bag2 = new ArrayList<searchBag>();

		try {
			
			String sql = "select * from product where pronam like ? or proadd like ? or propk like ? or prowifi like ? or propet like ? or probk like ?";

			PreparedStatement ps = con.prepareStatement(sql);
			String words = "%" + word + "%";
			System.out.println("3. sql문 생성 성공!!!");
			
			ps.setString(1, words);
			ps.setString(2, words);
			ps.setString(3, words);
			ps.setString(4, words);
			ps.setString(5, words);
			ps.setString(6, words);

			System.out.println(ps);
			System.out.println(words);
			System.out.println(word);
			
			rs = ps.executeQuery();
			System.out.println("4. sql문 전송 전송");
			
				while (rs.next()) {

						searchBag bag = new searchBag();
						bag.setProid(rs.getInt("proid"));
						bag.setMemid(rs.getString("memid"));
						bag.setPronam(rs.getString("pronam"));
						bag.setProadd(rs.getString("proadd"));
						bag.setProtel(rs.getString("protel"));
						bag.setPropk(rs.getString("propk"));
						bag.setProwifi(rs.getString("prowifi"));
						bag.setPropet(rs.getString("propet"));
						bag.setProbk(rs.getString("probk"));
						bag.setProprice(rs.getInt("proprice"));
						bag.setProimg(rs.getString("proimg"));

						bag2.add(bag);
						System.out.println(bag);

					}
										

		} catch (SQLException e) { // 2~4단계
			System.out.println("2~4번 에러 >> DB관련된 처리하다 에러발생함");
			e.printStackTrace();

		}
		return bag2;
	}
	

}