package kr.co.koo.board.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.koo.board.model.BoardDAO;
import kr.co.koo.board.model.BoardVO;

public class BContentService implements IBoardService {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		
		String bNum = request.getParameter("bNum");
		
		BoardDAO dao = BoardDAO.getInstance();
		BoardVO article = dao.content(bNum);
		request.setAttribute("article", article);		

	}

}



