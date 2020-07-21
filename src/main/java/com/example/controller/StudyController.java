package com.example.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.tomcat.util.buf.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.dao.StudyDao;
import com.example.model.Criteria;
import com.example.model.PageMaker;
import com.example.model.PointVO;
import com.example.model.StudyMemberVO;
import com.example.model.StudyVO;
import com.example.service.StudyService;

import lombok.extern.slf4j.Slf4j;


@Controller
@Slf4j
public class StudyController {
	
	@Autowired
	StudyService studyService;
	
	@Autowired
	PageMaker pageMaker;
	
	// 스터디 목록 가져오기
	@RequestMapping("/study/list")
	public String showList(Model model, Criteria cri) {
		List<StudyVO> list = studyService.getList(cri);
		
		model.addAttribute("list", list);
		model.addAttribute("cri", cri);
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(studyService.getTotalCount());
		model.addAttribute("pageMaker", pageMaker);

		return "study/list";
	}
	
	// 스터디 상세보기
	@RequestMapping("/study/detail")
	public String showDetail(Model model, long sno, HttpSession session, StudyMemberVO studyMember) {
		StudyVO study = studyService.getOne(sno);
		List<StudyMemberVO> memberList = studyService.getMemberList(sno);
		
		studyMember.setId((String)session.getAttribute("loginedMemberId"));
		studyMember.setSno(sno);
		boolean result = studyService.isJoin(studyMember);
		
		model.addAttribute("study", study);
		model.addAttribute("memberList", memberList);
		model.addAttribute("isJoin", result);
		return "study/detail";
	}

	// 스터디 추가 화면 출력하기
	@RequestMapping(value="/study/add", method=RequestMethod.GET)
	public String showAdd() {
	
		return "study/add";
	}
	
	// 스터디 추가하기
	@ResponseBody
	@RequestMapping(value="/study/doAdd", method=RequestMethod.POST)
	public String doAdd(StudyVO study) {
		System.out.println(study.toString());
		StudyMemberVO member = studyService.add(study);
		String id = member.getId();
		long sno = member.getSno();
		
		String msg = id + "님의 스터디그룹이 추가되었습니다.";
		StringBuilder sb = new StringBuilder();
		
		sb.append("alert('"  + msg + "');");
		sb.append("location.replace('./detail?sno=" + sno + "');");
//		sb.append("location.replace('./list');");
		sb.insert(0, "<script>");
		sb.append("</script>");

		return sb.toString();
	}
	
	// 스터디 수정화면 출력하기
	@RequestMapping(value="/study/modify", method=RequestMethod.GET)
	public String showModify(Model model, long sno) {
		StudyVO study = studyService.getOne(sno);
		model.addAttribute("study", study);
		
		return "study/modify";
	}

	// 스터디 수정하기
	@ResponseBody
	@RequestMapping(value="/study/doModify", method=RequestMethod.POST)
	public String doModify(StudyVO study, long sno) {
		
		studyService.modify(study);
		StringBuilder sb = new StringBuilder();
		
		sb.append("alert('스터디가 수정되었습니다.');");
		sb.append("location.replace('./detail?sno=" + sno + "');");
		sb.insert(0, "<script>");
		sb.append("</script>");
		
		return sb.toString();
	}
	
	
	
