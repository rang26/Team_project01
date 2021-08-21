///Updated 2021.08.09 오전 10:20

package rec;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class RecDAO {

	Connection con;
	
	// db접속 생성자
	public RecDAO() {
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
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	// pay 테이블에서 proid 그룹으로 묶어서 각각 몇개인지(count) 내림차순으로 5개 검색하기
	public ArrayList<RecDTO> readRec() throws Exception{
		ArrayList<RecDTO> list = new ArrayList<RecDTO>();
		String sql = "select proid, count(*) from pay group by proid order by count(*) desc limit 5";
		PreparedStatement ps = con.prepareStatement(sql);
		ResultSet rs = ps.executeQuery();
		while (rs.next()) {
			RecDTO bag = new RecDTO();
			bag.setProid(rs.getString("proid"));
			list.add(bag);
		}
		return list;
	}
	
	// proid로 search하기
	public RecDTO readPro(String proid) throws Exception{
		RecDTO bag = new RecDTO();
		String sql = "select proid, pronam, proprice, proimg, proadd from product where proid = ?";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, proid);
		ResultSet rs = ps.executeQuery();
		while (rs.next()) {
			bag.setProid(rs.getString("proid"));
			bag.setPronam(rs.getString("pronam"));
			bag.setProprice(rs.getString("proprice"));
			bag.setProimg(rs.getString("proimg"));
			bag.setProadd(rs.getString("proadd"));
		}
		return bag;
	}
}
