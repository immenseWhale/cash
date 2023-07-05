package cash.model;
import java.sql.*;
import java.util.*;
import cash.vo.*;

public class HashtagDao {

		//메모에서 잘라서 태그 넣기
		public int insertHashtag(Hashtag hashtag) {
			int row = 0;
			
			Connection conn = null;
			PreparedStatement stmt =null;
			String sql = "INSERT INTO hashtag(cashbook_no, word, updatedate, createdate) VALUES ( ?,?,NOW(), NOW() )";
				
			try {
				Class.forName("org.mariadb.jdbc.Driver");
				conn = DriverManager.getConnection("jdbc:mariadb://127.0.0.1:3306/cash","root","java1234");
				stmt = conn.prepareStatement(sql);
				stmt.setInt(1, hashtag.getCashbookNo());
				stmt.setString(2, hashtag.getWord());
				//System.out.println(stmt + "<--stmt-- insertHashtag HashtagDao " );

				row = stmt.executeUpdate();
				//System.out.println(row + "<--row-- insertHashtag HashtagDao" );
				
				
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
			return row;
		}
		
		public List<Map<String, Object>> selectWordCountByMonth (int targetYear, int targetMonth){
			List<Map<String, Object>> mapList = new ArrayList ();
			
			Connection conn = null;
			PreparedStatement stmt =null;
			ResultSet rs = null;
			String sql = "SELECT h.word word, COUNT(*) cnt "
					+ "FROM hashtag h  "
					+ "	INNER JOIN cashbook c ON h.cashbook_no = c.cashbook_no "
					+ "WHERE YEAR(c.cashbook_date) = ? AND MONTH(c.cashbook_date) = ? "
					+ "GROUP BY word ORDER BY cnt DESC";
				
			try {
				Class.forName("org.mariadb.jdbc.Driver");
				conn = DriverManager.getConnection("jdbc:mariadb://127.0.0.1:3306/cash","root","java1234");
				stmt = conn.prepareStatement(sql);
				stmt.setInt(1, targetYear);
				stmt.setInt(2, targetMonth);
				//System.out.println(stmt + "<--stmt-- selectWordCountByMonth HashtagDao" );
				
				rs = stmt.executeQuery();
				while(rs.next()) {
					Map<String, Object> m = new HashMap<String, Object>();
					m.put("word", rs.getString("word"));
					m.put("cnt", rs.getString("cnt"));
					mapList.add(m);
				}
				
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
			
			return mapList;
		}
		
		
//행 삭제
		public int deleteHashtagByNo(int cashbookNo){
			int result = 0;
			
			Connection conn = null;
			PreparedStatement stmt =null;
			String sql = "DELETE FROM hashtag WHERE cashbook_no = ?";

			try {
				Class.forName("org.mariadb.jdbc.Driver");
				conn = DriverManager.getConnection("jdbc:mariadb://127.0.0.1:3306/cash","root","java1234");
				stmt = conn.prepareStatement(sql);
				stmt.setInt(1, cashbookNo);
				result = stmt.executeUpdate();
				//System.out.println(result + "<--result-- deleteHashtagByNo HashtagDao");
				
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