	// 스터디 그룹가입 AJAX 통신방식. 
	@ResponseBody
	@RequestMapping(value="/study/join", method=RequestMethod.POST)
	public ResponseEntity<String> joinGroup(String code, StudyMemberVO studyMember, HttpSession session) {
		
		String id = (String) session.getAttribute("loginedMemberId");
		studyMember.setId(id);
		
		ResponseEntity<String> entity = null;
		try {
			studyService.groupJoin(studyMember,code);
			entity = new ResponseEntity<String>("SUCCESS",HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<>(e.getMessage(),HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
	
	// 스터디 삭제하기
	@ResponseBody
	@RequestMapping("/study/doDelete")
	public String doDelete(long sno, HttpSession session) {
		String id = (String) session.getAttribute("loginedMemberId");
		int result = studyService.delete(id, sno);
		StringBuilder sb = new StringBuilder();
			
		if (result > 0) {
			sb.append("alert('스터디가 삭제되었습니다.');");
			sb.append("location.replace('./list');");
			sb.insert(0, "<script>");
			sb.append("</script>");
		} else {
			sb.append("alert('스터디장만 삭제할 수 있습니다..');");
			sb.append("location.replace('./list');");
			sb.insert(0, "<script>");
			sb.append("</script>");
		}
		
		return sb.toString();
	}
	
	// 스터디 회원 추방하기
	@ResponseBody
	@RequestMapping(value="/study/kickout", method=RequestMethod.POST)
	public String kickOut(long sno, String kickedId, HttpSession session) {
		
		String response = null;
		
		String id = (String) session.getAttribute("loginedMemberId");
		int result = studyService.kickOut(id, sno, kickedId);
		if (result > 0) {
			response = "success";
		} else {
			response = "fail";
		}
		return response;
	}
	
	// 스터디 탈퇴하기
	@ResponseBody
	@RequestMapping(value="/study/groupout", method=RequestMethod.POST)
	public String groupOut(long sno, HttpSession session) {
		
		String id = (String) session.getAttribute("loginedMemberId");
		String result = Integer.toString(studyService.groupOut(id, sno));
		
		return result;
	}
	
	// 포인트 부여화면 출력하기
	@RequestMapping(value="/study/pointview", method=RequestMethod.GET)
	public String pointView(long sno, StudyMemberVO member, Model model, HttpSession session) {
		
		// 이 URL에 접근한 회원이 스터디장이 아닐 경우 "/"로 리다이렉트
		StudyVO study = studyService.getOne(sno);
		String studyId = study.getId();
		String loginedId = (String) session.getAttribute("loginedMemberId");
		if (!studyId.equals(loginedId)) {
			return "redirect:/";
		}
		
		member = studyService.getMemberOne(member.getId(), sno);
		long mno = member.getNo();
		List<PointVO> pointList = studyService.getPointList(mno);
		int point = studyService.getPoint(mno);
		
		model.addAttribute("member", member);
		model.addAttribute("pointList", pointList);
		model.addAttribute("point", point);
		model.addAttribute("sno", sno);
		
		return "study/pointUp";
	}
	
	// 포인트 부여
	@ResponseBody
	@RequestMapping(value="/study/pointup", method=RequestMethod.POST)
	public String pointUp(PointVO point, String id, long sno) {
		
		StudyMemberVO member = studyService.getMemberOne(id, sno);
		long mno = member.getNo();
		point.setMno(mno);
		
		studyService.pointUp(point);
		
		StringBuilder sb = new StringBuilder();
		sb.append("alert('포인트가 반영되었습니다.');");
		sb.append("location.replace('./pointview?sno="+ sno + "&id=" + id + "');");
		sb.insert(0, "<script>");
		sb.append("</script>");
		
		return sb.toString();
	}
	// 나의 스터디 목록 보기
	@RequestMapping("/study/mystatus")
	public String myStudyStatus(HttpSession session, Model model) {
		
		String id = (String) session.getAttribute("loginedMemberId");
		List<Map<String,Object>> myStudyList = studyService.getMyStudyList(id);
		System.out.println(myStudyList.toString());
		model.addAttribute("myList",myStudyList);
		
		return "study/myStudyView";
	}
	// 나의 스터디 포인트 보기
	@RequestMapping("/study/mypoint")
	public String myPointStatus(long sno, HttpSession session, Model model) {
		
		String id = (String) session.getAttribute("loginedMemberId");
		
		StudyVO study = studyService.getOne(sno);
		StudyMemberVO member = studyService.getMemberOne(id, sno);
		long mno = member.getNo();
		List<PointVO> pointList = studyService.getPointList(mno);
		
		model.addAttribute("study", study);
		model.addAttribute("point", pointList);
		
		return "study/myPointView";
	}
}
