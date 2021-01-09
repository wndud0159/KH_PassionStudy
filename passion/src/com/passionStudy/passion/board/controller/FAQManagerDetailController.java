package com.passionStudy.passion.board.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.passionStudy.passion.board.faqboard.model.dao.FAQBoardDao;
import com.passionStudy.passion.board.faqboard.model.vo.FAQBoardVo;

/**
 * Servlet implementation class FAQDetailController
 */
@WebServlet("/faq.FAQManagerDetail")
public class FAQManagerDetailController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FAQManagerDetailController() {
        super();
        // TODO Auto-generated constructor stub
    }
    
    @Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		process(request, response);	}

    @Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		process(request, response);
	}

	private void process(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		int idx = Integer.parseInt(request.getParameter("idx"));
		
		FAQBoardDao faqboardDao = FAQBoardDao.getInstance();
		FAQBoardVo faqboardVo = new FAQBoardVo();
		
		faqboardVo = faqboardDao.getView(idx);
		
		request.setAttribute("faqboardVo", faqboardVo);
		
		request.getRequestDispatcher("index.jsp?inc=./views/board/faq/board_faq_manager_detail.jsp").forward(request, response);

	}
}
