package com.kh.bts.mypage.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.kh.bts.HomeController;
import com.kh.bts.acnt.model.vo.Acnt;
import com.kh.bts.community.model.service.CommunityService;
import com.kh.bts.community.model.vo.Community;
import com.kh.bts.member.model.service.MemberService;
import com.kh.bts.member.model.vo.Member;
import com.kh.bts.mypage.model.service.MypageService;

@Controller
@RequestMapping("mypage")
public class MypageController {
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);

	@Autowired
	private MemberService mService;

	@Autowired
	private MypageService myService;

	@RequestMapping(value = "")
	public ModelAndView mypageEnter(ModelAndView mv) {
		mv.setViewName("mypage/myPageEnter");
		return mv;
	}

// 마이페이지 진입 메커니즘 : 로그인 되어있는 아이디와 db의 비밀번호를 비교함
	@RequestMapping(value = "/admitEnter")
	public void admitEnter(ModelAndView mv, HttpServletRequest request, HttpServletResponse response,
			@RequestParam(name = "password") String inputPass) {

		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");

		HttpSession session = request.getSession();
		String loginEmail = (String) session.getAttribute("loginMember");

		Member vo = new Member();
		vo.setEmail(loginEmail);
		vo.setPw(inputPass);

		// 새로 매퍼 만들기 귀찮아서 기존의 로그인 매퍼 사용함. 그래서 AUTH 가 y인걸 추가하는 것임
		vo.setAuth("Y");
		PrintWriter out = null;
		try {
			out = response.getWriter();

			Member loginMember = mService.loginMember(vo);

			if (loginMember != null) { // 로그인 성공
				out.print("<script>alert('환영합니다 " + loginMember.getNickname() + "님!')</script>");
				out.print("<script>location.href='mi'</script>)");
			} else { // 로그인 실패
				out.print("<script>alert('잘못된 비밀번호 입니다')</script>");
				out.print("<script>history.back()</script>");

			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			out.flush();
			out.close();
		}
	}

	// 비밀번호 변경
	@RequestMapping(value = "/passChange")
	public ModelAndView passChange(ModelAndView mv, HttpServletRequest request, @RequestParam(name = "pw") String pw) {
		logger.info("비밀번호 변경하러 들어옴");
		HttpSession session = request.getSession();
		String email = (String) session.getAttribute("loginMember");
		Member vo = new Member();
		vo.setEmail(email);
		vo.setPw(pw);
		int result = myService.passwordUpdate(vo);
		if (result > 0) {
			logger.info("비밀번호 변경 성공");
			request.getSession().removeAttribute("loginMember");
		} else {
			logger.info("비밀번호 변경 실패");
		}
		mv.setViewName("main/mainPage");
		return mv;
	}

//미완성
	// 계좌 비밀번호 변경
	@RequestMapping(value = "/bankPwChange")
	public ModelAndView bankPwChange(ModelAndView mv, HttpServletRequest request,
			@RequestParam(name = "bankPw") int bankPw) {
		logger.info("계좌 비밀번호 변경하러 들어옴");
		HttpSession session = request.getSession();
		String email = (String) session.getAttribute("loginMember");
		Acnt vo = new Acnt();
		vo.setEmail(email);
		vo.setBankPw(bankPw);
		int result = myService.bankPwUpdate(vo);
		if (result > 0) {
			logger.info("계좌 비밀번호 변경 성공");
			request.getSession().removeAttribute("loginMember");
		} else {
			logger.info("계좌 비밀번호 변경 실패");
		}
		mv.setViewName("main/mainPage");
		return mv;
	}

	// 내 회원 정보 가져오기
	@RequestMapping(value = "/mi")
	public ModelAndView myInfo(ModelAndView mv, HttpServletRequest request) {
		HttpSession session = request.getSession();
		String email = (String) session.getAttribute("loginMember");
		Member vo = myService.myInfo(email);
		mv.addObject("myInfo", vo);
		mv.setViewName("mypage/myInfo");
		return mv;
	}

	// 내 회원 정보 수정
	@RequestMapping(value = "/miu")
	public void myInfoUpdate(Member vo, HttpServletResponse response) {
		int result = myService.myInfoUpdate(vo);
		PrintWriter out = null;
		try {
			out = response.getWriter();
			out.print(result);
		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			out.flush();
			out.close();
		}

	}

	@RequestMapping(value = "/myClist", method = RequestMethod.GET)
	public ModelAndView myClist(ModelAndView mv, HttpServletRequest request) {
		HttpSession session = request.getSession();
		String email = (String) session.getAttribute("loginMember");
		List<Community> list = myService.myCommunity(email);
		mv.addObject("myClist", list);
		mv.setViewName("mypage/myCommunity");
		return mv;
	}

	@RequestMapping(value = "/mpu")
	public ModelAndView mypagePasswordUpdate(ModelAndView mv) {
		mv.setViewName("mypage/myPasswordUpdate");
		return mv;
	}

	@RequestMapping(value = "/me")
	public ModelAndView myEssets(ModelAndView mv) {
		mv.setViewName("mypage/myEssets");
		return mv;
	}

	@RequestMapping(value = "/mee")
	public ModelAndView myEssetsEnter(ModelAndView mv) {
		mv.setViewName("mypage/myEssetsEnter");
		return mv;
	}

	@RequestMapping(value = "/mr")
	public ModelAndView myReply(ModelAndView mv) {
		mv.setViewName("mypage/myReply");
		return mv;
	}

	@RequestMapping(value = "/mcl")
	public ModelAndView myCashLog(ModelAndView mv) {
		mv.setViewName("mypage/myCashLog");
		return mv;
	}

}
