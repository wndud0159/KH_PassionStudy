package com.passionStudy.passion.manager.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.passionStudy.passion.manager.model.service.ManagerMemberService;
import com.passionStudy.passion.manager.model.vo.ManagerMemberVo;

/**
 * Servlet implementation class ManagerMemberServlet
 */
@WebServlet("/manager.MemberSearch")
public class ManagerMemberSearchController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ManagerMemberSearchController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String searchName =  (String)request.getParameter("SearchName");
		
		ArrayList<ManagerMemberVo> list =  new ManagerMemberService().memberSearch(searchName);
		
		if(list.size() > 0) {
			
		}
		
		request.setAttribute("list", list);
		
		request.getRequestDispatcher("index.jsp?inc=./views/manager/manager_memberedit.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
