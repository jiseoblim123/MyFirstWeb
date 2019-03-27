package kr.co.koo.board.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.koo.board.model.BoardDAO;

public class BWriteService implements IBoardService {
	
	//컨트롤러의 요청위임을 처리하는 메서드 선언.
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		String bName = request.getParameter("bName");
		String bTitle = request.getParameter("bTitle");
		String bContent = request.getParameter("bContent");
		BoardDAO dao = BoardDAO.getInstance();
		//알맞은 모델의 메서드 호출!
		dao.write(bName, bTitle, bContent);
	}
}





