package com.passionStudy.passion.member.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.passionStudy.passion.member.model.service.MyPageService;
import com.passionStudy.passion.member.model.vo.MemberVo;

// 쿠폰 갯수 출력해주는 컨트롤러(이 서블릿이 마이페이지의 디폴트페이지가 되야함)
@WebServlet("/Mypage.Info")
public class MypageController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
    public MypageController() {
        super();
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		HttpSession session = request.getSession();
		MemberVo loginMember = (MemberVo)session.getAttribute("loginMember");
		int memNo = loginMember.getMemNo();
		
		MyPageService service = new MyPageService();
		int couponCount = service.getCouponCount(memNo);
		
		request.setAttribute("couponCount",	couponCount);
		RequestDispatcher dis = request.getRequestDispatcher("index.jsp?inc=./views/mypage/mypage.jsp");
		System.out.println(couponCount);
		dis.forward(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}

}
