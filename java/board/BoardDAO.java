//Updated 2021.08.09 오전 10:20

package board;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class BoardDAO {

   Connection con;
   
   // db접속 생성자
   public BoardDAO() {
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
      } catch (ClassNotFoundException e) {
         e.printStackTrace();
      } catch (SQLException e) {
         e.printStackTrace();
      }
   }

   // 게시물 입력 create(bag)
   public void create(BoardDTO bag) throws Exception {
      String sql = "insert into board values (null, ?, ?, ?,now(), ?, 0)";
      // boardid, title, content, date, writer, ctgry, views
      PreparedStatement ps = con.prepareStatement(sql);
      ps.setString(1, bag.getTitle());
      ps.setString(2, bag.getContent());
      ps.setString(4, bag.getWriter());
      ps.setString(3, bag.getCtgry());
      ps.executeUpdate();
   } // end of create

   // 게시물 수정 update(bag)
   public void update(BoardDTO bag) throws Exception {
      String sql = "update board set title = ?, content = ? where boardid = ?";
      PreparedStatement ps = con.prepareStatement(sql);
      ps.setString(1, bag.getTitle());
      ps.setString(2, bag.getContent());
      ps.setString(3, bag.getBoardid());
      ps.executeUpdate();
   }

   // 조회수 올리기 updateViews(boardid)
   public void updateViews(int boardid) throws Exception {
      String sql = "update board set views = views + 1 where boardid = ?";
      PreparedStatement ps = con.prepareStatement(sql);
      ps.setInt(1, boardid);
      ps.executeUpdate();
   }

   // 게시물 삭제 delete(bag)
   public void delete(BoardDTO bag) throws Exception {
      String sql = "delete from board where boardid = ?";
      PreparedStatement ps = con.prepareStatement(sql);
      ps.setString(1, bag.getBoardid());
      ps.executeUpdate();
   }
   
   // 게시글 전체 목록 (내림차순 5개 페이징) readList(startR, limit)
   public ArrayList<BoardDTO> readList(int startR, int LIMIT) throws Exception{
      ArrayList<BoardDTO> list = new ArrayList<BoardDTO>();
      String sql = "select * from board order by boardid desc limit ?, ?";
      PreparedStatement ps = con.prepareStatement(sql);
      ps.setInt(1, startR);
      ps.setInt(2, LIMIT);
      ResultSet rs = ps.executeQuery();
      while (rs.next()) {
         BoardDTO bag = new BoardDTO();
         bag.setBoardid(rs.getString("boardid"));
         bag.setTitle(rs.getString("title"));
         bag.setContent(rs.getString("content"));
         bag.setDate(rs.getString("date"));
         bag.setWriter(rs.getString("writer"));
         bag.setCtgry(rs.getString("ctgry"));
         bag.setViews(rs.getInt("views"));
         list.add(bag);
      }
      return list;
   }
   
   // 게시글 전체 목록 readList(ctgry)
   public ArrayList<BoardDTO> readList(String ctgry) throws Exception {
      ArrayList<BoardDTO> list = new ArrayList<BoardDTO>();
      String sql = "select * from board where ctgry = ? order by boardid desc";
      PreparedStatement ps = con.prepareStatement(sql);
      ps.setString(1, ctgry);
      ResultSet rs = ps.executeQuery();
      while (rs.next()) {
         BoardDTO bag = new BoardDTO();
         bag.setBoardid(rs.getString("boardid"));
         bag.setTitle(rs.getString("title"));
         bag.setContent(rs.getString("content"));
         bag.setDate(rs.getString("date"));
         bag.setWriter(rs.getString("writer"));
         bag.setCtgry(rs.getString("ctgry"));
         bag.setViews(rs.getInt("views"));
         list.add(bag);
      }
      return list;
   }

   // 게시글 상세 보기 readList(boardid)
   public BoardDTO readList(int boardid) throws Exception {
      BoardDTO bag = new BoardDTO();
      String sql = "select * from board where boardid = ?";
      PreparedStatement ps = con.prepareStatement(sql);
      ps.setInt(1, boardid);
      ResultSet rs = ps.executeQuery();
      while (rs.next()) {
         bag.setBoardid(rs.getString("boardid"));
         bag.setTitle(rs.getString("title"));
         bag.setContent(rs.getString("content"));
         bag.setDate(rs.getString("date"));
         bag.setWriter(rs.getString("writer"));
         bag.setCtgry(rs.getString("Ctgry"));
         bag.setViews(rs.getInt("views"));
      }
      return bag;
   }

   // 최근 게시물 3개 readTitles
   public ArrayList<BoardDTO> readRecentTitles() throws Exception {
      String sql = "select boardid, title from board order by boardid desc limit 3";
      PreparedStatement ps = con.prepareStatement(sql);
      ResultSet rs = ps.executeQuery();
      ArrayList<BoardDTO> list = new ArrayList<BoardDTO>();
      while (rs.next()) {
         BoardDTO bag = new BoardDTO();
         bag.setBoardid(rs.getString("boardid"));
         bag.setTitle(rs.getString("title"));
         list.add(bag);
      }
      return list;
      // list.size() = 3
      // list(i) = bag [boardid, title]
   }

   // 총 회원수 갯수 가져오기 readMemCount()
   public BoardDTO readMemCount() throws Exception {
      BoardDTO bag = new BoardDTO();
      String sql = "select count(memid) from member";
      PreparedStatement ps = con.prepareStatement(sql);
      ResultSet rs = ps.executeQuery();
      while (rs.next()) {
         bag.setMemCount(rs.getString("count(memid)"));
      }
      return bag;
   }

   // 총 숙소 갯수 가져오기 readProCount()
   public BoardDTO readProCount() throws Exception {
      BoardDTO bag = new BoardDTO();
      String sql = "select count(proid) from product";
      PreparedStatement ps = con.prepareStatement(sql);
      ResultSet rs = ps.executeQuery();
      while (rs.next()) {
         bag.setProCount(rs.getString("count(proid)"));
      }
      return bag;
   }

   // 총 게시글 갯수 가져오기 readBoardCount()
   public BoardDTO readBoardCount() throws Exception {
      BoardDTO bag = new BoardDTO();
      String sql = "select count(boardid) from board";
      PreparedStatement ps = con.prepareStatement(sql);
      ResultSet rs = ps.executeQuery();
      while (rs.next()) {
         bag.setBoardCount(rs.getString("count(boardid)"));
      }
      return bag;
   }

} // class