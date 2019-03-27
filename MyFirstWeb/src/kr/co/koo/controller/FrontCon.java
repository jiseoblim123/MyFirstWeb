package kr.co.koo.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.koo.member.model.MemberDAO;
import kr.co.koo.member.model.MemberVO;


@WebServlet("*.user")
public class FrontCon extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public FrontCon() {
        super();
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("get요청 발생!");
		doRequest(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("post요청 발생");
		doRequest(request, response);
	}
	
	private void doRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//컨트롤러가 요청을 구분하는 방법.
		String uri = request.getRequestURI();
		//System.out.println("uri: " + uri);
		String conPath = request.getContextPath();
		//System.out.println("conPath: " + conPath);
		
		String command = uri.substring(conPath.length());
		//System.out.println("command: " + command);
		
		String ui = null;
		
		if(command.equals("/join.user")) {
			System.out.println("회원가입 요청이 들어왔습니다.");
			System.out.println("-------------------------");
			ui = "/user/user_join.jsp";
		}else if(command.equals("/login.user")) {
			System.out.println("로그인 요청이 들어왔습니다.");
			System.out.println("-------------------------");
			ui = "/user/user_login.jsp";
		}else if(command.equals("/update.user")) {
			System.out.println("정보수정 요청이 들어왔습니다.");
			System.out.println("-------------------------");
		}else if(command.equals("/delete.user")) {
			System.out.println("회원탈퇴 요청이 들어왔습니다.");
			System.out.println("-------------------------");
		}else if(command.equals("/member_all.user")) {
			MemberDAO dao = MemberDAO.getInstance();
			ArrayList<MemberVO> member = dao.membersAll();
			request.setAttribute("member_list", member);
			ui = "/user/user_all_result.jsp";
		}
		
		/*
		 * Java코드로 Forward기능 구현 방법.
		 * 1. RequestDispacher타입의 객체를 생성합니다.
		 * 2. 객체 생성 후 forward()메서드를 호출합니다.
		 * 3. forward시에 uri에는 컨텍스트 경로를 빼고 적습니다.
		 */
		RequestDispatcher dp = request.getRequestDispatcher(ui);
		dp.forward(request, response);
		
	}

}



