package com.kh.bts.mypage.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.kh.bts.HomeController;
import com.kh.bts.member.model.service.MemberService;
import com.kh.bts.member.model.vo.Member;

@Controller
@RequestMapping("mypage")
public class MypageController {
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@Autowired
	private MemberService mService;

	@RequestMapping(value = "")
	public ModelAndView mypageEnter(ModelAndView mv) {
		mv.setViewName("mypage/myPageEnter");
		return mv;
	}

// 마이페이지 진입 메커니즘 : 로그인 되어있는 아이디와 db의 비밀번호를 비교함
	@RequestMapping(value = "/admitEnter")
	public ModelAndView admitEnter(ModelAndView mv, HttpServletRequest request, HttpServletResponse response,
			@RequestParam(name = "password") String inputPass) {

		HttpSession session = request.getSession();
		String loginEmail = ((Member) session.getAttribute("loginMember")).getEmail();
		logger.info(inputPass + "입력받은 비밀번호");
		logger.info(loginEmail + "현재 로그인 중인 이메일");
		
		Member vo = new Member();
		vo.setEmail(loginEmail);
		vo.setPw(inputPass);
		
		// 새로 매퍼 만들기 귀찮아서 기존의 로그인 매퍼 사용함. 그래서 AUTH 가 y인걸 추가하는 것임
		vo.setAuth("Y");
		try {
			Member loginMember = mService.loginMember(vo);
			if(loginMember != null) {
				mv.setViewName("mypage/myInfo");				
			} else {
				mv.setViewName("main/mainPage");								
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return mv;
	}

	@RequestMapping(value = "/mi")
	public ModelAndView myInfo(ModelAndView mv) {
		mv.setViewName("mypage/myInfo");
		return mv;
	}

	@RequestMapping(value = "/miu")
	public ModelAndView myInfoUpdate(ModelAndView mv) {
		mv.setViewName("mypage/myInfoUpdate");
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

	@RequestMapping(value = "/mc")
	public ModelAndView myCommunity(ModelAndView mv) {
		mv.setViewName("mypage/myCommunity");
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