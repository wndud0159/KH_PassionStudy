package com.passionStudy.passion.member.model.dao;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Properties;
import java.util.Vector;

import com.passionStudy.passion.member.model.vo.MyPageResVo;
import com.passionStudy.qnaBoard.vo.QnaVo;

import static com.passionStudy.passion.common.JDBCtemplate.*;

public class MyPageDao {
	
	Connection conn = null;
	
	private Properties prop = new Properties();
	

	public MyPageDao() {
		String fileName = MyPageDao.class.getResource("/sql/mypage/mypageEdit-mapper.xml").getPath();
		
		try {
			prop.loadFromXML(new FileInputStream(fileName));
		}catch(IOException e) {
			e.printStackTrace();
		}
	}
	

	// 회원정보수정
	public int updateInfoMember(Connection conn, String memId, String memPhone, String memAdAgree) throws SQLException {
		// 리턴 타입 선언
		int result = 0;
		
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("editPhoneNadAgree");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, memPhone);
			pstmt.setString(2, memAdAgree);
			pstmt.setString(3, memId);
			
			result = pstmt.executeUpdate();	//1을 반환
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally{
			close(pstmt);
		}
		return result;	
	}
	
	
	// 회원 탈퇴 메소드(회원 상태만 바꿔놓기)
	public int deleteMember(Connection conn, String memberId) throws SQLException {
		// 리턴 타입 선언
		int result = 0;
		
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("withdrawal");
				
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, memberId);
			result = pstmt.executeUpdate();	//1이 반환
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}
	
	// 한 회원의 패스워드 값을 리턴하는 메소드 작성
	public String getPass(Connection conn, String memberId) throws SQLException {
		// 리턴 타입 선언
		String password = "";
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String sql = prop.getProperty("giveMeThePassword");
		
		try {	
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, memberId);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				password = rs.getString(1);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		
		return password;
	}
	
	// 비밀번호 변경
	public int changePwd(Connection conn, String newPassword, String memberId) throws SQLException {
		// 리턴타입 선언
		int result = 0; 
		
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("changeThePassword");
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, newPassword);
			pstmt.setString(2, memberId);
			result = pstmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
			
	}
	
	// 한 회원의 구매 내역을 받아오는 메서드	// 아 모르겠다. 여기부터 다시할 것.
	/*
	 * public MyPageResVo getReceipt(Connection conn, int memberNo) { // 리턴 타입 선언
	 * MyPageResVo receipt = null;
	 * 
	 * PreparedStatement pstmt = null; ResultSet rs = null;
	 * 
	 * // 쿼리 준비 String sql =
	 * "SELECT RESERVATION_DATE, RESERVATION_TIME, RESERVATION_CONDITION " +
	 * "FROM RESERVATION WHERE MEMBER_NO = ?"; try { pstmt =
	 * conn.prepareStatement(sql);
	 * 
	 * pstmt.setInt(1, memberNo);
	 * 
	 * rs = pstmt.executeQuery();
	 * 
	 * if(rs.next()) {
	 * 
	 * }
	 * 
	 * rs.getDate(1); rs.getString(2); rs.getString(3);
	 * 
	 * 
	 * 
	 * } catch (Exception e) { e.printStackTrace(); } }
	 */
	
	// 1대1 문의
	public Vector<QnaVo> getReservationList(Connection conn, String memberName) {
		// 리턴타입
		Vector<QnaVo> qnalist = new Vector<>();
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String sql = "SELECT * FROM QNA_BOARD WHERE QNA_WRITER = ? ";
		
		try {
			// 쿼리 준비
			pstmt = conn.prepareStatement(sql);
			// ?에 대입
			pstmt.setString(1, memberName);
			// 쿼리 실행
			rs = pstmt.executeQuery();
			
			// 여러개의 문의글
			while(rs.next()) {
				QnaVo qna = new QnaVo();
				qna.setQnaNo(rs.getInt(1));
				qna.setQnaWriter(rs.getString(2));
				qna.setQnaTitle(rs.getString(3));
				qna.setQnaContent(rs.getString(4));
				qna.setQnaDate(rs.getString(5));
				qna.setAnswerTitle(rs.getString(6));
				qna.setAnswerContent(rs.getString(7));
				qna.setBoardAnswer(rs.getInt(8));
				qna.setPagingStack(rs.getInt(9));
				qna.setCategory(rs.getString(10));
				
				qnalist.add(qna);
			}
			close(rs);
			close(pstmt);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return qnalist;
	}
	
	

}
