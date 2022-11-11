package com.kh.strap.admin.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.kh.strap.admin.service.AdminMemberService;
import com.kh.strap.member.domain.Member;


@Controller
public class AdminMemberController {
	
	@Autowired
	private AdminMemberService aService;
	
	@RequestMapping(value="/admin/memberView.strap",method=RequestMethod.GET)
	public ModelAndView showAdminMemberList(
			ModelAndView mv
			,@RequestParam(value="page", required=false) Integer page
			) {
		int currentPage = (page != null) ? page : 1;
		int totalCount = aService.getTotalCount("","","");
		int adminMemberLimit = 10;
		int naviLimit = 5;
		int maxPage = (int)((double)totalCount/adminMemberLimit + 0.9);
		int startNavi = ((int)((double)currentPage/naviLimit+0.9)-1)*naviLimit+1;
		int endNavi = startNavi + naviLimit - 1;
		
		if(maxPage < endNavi) {endNavi = maxPage;}
		
		List<Member> mList = aService.printAllAdminMeberList(currentPage, adminMemberLimit);
		if(!mList.isEmpty()) {
			mv.addObject("urlVal", "memberView");
			mv.addObject("totalCount", totalCount);
			mv.addObject("maxPage", maxPage);
			mv.addObject("currentPage", currentPage);
			mv.addObject("startNavi", startNavi);
			mv.addObject("endNavi", endNavi);
			mv.addObject("mList", mList);
		}
		mv.setViewName("admin/adminMemberList");
		return mv;
	}
	
	@RequestMapping(value="/admin/adminMemberSort.strap", method=RequestMethod.GET)
	public ModelAndView adminMemberSorthList(ModelAndView mv 
			, @RequestParam("memberType") String memberType
			, @RequestParam(value="page", required=false) Integer page) {
		try {
			int currentPage = (page != null) ? page : 1;
			int totalCount = aService.getTotalCount("", "", memberType);
			int memberLimit = 10;
			int naviLimit = 5;
			int maxPage = (int)((double)totalCount/memberLimit + 0.9);
			int startNavi = ((int)((double)currentPage/naviLimit+0.9)-1)*naviLimit+1;
			int endNavi = startNavi + naviLimit - 1;
			
			if(maxPage < endNavi) {endNavi = maxPage;}
			
			List<Member> mList = aService.printAllBySort(memberType, currentPage, memberLimit);
			if(!mList.isEmpty()) {
				mv.addObject("mList", mList);
				System.out.println("not emplty");
			}else {
				mv.addObject("mList", null);
				System.out.println("emplty");
			}
			mv.addObject("urlVal", "adminMemberSort");
			mv.addObject("totalCount", totalCount);
			mv.addObject("maxPage", maxPage);
			mv.addObject("currentPage", currentPage);
			mv.addObject("startNavi", startNavi);
			mv.addObject("endNavi", endNavi);
			mv.addObject("memberType", memberType);
			mv.setViewName("admin/adminMemberList");
		} catch (Exception e) {
			mv.addObject("msg", e.toString()).setViewName("common/errorPage");
		}
		return mv;
	}
	
	@RequestMapping(value="/admin/adminMemberSearch.strap", method=RequestMethod.GET)
	public ModelAndView adminMemberSearchList(ModelAndView mv 
			, @RequestParam("searchCondition") String searchCondition
			, @RequestParam("searchValue") String searchValue
			, @RequestParam("memberType") String memberType
			, @RequestParam(value="page", required=false) Integer page) {
		try {
			int currentPage = (page != null) ? page : 1;
			int totalCount = aService.getTotalCount(searchCondition, searchValue, memberType);
			int memberLimit = 10;
			int naviLimit = 5;
			int maxPage = (int)((double)totalCount/memberLimit + 0.9);
			int startNavi = ((int)((double)currentPage/naviLimit+0.9)-1)*naviLimit+1;
			int endNavi = startNavi + naviLimit - 1;
			
			if(maxPage < endNavi) {endNavi = maxPage;}
			
			List<Member> mList = aService.printAllByValue(searchCondition, searchValue, memberType, currentPage, memberLimit);
			if(!mList.isEmpty()) {
				mv.addObject("mList", mList);
			}else {
				mv.addObject("mList", null);
			}
				mv.addObject("urlVal", "adminMemberSearch");
				mv.addObject("totalCount", totalCount);
				mv.addObject("searchCondition", searchCondition);
				mv.addObject("searchValue", searchValue);
				mv.addObject("maxPage", maxPage);
				mv.addObject("currentPage", currentPage);
				mv.addObject("startNavi", startNavi);
				mv.addObject("endNavi", endNavi);
				mv.addObject("memberType", memberType);
				mv.setViewName("admin/adminMemberList");
		} catch (Exception e) {
			mv.addObject("msg", e.toString()).setViewName("common/errorPage");
		}
		return mv;
	}
	
	@RequestMapping(value="/admin/memberDetail.strap", method=RequestMethod.POST)
	public ModelAndView adminMemberSearchList(
			ModelAndView mv
			,@RequestParam("memberId") String memberId){
		System.out.println("memberId : " + memberId);
		Member member;
		mv.setViewName("/admin/adminMemberDetail");
		return mv;
	}
}
