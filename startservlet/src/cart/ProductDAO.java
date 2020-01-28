package cart;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class ProductDAO {
	public ArrayList<ProductVO> getProductList() {
		ArrayList<ProductVO> list = new ArrayList<ProductVO>();
		try {
		Class.forName("oracle.jdbc.driver.OracleDriver");
		Connection con = DriverManager.getConnection("jdbc:oracle:thin:@127.0.0.1:1521:xe","hr","hr");
		String sql = "select * from product";
		PreparedStatement pt = con.prepareStatement(sql);
		ResultSet rs =  pt.executeQuery();
		while(rs.next()) {//한개의 행마다
			ProductVO vo = new ProductVO();
			vo.setCode((rs.getInt("code")));
			vo.setName(rs.getString("name"));
			vo.setPrice(rs.getInt("price"));
			vo.setNum(rs.getInt("num"));
			vo.setExp(rs.getString("exp"));			
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
}
