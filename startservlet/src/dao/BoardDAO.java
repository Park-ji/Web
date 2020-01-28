package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import vo.BoardVO;
import vo.MemberVO;

public class BoardDAO {
	//게시물 리스트 조회 기능(1개의 게시물 = BoardVO)
	//= board 테이블 레코드들 조회 기능
	//BoardVO타입으로 배열을 만들면? 여러 레코드들을 의미
	//하지만, 배열일때는 길이를 동적으로 사용하기 어려움
	//따라서 ArrayList로 사용
	public ArrayList<BoardVO> getBoardList(){ //전체 게시물 조회
//		ResultSet를 리턴타입으로 주면? x 
//		이유?
//		rs는 oracle 조회결과를 메모리내부에 저장해놓고 저장한 영역을 가르키고 있는 것
//		connection이 close가 되면 oracle과의 연결고리도 x = rs사용 x
//		그렇다면 close안하면? connection을 계속 소모
		ArrayList<BoardVO> list = new ArrayList<BoardVO>();
		//구현
		try {
		Class.forName("oracle.jdbc.driver.OracleDriver");
		Connection con = DriverManager.getConnection("jdbc:oracle:thin:@127.0.0.1:1521:xe","hr","hr");
		String sql = "select * from board order by idx";
		PreparedStatement pt = con.prepareStatement(sql);
		ResultSet rs =  pt.executeQuery();
		while(rs.next()) {//한개의 행마다
			BoardVO vo 
			= new BoardVO(rs.getInt("idx"),rs.getString("head"), rs.getString("ctx"),rs.getString("mem"), rs.getString("time"),
					rs.getInt("b_pwd"),rs.getInt("hit"));
//			vo.setSeq(rs.getInt("idx")); 
//			vo.setTitle(rs.getString("head"));
//			vo.setWriter(rs.getString("mem"));
//			vo.setViewcount(rs.getInt("hit"));
			list.add(vo);
		}
		rs.close();
		pt.close();
		con.close();
		}catch(Exception e) {
			e.printStackTrace();
		}
//		System.out.println("갯수는? "+list.size());
		return list;
	}
//	//어느파일에서 에러가 발생했는지 확인하기 : 앞으로 Servlet, jsp, DAO, VO...등 많은 파일들이 생기니깐 각각을 확인해주는 것이 좋음
//	public static void main(String[] args) {
//		new BoardDAO().getBoardList(); //에러 확인해보기 = 잘 동작하는지 확인 => 후에는 주석처리 or 삭제
//	}
	
