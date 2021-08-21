//Updated 2021.08.09 오전 10:20

package product;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class ProDAO {

   Connection con; // 전역변수, 클래스 아래에 선언한 변수, 클래스
   // 전체에서 접근하여 사용가능한 변수, 자동초기화(=null;)

   public ProDAO() {
//생성자 메서드, 생성자(constructor)
//new키워드로 객체 생성 할때, 클래스 이름과 동일한 메서드가 있으면 자동 호출되는 메서드
//객체생성시 자동으로 꼭 해야하는 작업이 있는 경우, 이 생성자 안에 넣어놓으면 무조건 
//처리하게 할수있다.

      try {
         Class.forName("com.mysql.cj.jdbc.Driver");   //mac
         //Class.forName("com.mysql.jdbc.Driver");         //window
         
         String url = "jdbc:mysql://localhost:3306/bairbnb";
         //String url = "jdbc:mysql://localhost:3306/bairbnb?useUnicode=true&characterEncoding=utf8"; //순선
         String user = "root";
         
         //String password = "1234";                  //주현,순선,이랑
         //String password = "cnzk0531";               //혜윤
         String password = "atempause26";             //성민
         con = DriverManager.getConnection(url, user, password);
         System.out.println("2. bairbnb db연결 성공!!!");
      } catch (ClassNotFoundException e) {
         e.printStackTrace();
      } catch (SQLException e) {
         e.printStackTrace();
      }

   }

   public void create(ProDTO bag) {

      System.out.println("전달된 판매자아이디는 " + bag.getMemid());
      System.out.println("전달된 방이름는 " + bag.getPronam());
      System.out.println("전달된 방주소는 " + bag.getProadd());
      System.out.println("전달된 전화번호는 " + bag.getProtel());
      System.out.println("전달된 주차가능여부는 " + bag.getPropk());
      System.out.println("전달된 와이파이유무는 " + bag.getProwifi());
      System.out.println("전달된 애완동물 가능여부는 " + bag.getPropet());
      System.out.println("전달된 조식제공여부는 " + bag.getProbk());
      System.out.println("전달된 가격은 " + bag.getProprice());

      try {

         // 3. sql문을 만든다.
         String sql = "insert into product values (null, ?, ?, ?, ?, ?, ?, ?, ?, ?, null)";
         PreparedStatement ps = con.prepareStatement(sql);
         ps.setString(1, bag.getMemid());
         ps.setString(2, bag.getPronam());
         ps.setString(3, bag.getProadd());
         ps.setString(4, bag.getProtel());
         ps.setString(5, bag.getPropk());
         ps.setString(6, bag.getProwifi());
         ps.setString(7, bag.getPropet());
         ps.setString(8, bag.getProbk());
         ps.setInt(9, bag.getProprice());
         System.out.println("3. sql문 생성 성공!!!");

         // 4. sql문을 mysql로 전송한다.
         int result = ps.executeUpdate();
         System.out.println("4. sql문 전송 전송");
         System.out.println(result);
      } catch (SQLException e) { // 2-4단계
         System.out.println("2-4번 에러>> DB관련된 처리하다 에러발생함..!!!!");
      }

   }

   // 하나의 이름으로 메서드이름을 쓸 수 있다.
   // 입력값의 형태가 다양한 형태이어야 한다.
   // 다형성(오버로딩)

   public ProDTO read(ProDTO bag) { // 매서드 안에서 만들어진 변수임.
      // 변수는 "타입 변수명;"만들어 짐.(선언!)
      // 선언의 위치가 변수의 생존범위를 결정함.
      // 파라메터는 지역변수이다. 이 지역을 벗어나서는 사용불가능.
      // 지역변수는 자동초기화x, 쓰레기값 들어있는 상태!
      System.out.println("전달된 상품번호는 " + bag.getProid());
      System.out.println("전달된 판매자아이디는 " + bag.getMemid());
      System.out.println("전달된 방이름는 " + bag.getPronam());
      System.out.println("전달된 방주소는 " + bag.getProadd());
      System.out.println("전달된 전화번호는 " + bag.getProtel());
      System.out.println("전달된 주차가능여부는 " + bag.getPropk());
      System.out.println("전달된 와이파이여부는 " + bag.getProwifi());
      System.out.println("전달된 애완동물가능여부는 " + bag.getPropet());
      System.out.println("전달된 조식제공여부는 " + bag.getProbk());
      System.out.println("전달된 가격은 " + bag.getProprice());
      System.out.println("전달된 사진은 " + bag.getProimg());
      ProDTO bag2 = new ProDTO();
      ResultSet rs = null;

      // int result = 0; //메서드 안에서 선언된 변수는 모두 지역 벽순
      // 지역변수는 초기화를 해주어야 한다.
      try {
         // 3. sql문을 만든다.
         String sql = "select * from product where proid = ? ";
         PreparedStatement ps = con.prepareStatement(sql);
         ps.setInt(1, bag.getProid());
         System.out.println("3. sql문 생성 성공!!!");

         // 4. sql문을 mysql로 전송한다.
         // result = ps.executeUpdate(); //crud일때만 사용
         rs = ps.executeQuery();
         System.out.println("4. sql문 전송 전송");
//               System.out.println("검색결과는: " + rs.next());
         if (rs.next()) {
            System.out.println("검색결과가 있음.");

            int proid = rs.getInt("proid");
            String memid = rs.getString("memid");
            String pronam = rs.getString("pronam");
            String proadd = rs.getString("proadd");
            String protel = rs.getString("protel");
            String propk = rs.getString("propk");
            String prowifi = rs.getString("prowifi");
            String propet = rs.getString("propet");
            String probk = rs.getString("probk");
            int proprice = rs.getInt("proprice");
            String proimg = rs.getString("proimg");

            System.out.println(proid + " " + memid + " " + pronam + " " + proadd + " " + protel + " " + propk + " "
                  + prowifi + " " + propet + " " + probk + " " + proprice + " " + proimg + " ");
            bag2.setProid(proid);
            bag2.setMemid(memid);
            bag2.setPronam(pronam);
            bag2.setProadd(proadd);
            bag2.setProtel(protel);
            bag2.setPropk(propk);
            bag2.setProwifi(prowifi);
            bag2.setPropet(propet);
            bag2.setProbk(probk);
            bag2.setProprice(proprice);
            bag2.setProimg(proimg);

         } else {
            System.out.println("검색결과가 없음.");
         }
      } catch (SQLException e) { // 2-4단계
         System.out.println("2-4번 에러>> DB관련된 처리하다 에러발생함..!!!!");
         e.printStackTrace();
      }
      return bag2;

   }

   public ProDTO read3(ProDTO bag) { // 매서드 안에서 만들어진 변수임.
      // 변수는 "타입 변수명;"만들어 짐.(선언!)
      // 선언의 위치가 변수의 생존범위를 결정함.
      // 파라메터는 지역변수이다. 이 지역을 벗어나서는 사용불가능.
      // 지역변수는 자동초기화x, 쓰레기값 들어있는 상태!
      System.out.println("전달된 상품번호는 " + bag.getProid());

      ProDTO bag2 = new ProDTO();
      ResultSet rs = null;

      // int result = 0; //메서드 안에서 선언된 변수는 모두 지역 벽순
      // 지역변수는 초기화를 해주어야 한다.
      try {
         // 3. sql문을 만든다.
         String sql = "select * from product where proid = ? ";
         PreparedStatement ps = con.prepareStatement(sql);
         ps.setInt(1, bag.getProid());
         System.out.println("3. sql문 생성 성공!!!");

         // 4. sql문을 mysql로 전송한다.
         // result = ps.executeUpdate(); //crud일때만 사용
         rs = ps.executeQuery();
         System.out.println("4. sql문 전송 전송");
//               System.out.println("검색결과는: " + rs.next());
         if (rs.next()) {
            System.out.println("검색결과가 있음.");

            int proid = rs.getInt("proid");
            String memid = rs.getString("memid");
            String pronam = rs.getString("pronam");
            String proadd = rs.getString("proadd");
            String protel = rs.getString("protel");
            String propk = rs.getString("propk");
            String prowifi = rs.getString("prowifi");
            String propet = rs.getString("propet");
            String probk = rs.getString("probk");
            int proprice = rs.getInt("proprice");
            String proimg = rs.getString("proimg");

            System.out.println(proid + " " + memid + " " + pronam + " " + proadd + " " + protel + " " + propk + " "
                  + prowifi + " " + propet + " " + probk + " " + proprice + " " + proimg + " ");
            bag2.setProid(proid);
            bag2.setMemid(memid);
            bag2.setPronam(pronam);
            bag2.setProadd(proadd);
            bag2.setProtel(protel);
            bag2.setPropk(propk);
            bag2.setProwifi(prowifi);
            bag2.setPropet(propet);
            bag2.setProbk(probk);
            bag2.setProprice(proprice);
            bag2.setProimg(proimg);

         } else {
            System.out.println("검색결과가 없음.");
         }
      } catch (SQLException e) { // 2-4단계
         System.out.println("2-4번 에러>> DB관련된 처리하다 에러발생함..!!!!");
         e.printStackTrace();
      }
      return bag2;

   }

   public ProDTO read(int proid) { // 매서드 안에서 만들어진 변수임.

      ProDTO bag = new ProDTO();
      ResultSet rs = null;

      // int result = 0; //메서드 안에서 선언된 변수는 모두 지역 벽순
      // 지역변수는 초기화를 해주어야 한다.
      try {
         // 3. sql문을 만든다.
         String sql = "select * from product where proid = ? ";
         PreparedStatement ps = con.prepareStatement(sql);
         ps.setInt(1, proid);
         System.out.println("3. sql문 생성 성공!!!");

         // 4. sql문을 mysql로 전송한다.
         // result = ps.executeUpdate(); //crud일때만 사용
         rs = ps.executeQuery();
         System.out.println("4. sql문 전송 전송");
//                     System.out.println("검색결과는: " + rs.next());
         if (rs.next()) {
            // System.out.println("검색결과가 있음.");

            bag.setProid(proid);
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

         } else {
            System.out.println("검색결과가 없음.");
         }
      } catch (SQLException e) { // 2-4단계
         System.out.println("2-4번 에러>> DB관련된 처리하다 에러발생함..!!!!");
         e.printStackTrace();
      }
      return bag;

   }

   public ArrayList<ProDTO> read(String memid) { // 매서드 안에서 만들어진 변수임.

      ArrayList<ProDTO> list = new ArrayList<ProDTO>();
      ResultSet rs = null;
      // int result = 0; //메서드 안에서 선언된 변수는 모두 지역 벽순
      // 지역변수는 초기화를 해주어야 한다.
      try {
         // 3. sql문을 만든다.
         String sql = "select * from product where memid = ? ";
         PreparedStatement ps = con.prepareStatement(sql);
         ps.setString(1, memid);
         System.out.println("3. sql문 생성 성공!!!");

         // 4. sql문을 mysql로 전송한다.
         // result = ps.executeUpdate(); //crud일때만 사용
         rs = ps.executeQuery();
         System.out.println("4. sql문 전송 전송");
         while(rs.next()) {
            // System.out.println("검색결과가 있음.");
            ProDTO bag = new ProDTO();
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
            list.add(bag);

         } 
      } catch (SQLException e) { // 2-4단계
         System.out.println("2-4번 에러>> DB관련된 처리하다 에러발생함..!!!!");
         e.printStackTrace();
      }
      return list;
   }

   public ArrayList<ProDTO> read() {

      ArrayList<ProDTO> list = new ArrayList<ProDTO>();

      ResultSet rs = null;
      // int result = 0; //메서드 안에서 선언된 변수는 모두 지역 벽순
      // 지역변수는 초기화를 해주어야 한다.
      try {
         // 3. sql문을 만든다.
         String sql = "select * from product  ";
         PreparedStatement ps = con.prepareStatement(sql);
         System.out.println("3. sql문 생성 성공!!!");

         // 4. sql문을 mysql로 전송한다.
         // result = ps.executeUpdate(); //cud일때만 사용
         rs = ps.executeQuery();
         System.out.println("4. sql문 전송 전송");
         // System.out.println("검색결과는: " + rs.next());
         while (rs.next()) {
            ProDTO bag2 = new ProDTO();
            System.out.println("검색결과가 있음.");

            int proid = rs.getInt("proid");
            String memid = rs.getString("memid");
            String pronam = rs.getString("pronam");
            String proadd = rs.getString("proadd");
            String protel = rs.getString("protel");
            String propk = rs.getString("propk");
            String prowifi = rs.getString("prowifi");
            String propet = rs.getString("propet");
            String probk = rs.getString("probk");
            int proprice = rs.getInt("proprice");
            String proimg = rs.getString("proimg");

            System.out.println(proid + " " + memid + " " + pronam + " " + proadd + " " + protel + " " + propk + " "
                  + prowifi + " " + propet + " " + probk + " " + proprice + " " + proimg + " ");

            bag2.setProid(proid);
            bag2.setMemid(memid);
            bag2.setPronam(pronam);
            bag2.setProadd(proadd);
            bag2.setProtel(protel);
            bag2.setPropk(propk);
            bag2.setProwifi(prowifi);
            bag2.setPropet(propet);
            bag2.setProbk(probk);
            bag2.setProprice(proprice);
            bag2.setProimg(proimg);

            System.out.println(bag2);

            list.add(bag2);

         }
      } catch (SQLException e) { // 2-4단계
         System.out.println("2-4번 에러>> DB관련된 처리하다 에러발생함..!!!!");
         e.printStackTrace();
      }
      return list;

   }

   public int update(ProDTO bag) {

      System.out.println("전달된 proid는 " + bag.getProid());
      System.out.println("전달된 memid는 " + bag.getMemid());
      System.out.println("전달된 pronam는 " + bag.getPronam());
      System.out.println("전달된 proadd는 " + bag.getProadd());
      System.out.println("전달된 protel는 " + bag.getProtel());
      System.out.println("전달된 propk는 " + bag.getPropk());
      System.out.println("전달된 prowifi는 " + bag.getProwifi());
      System.out.println("전달된 propet는 " + bag.getPropet());
      System.out.println("전달된 probk는 " + bag.getProbk());
      System.out.println("전달된 proprice는 " + bag.getProprice());
      System.out.println("전달된 proimg는 " + bag.getProimg());

      int result = 0;
      try {

         // 3. sql문을 만든다.
         String sql = "update product set memid = ?, pronam =? , proadd = ?, protel = ?, propk = ?, prowifi = ?, propet = ?, probk = ?, proprice = ?, proimg = ? where proid=? ";
         PreparedStatement ps = con.prepareStatement(sql);

         ps.setString(1, bag.getMemid());
         ps.setString(2, bag.getPronam());
         ps.setString(3, bag.getProadd());
         ps.setString(4, bag.getProtel());
         ps.setString(5, bag.getPropk());
         ps.setString(6, bag.getProwifi());
         ps.setString(7, bag.getPropet());
         ps.setString(8, bag.getProbk());
         ps.setInt(9, bag.getProprice());
         ps.setString(10, bag.getProimg());
         ps.setInt(11, bag.getProid());
         System.out.println("3. sql문 생성 성공!!!");

         // 4. sql문을 mysql로 전송한다.
         result = ps.executeUpdate();
         System.out.println("4. sql문 전송 전송");
         System.out.println(result);
      }

      catch (SQLException e) { // 2-4단계
         System.out.println("2-4번 에러>> DB관련된 처리하다 에러발생함..!!!!");
         e.printStackTrace();
      }

      return result;
   }

   public int delete(ProDTO bag) {
      // 매서드 안에서 만들어진 변수임.
      // 변수는 "타입 변수명;"만들어 짐.(선언!)
      // 선언의 위치가 변수의 생존범위를 결정함.
      // 파라메터는 지역변수이다. 이 지역을 벗어나서는 사용불가능.
      // 지역변수는 자동초기화x, 쓰레기값 들어있는 상태!
      System.out.println("전달된 proid는 " + bag.getProid());
      System.out.println("전달된 memid는 " + bag.getMemid());
      System.out.println("전달된 pronam는 " + bag.getPronam());
      System.out.println("전달된 proadd는 " + bag.getProadd());
      System.out.println("전달된 protel는 " + bag.getProtel());
      System.out.println("전달된 propk는 " + bag.getPropk());
      System.out.println("전달된 prowifi는 " + bag.getProwifi());
      System.out.println("전달된 propet는 " + bag.getPropet());
      System.out.println("전달된 probk는 " + bag.getProbk());
      System.out.println("전달된 proprice는 " + bag.getProprice());
      System.out.println("전달된 proimg는 " + bag.getProimg());
      int result = 0;
      try {

         // 3. sql문을 만든다.
         String sql = "delete from product where proid = ?";
         PreparedStatement ps = con.prepareStatement(sql);
         ps.setInt(1, bag.getProid());
         System.out.println("3. sql문 생성 성공!!!");

         // 4. sql문을 mysql로 전송한다.
         result = ps.executeUpdate();
         System.out.println("4. sql문 전송 전송");
         System.out.println(result);
      } catch (SQLException e) { // 2-4단계
         System.out.println("2-4번 에러>> DB관련된 처리하다 에러발생함..!!!!");
      }
      return result;
   }

}