package com.kh.bts.admin.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.kh.bts.community.model.service.CommunityService;
import com.kh.bts.community.model.vo.Community;
import com.kh.bts.member.model.service.MemberService;

@Controller
@RequestMapping("/admin")
public class AdminCtrl {
	@Autowired
	private MemberService mService;

	@Autowired
	private CommunityService cService;

	@ModelAttribute("countMember")
	public int countMember() {
		return mService.countMember();
	}

	@ModelAttribute("countTodayMember")
	public int countTodayMember() {
		return mService.countTodayMember();
	}

	@ModelAttribute("totalCount")
	public int totalCount() {
		return cService.totalCount();
	}

	@ModelAttribute("totalTodayCount")
	public int totalTodayCount() {
		return cService.totalTodayCount();
	}

	@RequestMapping(value = "/reportCommunity")
	public ModelAndView reportCommunity(ModelAndView mv, Community vo,
			@RequestParam("creport") int crreason) {
		System.out.println("############## 신고하러 들어옴");
		
		
		
		
		mv.setViewName("admin/adminMain");
		return mv;
	}

	@RequestMapping(value = "")
	public ModelAndView adminMain(ModelAndView mv) {
		mv.setViewName("admin/adminMain");
		return mv;
	}

	@RequestMapping(value = "/acr", method = RequestMethod.GET)
	public ModelAndView acr(ModelAndView mv) {
		mv.setViewName("admin/afterCommunityReport");
		return mv;
	}

	@RequestMapping(value = "/arr", method = RequestMethod.GET)
	public ModelAndView arr(ModelAndView mv) {
		mv.setViewName("admin/afterReplyReport");
		return mv;
	}

	@RequestMapping(value = "/cr", method = RequestMethod.GET)
	public ModelAndView cr(ModelAndView mv) {
		mv.setViewName("admin/communityReport");
		return mv;
	}

	@RequestMapping(value = "/ml", method = RequestMethod.GET)
	public ModelAndView ml(ModelAndView mv) {
		mv.setViewName("admin/memberList");
		return mv;
	}

	@RequestMapping(value = "/nl", method = RequestMethod.GET)
	public ModelAndView nl(ModelAndView mv) {
		mv.setViewName("admin/noticeList");
		return mv;
	}

	@RequestMapping(value = "rr", method = RequestMethod.GET)
	public ModelAndView rr(ModelAndView mv) {
		mv.setViewName("admin/replyReport");
		return mv;
	}

	@RequestMapping(value = "cll", method = RequestMethod.GET)
	public ModelAndView cashLogList(ModelAndView mv) {
		mv.setViewName("admin/cashLogList");
		return mv;
	}
}