	public ArrayList<BoardVO> getBoardList(int currentpage, int recordPerPage){ 
		//해당페이지의 해당갯수만큼 게시물 조회 - 페이징 처리 게시물리스트 조회
		ArrayList<BoardVO> list = new ArrayList<BoardVO>();
		try {
		Class.forName("oracle.jdbc.driver.OracleDriver");
		Connection con = DriverManager.getConnection("jdbc:oracle:thin:@127.0.0.1:1521:xe","hr","hr");
		String sql 
		//sql길어질때 공백 넣어주는 것 주의! 또한, 마지막에 ';'없는 거 주의!
		= "select r, idx, head, mem, hit "
		+ "from(select rownum r, idx, head, mem, hit from(select * from board order by time desc)) "
		+ "where r>=? and r<=?";		
		PreparedStatement pt = con.prepareStatement(sql);
		int start = 1 + ((currentpage-1) * recordPerPage);
		int end = currentpage * recordPerPage;
		pt.setInt(1,start);
		pt.setInt(2,end);
		ResultSet rs =  pt.executeQuery();
		while(rs.next()) {
			BoardVO vo = new BoardVO();
			vo.setSeq(rs.getInt("idx"));
			vo.setTitle(rs.getString("head"));
			vo.setWriter(rs.getString("mem"));
			vo.setViewcount(rs.getInt("hit"));
			list.add(vo);
		}
		rs.close();
		pt.close();
		con.close();
		}catch(Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
	public ArrayList<BoardVO> getBoardList(String item, String searchword){ 
		ArrayList<BoardVO> list = new ArrayList<BoardVO>();
		//item : 모두, 제목, 내용, 작성자, 조회수(searchword보다 이상)
		String check = "";
		if(item.equals("모두")) { 
		check = "(head like \'%" + searchword+"%\') or (mem like \'%" + searchword+"%\') or (ctx like \'%" + searchword+"%\')";
		}
		else if(item.equals("제목")) check = "head like \'%"+searchword+"%\'";
		else if(item.equals("내용")) check = "ctx like \'%"+searchword+"%\'";
		else if(item.equals("작성자")) check = "mem like \'%"+searchword+"%\'";
		else if(item.equals("조회수")) {
			int curhit = Integer.parseInt(searchword);
			check = "hit >="+curhit;
		}
		
		try {
		Class.forName("oracle.jdbc.driver.OracleDriver");
		Connection con = DriverManager.getConnection("jdbc:oracle:thin:@127.0.0.1:1521:xe","hr","hr");
		String sql ="select * from board where "+check;	
		
		PreparedStatement pt = con.prepareStatement(sql);
		//pt.setInt(1,start);
		//pt.setInt(2,end);
		ResultSet rs =  pt.executeQuery();
		while(rs.next()) {
			BoardVO vo = new BoardVO();
			vo.setSeq(rs.getInt("idx"));
			vo.setTitle(rs.getString("head"));
			vo.setWriter(rs.getString("mem"));
			vo.setViewcount(rs.getInt("hit"));
			list.add(vo);
		}
		rs.close();
		pt.close();
		con.close();
		}catch(Exception e) {
			e.printStackTrace();
		}
//		System.out.println("갯수는? "+list.size());
		return list;
	}
//	public static void main(String[] args) {
//	new BoardDAO().getBoardList("제목","추"); //에러 확인해보기 = 잘 동작하는지 확인 => 후에는 주석처리 or 삭제
//}
	
	public BoardVO getBoardDetail(int seq) {
		BoardVO vo = null;
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			Connection con = DriverManager.getConnection("jdbc:oracle:thin:@127.0.0.1:1521:xe","hr","hr");
			//조회수 증가 1
			String updateSQL = "update board set hit=hit+1 where idx=?";
			PreparedStatement pt = con.prepareStatement(updateSQL);
			pt.setString(1, String.valueOf(seq));
			int cnt = pt.executeUpdate();
			if(cnt==1) {
			String selectSQL = "select * from board where idx = ?";
			pt = con.prepareStatement(selectSQL);
			pt.setString(1, String.valueOf(seq));
			ResultSet rs =  pt.executeQuery();
			if(rs.next()) {//한개의 행마다
				vo = new BoardVO(rs.getInt("idx"),rs.getString("head"), rs.getString("ctx"),rs.getString("mem"), rs.getString("time"),
						rs.getInt("b_pwd"),rs.getInt("hit"));
			}
			rs.close();
			}
			pt.close();
			con.close();
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		return vo;
	}
	
	public int updateBoard(int seq, String title, String contents, String writer) {
		int ans =0;
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			Connection con = DriverManager.getConnection("jdbc:oracle:thin:@127.0.0.1:1521:xe","hr","hr");
			String sql = "update board set head=?, ctx=?, mem=? where idx=? ";
			PreparedStatement pt = con.prepareStatement(sql);
			pt.setString(1, title);
			pt.setString(2, contents);
			pt.setString(3, writer);
			pt.setString(4, String.valueOf(seq));
			int rs =  pt.executeUpdate();
			ans = rs;
			if(rs==1) {
				System.out.println("update 성공");
			}
			pt.close();
			con.close();
		}catch(Exception e) {
			e.printStackTrace();
		}
		return ans;
	}
	
	public int deleteBoard(int seq) {
		int ans=0;
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			Connection con = DriverManager.getConnection("jdbc:oracle:thin:@127.0.0.1:1521:xe","hr","hr");
			String sql = "delete from board where idx=? ";
			PreparedStatement pt = con.prepareStatement(sql);
			pt.setString(1, String.valueOf(seq));
			int rs =  pt.executeUpdate();
			ans = rs;
			if(rs==1) {
				System.out.println("delete 성공");
			}
			pt.close();
			con.close();
		}catch(Exception e) {
			e.printStackTrace();
		}
		return ans;
	}
	
