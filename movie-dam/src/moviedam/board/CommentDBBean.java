package moviedam.board;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import java.util.ArrayList;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class CommentDBBean {

	private static CommentDBBean instance = new CommentDBBean();

	public static CommentDBBean getInstance() {
		return instance;
	}

	// 커넥션풀로부터 Connection객체를 얻어냄
	private Connection getConnection() throws Exception {
		Context initCtx = new InitialContext();
		Context envCtx = (Context) initCtx.lookup("java:comp/env");
		DataSource ds = (DataSource) envCtx.lookup("jdbc/miso");
		return ds.getConnection();
	}

	public void insertComment(CommentDataBean cmt) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		String sql = "";

		try {
			conn = getConnection();

			sql = "insert into comment(cmt_writer,cmt_content,cmt_date,cmt_ref,cmt_parent) values(?,?,?,?,?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, cmt.getCmt_writer());
			pstmt.setString(2, cmt.getCmt_content());
			pstmt.setTimestamp(3, cmt.getCmt_date());
			pstmt.setInt(4, cmt.getCmt_ref());
			pstmt.setInt(5, cmt.getCmt_parent());
			pstmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (rs != null)
				try {
					rs.close();
				} catch (SQLException ex) {
				}
			if (pstmt != null)
				try {
					pstmt.close();
				} catch (SQLException ex) {
				}
			if (conn != null)
				try {
					conn.close();
				} catch (SQLException ex) {
				}
		}
	}
	
	public int getCommentCount(int cmt_ref) throws Exception {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "";

		int x = 0;
		try {
			conn = getConnection();

			sql = "select count(*) from comment where cmt_ref=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, cmt_ref);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				x = rs.getInt(1);
			}
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			if (rs != null)
				try {
					rs.close();
				} catch (SQLException ex) {
				}
			if (pstmt != null)
				try {
					pstmt.close();
				} catch (SQLException ex) {
				}
			if (conn != null)
				try {
					conn.close();
				} catch (SQLException ex) {
				}
		}
		return x;
	}

	public ArrayList<CommentDataBean> getComments(int cmt_ref) throws Exception {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ArrayList<CommentDataBean> commentList = null;

		try {
			conn = getConnection();

			String sql = "select * from comment where cmt_ref like '" + cmt_ref + "'order by cmt_date desc";

			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				commentList = new ArrayList<CommentDataBean>();
				do {
					CommentDataBean comment = new CommentDataBean();
					comment.setCmt_id(rs.getInt("cmt_id"));
					comment.setCmt_writer(rs.getString("cmt_writer"));
					comment.setCmt_content(rs.getString("cmt_content"));
					comment.setCmt_date(rs.getTimestamp("cmt_date"));
					comment.setCmt_ref(rs.getInt("cmt_ref"));
					comment.setCmt_parent(rs.getInt("cmt_parent"));

					commentList.add(comment);
				} while (rs.next());
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (pstmt != null)
				try {
					pstmt.close();
				} catch (SQLException ex) {
				}
			if (conn != null)
				try {
					conn.close();
				} catch (SQLException ex) {
				}
		}
		return commentList;
	}
	
	public CommentDataBean getComment(int cmt_id) throws Exception {
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        CommentDataBean content=null;
        try {
            conn = getConnection();

            pstmt = conn.prepareStatement("select * from comment where cmt_id = ?");
            pstmt.setInt(1, cmt_id);
            rs = pstmt.executeQuery();

            if (rs.next()) {
            	content = new CommentDataBean();
            	content.setCmt_id(rs.getInt("cmt_id"));
            	content.setCmt_ref(rs.getInt("cmt_ref"));
            	content.setCmt_writer(rs.getString("cmt_writer"));
            	content.setCmt_content(rs.getString("cmt_content"));
            	content.setCmt_date(rs.getTimestamp("cmt_date"));
			}
        } catch(Exception ex) {
            ex.printStackTrace();
        } finally {
            if (rs != null) try { rs.close(); } catch(SQLException ex) {}
            if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
            if (conn != null) try { conn.close(); } catch(SQLException ex) {}
        }
		return content;
	}
	
	public int deleteComment(int cmt_id, String id) throws Exception {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String dbwriter = "";
		int x = -1;
		try {
			conn = getConnection();

			pstmt = conn.prepareStatement("select cmt_writer from comment where cmt_id=?");
			pstmt.setInt(1, cmt_id);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				dbwriter = rs.getString("cmt_writer");
				if (dbwriter.equals(id)) {
					pstmt = conn.prepareStatement("delete from comment where cmt_id=?");
					pstmt.setInt(1, cmt_id);
					pstmt.executeUpdate();
					x = 1; 
				} else
					x = 0; 
			}
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			if (rs != null)
				try {
					rs.close();
				} catch (SQLException ex) {
				}
			if (pstmt != null)
				try {
					pstmt.close();
				} catch (SQLException ex) {
				}
			if (conn != null)
				try {
					conn.close();
				} catch (SQLException ex) {
				}
		}
		return x;
	}

	public int updateComment(CommentDataBean content) throws Exception {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "";
		int x = -1;

		try {
			conn = getConnection();

			pstmt = conn.prepareStatement("select * from comment where cmt_id=?");
			pstmt.setInt(1, content.getCmt_id());
			rs = pstmt.executeQuery();

			if (rs.next()) {
				sql = "update comment set cmt_content=? where cmt_id=?";
				pstmt = conn.prepareStatement(sql);

				pstmt.setString(1, content.getCmt_content());
				pstmt.setInt(2, content.getCmt_id());
				pstmt.executeUpdate();
				x = 1;
			} else {
				x = 0;
			}
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			if (rs != null)
				try {
					rs.close();
				} catch (SQLException ex) {
				}
			if (pstmt != null)
				try {
					pstmt.close();
				} catch (SQLException ex) {
				}
			if (conn != null)
				try {
					conn.close();
				} catch (SQLException ex) {
				}
		}
		return x;
	}

}