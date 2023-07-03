package cash.model;
import java.sql.*;
import java.util.*;
import cash.vo.*;


public class CashbookDao {
	//달력에 출력할 목록
	public List<Cashbook> selectCashbookListByMonth(String memberId, int targetYear, int targetrMonth){
		 List<Cashbook> list = new  ArrayList<Cashbook>();
		 
		 	
			Connection conn = null;
			PreparedStatement stmt =null;
			ResultSet rs = null;
			String sql = "SELECT cashbook_no cashbookNo, category, price, cashbook_date cashbookDate"
					+ " FROM cashbook WHERE member_id=? AND YEAR(cashbook_date)=? AND MONTH(cashbook_date)=? "
					+ "ORDER BY cashbook_date DESC";
			
			try {
				Class.forName("org.mariadb.jdbc.Driver");
				conn = DriverManager.getConnection("jdbc:mariadb://127.0.0.1:3306/cash","root","java1234");
				stmt = conn.prepareStatement(sql);
				stmt.setString(1, memberId);
				stmt.setInt(2, targetYear);
				stmt.setInt(3, targetrMonth);
				System.out.println(stmt + "<--stmt-- selectCashbookListByMonth " );

				rs = stmt.executeQuery();
				System.out.println(rs + "<--rs-- selectCashbookListByMonth " );
				while(rs.next()) {
					Cashbook c = new Cashbook();
					c.setCashbookNo(rs.getInt("cashbookNo"));
					c.setCategory(rs.getString("category"));
					c.setPrice(rs.getInt("price"));
					c.setCashbookDate(rs.getString("cashbookDate"));
				    list.add(c); 

				}
				
			}catch(Exception e){
				e.printStackTrace();
			}finally {
				try {
					rs.close();
					stmt.close();
					conn.close();
					rs.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}				
			}		
		 return list;
	}


	//캘린더One 해시태그 조인
	public List<HashMap<String, Object>> cashbookOneList(String memberId, int targetYear, int targetrMonth, int targetDay){
		List<HashMap<String, Object>> mapList = new ArrayList<HashMap<String, Object>>();
	 	
		Connection conn = null;
		PreparedStatement stmt =null;
		ResultSet rs = null;
		String sql = "SELECT  "
				+ "    c.cashbook_no cashbookNo, c.category category, c.price price, c.cashbook_date cashbookDate, "
				+ "    c.createdate createdate, c.updatedate updatedate, IFNULL(h.word, '') word "
				+ "FROM cashbook c  "
				+ "    LEFT OUTER JOIN hashtag h ON c.cashbook_no = h.cashbook_no "
				+ "WHERE member_id = ? AND YEAR(c.cashbook_date) =? AND MONTH(c.cashbook_date) = ? AND DAY(c.cashbook_date) =?"
				+ " ORDER BY c.cashbook_date DESC ";
			
		try {
			Class.forName("org.mariadb.jdbc.Driver");
			conn = DriverManager.getConnection("jdbc:mariadb://127.0.0.1:3306/cash","root","java1234");
			stmt = conn.prepareStatement(sql);
			stmt.setString(1, memberId);
			stmt.setInt(2, targetYear);
			stmt.setInt(3, targetrMonth);
			stmt.setInt(4, targetDay);
			System.out.println(stmt + "<--stmt-- cashbookOneList " );

			rs = stmt.executeQuery();
			System.out.println(rs + "<--rs-- cashbookOneList " );
	        while (rs.next()) {
	        	HashMap<String, Object> m = new HashMap<String, Object>();
				m.put("cashbookNo", rs.getInt("cashbookNo"));
				m.put("category", rs.getString("category"));
				m.put("price", rs.getInt("price"));
				m.put("cashbookDate", rs.getString("cashbookDate"));
				m.put("createdate", rs.getString("createdate"));
				m.put("updatedate", rs.getString("updatedate"));
				m.put("word", rs.getString("word"));
				mapList.add(m);
	        }
			
		}catch(Exception e){
			e.printStackTrace();
		}finally {
			try {
				rs.close();
				stmt.close();
				conn.close();
				rs.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}				
		}		
	 return mapList;
	}
}