	public int insertBoard(BoardVO vo) {
		int ans=0;
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			Connection con = DriverManager.getConnection("jdbc:oracle:thin:@127.0.0.1:1521:xe","hr","hr");
			//작성자 검사 : member 테이블 존재 userid 참조
			MemberDAO dao = new MemberDAO();
			MemberVO membervo = new MemberVO();
			membervo.setId(vo.getWriter());
			int result = dao.inMember(membervo); //1이면 member안에 있는 작성자임
			if(result==1) {
			String insertSQL = "insert into board values((select max(idx)+1 from board), ?,?,?, sysdate,?,0)";
			PreparedStatement pt = con.prepareStatement(insertSQL);
			pt.setString(1, vo.getTitle());
			pt.setString(2, vo.getContents());
			pt.setString(3, vo.getWriter());
			pt.setInt(4, vo.getPassword());
			ans =  pt.executeUpdate();
			if(ans==1) {
				System.out.println("insert 성공");
			}
			pt.close();
			}		
			con.close();
		}catch(Exception e) {
			e.printStackTrace();
		}
		return ans;		
	}
	
	public int getTotalBoard() { //게시글의 갯수
		int total=0;
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			Connection con = DriverManager.getConnection("jdbc:oracle:thin:@127.0.0.1:1521:xe","hr","hr");
			String sql = "select count(*) from board";
			PreparedStatement pt = con.prepareStatement(sql);
			ResultSet rs =  pt.executeQuery();
			rs.next();//최초의 상태가 1번 레코드 이전에 포인터가 위치해 있으므로 1번 레코드를 가리키도록 해주기
			//즉, 하나만 있어도 반드시 작성해줘야함!
			total = rs.getInt(1);//1번 컬럼을 읽어오기(현재 sql에 컬럼이 하나 밖에 없음)
			//rs.getInt("count(*)")와 같은 말
			//cf) sql에서 select count(*) as cnt from board처럼 alias를 주면? rs.getInt(cnt)라고 써야함
			rs.close();
			pt.close();
			con.close();
		}catch(Exception e) {
			e.printStackTrace();
		}
		return total;
	}
//	public static void main(String[] args) {
//		System.out.println(new BoardDAO().getTotalBoard());
//	}
	
}


//public class BoardDAO {
//
//	private DataSource conpool;
//
//	public BoardDAO() {
//		try {
//			Context initContext = new InitialContext();
//			Context envContext = (Context) initContext.lookup("java:/comp/env");
//			conpool = (DataSource) envContext.lookup("jdbc/myoracle");
//		} catch (Exception e) {
//			e.printStackTrace();
//		}
//	}
//
//	// Connection con = conpool.getConnection();
//	public ArrayList<BoardVO> getBoardList() {
//		ArrayList<BoardVO> list = new ArrayList<BoardVO>();
//		Connection con = null;
//		PreparedStatement pt = null;
//		ResultSet rs = null;
//
//		try {
//			//con = dataSource.getConnection();
//			con = conpool.getConnection();
//			String sql = "select * from board order by idx";
//			pt = con.prepareStatement(sql);
//			rs = pt.executeQuery();
//			while (rs.next()) {
//				BoardVO vo = new BoardVO(rs.getInt("idx"), rs.getString("head"), rs.getString("ctx"),
//						rs.getString("mem"), rs.getString("time"), rs.getInt("b_pwd"), rs.getInt("hit"));
//				list.add(vo);
//			}
//		} catch (Exception e) {
//			e.printStackTrace();
//		} finally {
//			try {
//				if (rs != null)
//					rs.close();
//				if (pt != null)
//					pt.close();
//				if (con != null)
//					con.close();
//			} catch (Exception e) {
//				e.printStackTrace();
//			}
//		}
//		System.out.println("갯수는? "+list.size());
//		return list;
//	}
//	public static void main(String[] args) {
//	 new BoardDAO().getBoardList(); //에러 확인해보기 = 잘 동작하는지 확인 => 후에는 주석처리 or 삭제
//	}
//
//}
