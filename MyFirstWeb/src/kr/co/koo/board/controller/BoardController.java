package kr.co.koo.board.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.koo.board.service.BContentService;
import kr.co.koo.board.service.BListService;
import kr.co.koo.board.service.BWriteService;
import kr.co.koo.board.service.IBoardService;


@WebServlet("*.board")
public class BoardController extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
    public BoardController() {
        super();
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doRequest(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doRequest(request, response);
	}


	private void doRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("utf-8");
		
		String ui = null;
		
		String uri = request.getRequestURI();
		String conPath = request.getContextPath();
		String com = uri.substring(conPath.length());
		
		IBoardService sv = null;
		
		if(com.equals("/board/bWriteView.board")) {
			ui = "/board/board_write_view.jsp";
		}else if(com.equals("/board/bWrite.board")) {
			//해당요청에 맞는 서비스에 요청처리 위임.
			sv = new BWriteService();
			sv.execute(request, response);
			ui = "/board/BList.board";
		}else if(com.equals("/board/BList.board")) {
			sv = new BListService();
			sv.execute(request, response);
			ui = "/board/board_list.jsp";
		}else if(com.equals("/board/BContent.board")) {
			sv = new BContentService();
			sv.execute(request, response);
			ui = "/board/board_content.jsp";
		}
		
		RequestDispatcher dp = request.getRequestDispatcher(ui);
		dp.forward(request, response);
	}

}








