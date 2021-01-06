package com.passionStudy.passion.member.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.passionStudy.passion.member.model.dao.MemberDao;
import com.passionStudy.passion.member.model.dao.MyPageDao;
import com.passionStudy.passion.member.model.vo.MemberVo;

// 회원정보수정 클릭 했을 때 넘어온 데이터(phone,addagree)를 처리해주는 서블릿
@WebServlet("/MemberEditProc.do")
public class MemberEditProc extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		reqPro(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		reqPro(request, response);
	}
	
	protected void reqPro(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 한글처리
		request.setCharacterEncoding("utf-8");
		
		MemberVo vo = new MemberVo();
		
		
		vo.setMemId(request.getParameter("email1"));
		vo.setMemPhone(request.getParameter("phone"));
		vo.setMemAdAgree(request.getParameter("adagree"));
		
		// 데이터베이스 객체 생성
		MyPageDao mdao = new MyPageDao();
		mdao.updateInfoMember(vo);
		
		// 수정완료 팝업 창
		RequestDispatcher dis = request.getRequestDispatcher("views/mypage/editDone.jsp");
		dis.forward(request, response);
	}

}
