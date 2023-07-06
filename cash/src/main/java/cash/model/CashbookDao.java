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
			String sql = "SELECT cashbook_no cashbookNo, category, price, cashbook_date cashbookDate "
					+ "FROM cashbook  "
					+ "WHERE member_id=? AND YEAR(cashbook_date)=? AND MONTH(cashbook_date)=? "
					+ "ORDER BY cashbook_date DESC";
			
			try {
				Class.forName("org.mariadb.jdbc.Driver");
				conn = DriverManager.getConnection("jdbc:mariadb://127.0.0.1:3306/cash","root","java1234");
				stmt = conn.prepareStatement(sql);
				stmt.setString(1, memberId);
				stmt.setInt(2, targetYear);
				stmt.setInt(3, targetrMonth);
				//System.out.println(stmt + "<--stmt-- selectCashbookListByMonth " );

				rs = stmt.executeQuery();
				//System.out.println(rs + "<--rs-- selectCashbookListByMonth " );
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
				} catch (SQLException e) {
					e.printStackTrace();
				}				
			}		
		 return list;
	}


	//캘린더One 해시태그 조인
	/*
SELECT 
    c.cashbook_no AS cashbookNo, c.member_id AS memberId, c.category AS category, 
    c.cashbook_date AS cashbookDate, c.price AS price, 
	 c.memo AS memo, GROUP_CONCAT(h.word) AS wordList,
    c.createdate AS createdate, c.updatedate AS updatedate
FROM cashbook c 
LEFT JOIN hashtag h ON c.cashbook_no = h.cashbook_no
WHERE c.member_id = 'test1' 
    AND YEAR(c.cashbook_date) = 2023 
    AND MONTH(c.cashbook_date) = 7 
    AND DAY(c.cashbook_date) = 7
GROUP BY c.cashbook_no, c.member_id;
	 */
	public List<HashMap<String, Object>> cashbookOneList(String memberId, int targetYear, int targetrMonth, int targetDay){
		List<HashMap<String, Object>> mapList = new ArrayList<HashMap<String, Object>>();
	 	
		Connection conn = null;
		PreparedStatement stmt =null;
		ResultSet rs = null;
		String sql = "SELECT  "
				+ "    c.cashbook_no AS cashbookNo, c.member_id AS memberId, c.category AS category,  "
				+ "    c.cashbook_date AS cashbookDate, c.price AS price,  "
				+ "	 c.memo AS memo, GROUP_CONCAT(h.word) AS word, "
				+ "    c.createdate AS createdate, c.updatedate AS updatedate "
				+ "FROM cashbook c  "
				+ "LEFT JOIN hashtag h ON c.cashbook_no = h.cashbook_no "
				+ "WHERE c.member_id = ?  "
				+ "    AND YEAR(c.cashbook_date) = ?  "
				+ "    AND MONTH(c.cashbook_date) = ?  "
				+ "    AND DAY(c.cashbook_date) = ? "
				+ "GROUP BY c.cashbook_no, c.member_id;";
			
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
				m.put("memo", rs.getString("memo"));
				m.put("word", rs.getString("word"));
				m.put("createdate", rs.getString("createdate"));
				m.put("updatedate", rs.getString("updatedate"));
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
	
	//태그로 정렬한 캐시북 리스트
	public List<Cashbook> selectCashbookListByTag(String memberId, String word, int beginRow, int rowPerPage ){
		 List<Cashbook> list = new  ArrayList<Cashbook>();
		 	
			Connection conn = null;
			PreparedStatement stmt =null;
			ResultSet rs = null;
			String sql = "SELECT c.cashbook_no cashbookNo, c.member_id memberId,  c.category category, c.price price, c.cashbook_date cashbookDate, c.memo memo, c.createdate createdate, c.updatedate updatedate "
					+ " FROM cashbook c INNER JOIN hashtag h ON c.cashbook_no = h.cashbook_no "
					+ "WHERE c.member_id = ? AND h.word =? "
					+ "ORDER BY c.cashbook_date DESC "
					+ "LIMIT ?, ?";
			
			try {
				Class.forName("org.mariadb.jdbc.Driver");
				conn = DriverManager.getConnection("jdbc:mariadb://127.0.0.1:3306/cash","root","java1234");
				stmt = conn.prepareStatement(sql);
				stmt.setString(1, memberId);
				stmt.setString(2, word);
				stmt.setInt(3, beginRow);
				stmt.setInt(4, rowPerPage);
				System.out.println(stmt + "<--stmt-- selectCashbookListByMonth " );

				rs = stmt.executeQuery();
				System.out.println(rs + "<--rs-- selectCashbookListByMonth " );
				while(rs.next()) {
					Cashbook c = new Cashbook();
					c.setCashbookNo(rs.getInt("cashbookNo"));
					c.setCategory(rs.getString("category"));
					c.setPrice(rs.getInt("price"));
					c.setCashbookDate(rs.getString("cashbookDate"));
					c.setMemo(rs.getString("memo"));
					c.setCreatedate(rs.getString("createdate"));
					c.setUpdatedate(rs.getString("updatedate"));
				    list.add(c); 

				}
				
			}catch(Exception e){
				e.printStackTrace();
			}finally {
				try {
					rs.close();
					stmt.close();
					conn.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}				
			}		
		 return list;
	}
	
	//태그 페이지 총 행
	public int hashtagCashbookRow(String memberId, String word){
		int row = 0;
		
		Connection conn = null;
		PreparedStatement stmt =null;
		ResultSet rs = null;
		String sql = "SELECT COUNT(*) AS totalRow "
                 + "FROM cashbook c INNER JOIN hashtag h ON c.cashbook_no = h.cashbook_no "
                 + "WHERE c.member_id = ? AND h.word =?";
			
		try {
			Class.forName("org.mariadb.jdbc.Driver");
			conn = DriverManager.getConnection("jdbc:mariadb://127.0.0.1:3306/cash","root","java1234");
			stmt = conn.prepareStatement(sql);
			stmt.setString(1, memberId);
			stmt.setString(2, word);
			System.out.println(stmt + "<--stmt-- tagCashbookRow " );

			rs = stmt.executeQuery();
			if (rs.next()) {
				row = rs.getInt("totalRow");
			}
			
		}catch(Exception e){
			e.printStackTrace();
		}finally {
			try {
				rs.close();
				stmt.close();
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}				
		}		
		 return row;
	}
	
	

	//반환값 : cashbook_no 키값
	public int insertCashbook(Cashbook cashbook) {
		int cashbookNo = 0;
		
		Connection conn = null;
		PreparedStatement stmt =null;
		ResultSet rs = null;				//입력 후 생성된 키값 반환
		String sql = "INSERT INTO cashbook(member_id, category, cashbook_date, price, memo, createdate, updatedate) "
				+ "VALUES( ?,?,?,?,?,NOW(),NOW() )";
			
		try {
			Class.forName("org.mariadb.jdbc.Driver");
			conn = DriverManager.getConnection("jdbc:mariadb://127.0.0.1:3306/cash","root","java1234");
			stmt = conn.prepareStatement(sql, PreparedStatement.RETURN_GENERATED_KEYS);
			stmt.setString(1, cashbook.getMemberId());
			stmt.setString(2, cashbook.getCategory());
			stmt.setString(3, cashbook.getCashbookDate());
			stmt.setInt(4, cashbook.getPrice());
			stmt.setString(5, cashbook.getMemo());
			System.out.println(stmt + "<--stmt-- insertCashbook " );
			stmt.executeUpdate();
			rs = stmt.getGeneratedKeys();
	        if (rs.next()) {
	        	cashbookNo = rs.getInt(1);	
				System.out.println(cashbookNo + "<--insert Key값-- insertCashbook " );       	
	        }
	        
			
		}catch(Exception e){
			e.printStackTrace();
		}finally {
			try {
				stmt.close();
				conn.close();
				rs.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}				
		}		
		return cashbookNo;
	}
	
	
//행 삭제
	public int deleteCashbookByNo(int cashbookNo){
		int result = 0;
		
		Connection conn = null;
		PreparedStatement stmt =null;
		String sql = "DELETE FROM cashbook WHERE cashbook_no = ?";

		try {
			Class.forName("org.mariadb.jdbc.Driver");
			conn = DriverManager.getConnection("jdbc:mariadb://127.0.0.1:3306/cash","root","java1234");
			stmt = conn.prepareStatement(sql);
			stmt.setInt(1, cashbookNo);
			result = stmt.executeUpdate();
			System.out.println(result + "<--result-- deleteCashbookByNo cashbookDao");
			
		}catch(Exception e){
			e.printStackTrace();
		}finally {
			try {
				stmt.close();
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}				
		}			
		return result;
	}
}
