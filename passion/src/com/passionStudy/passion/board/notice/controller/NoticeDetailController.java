package com.passionStudy.passion.board.notice.controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.passionStudy.passion.board.noticeboard.model.vo.NoticeVo;

@WebServlet("/views/board/notice/board_notice_detail")
public class NoticeDetailController extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int nno = Integer.parseInt(request.getParameter("nno"));
		String url = "jdbc:oracle:thin:@localhost:1521:xe";
		String sql = "SELECT * FROM NOTICE WHERE NOTICE_NO=?";

		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			Connection con = DriverManager.getConnection(url,"dbtest","1234");
			PreparedStatement st = con.prepareStatement(sql);
			st.setInt(1,nno);
			
			ResultSet rs = st.executeQuery();
			
			rs.next();
			
			String ntitle = rs.getString("NOTICE_TITLE");
			int mno = rs.getInt("MEMBER_NO");
			Date regdate = rs.getDate("REGDATE");
			int ncount = rs.getInt("NOTICE_COUNT");
			String ncontent = rs.getString("NOTICE_CONTENT");
			
			NoticeVo noticeVo = new NoticeVo(
					nno,
					mno,
					ntitle,
					ncontent,
					ncount,
					regdate
					); 
			
			request.setAttribute("n", noticeVo);
			/*
			request.setAttribute("ntitle", ntitle);
			request.setAttribute("mno", mno);
			request.setAttribute("regdate", regdate);
			request.setAttribute("ncount", ncount);
			request.setAttribute("ncontent", ncontent);
			*/
			
			rs.close();
			st.close();
			con.close();
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			
		}
		
		//forward
		request
		.getRequestDispatcher("/views/board/notice/board_notice_detail.jsp")
		.forward(request, response);
	}

}

