package com.example.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

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
import com.example.model.Study;
import com.example.model.StudyMember;
import com.example.service.StudyService;

import lombok.extern.slf4j.Slf4j;


@Controller
@Slf4j
public class StudyController {
	
	@Autowired
	StudyService studyService;
	
	@RequestMapping("/study/detail")
	public String showDetail(Model model, long sno, HttpSession session, StudyMember studyMember) {
		Study study = studyService.getOne(sno);
		List<StudyMember> memberList = studyService.getMemberList(sno);
		
		studyMember.setId((String)session.getAttribute("loginedMemberId"));
		studyMember.setSno(sno);
		boolean result = studyService.isJoin(studyMember);
		
		model.addAttribute("study", study);
		model.addAttribute("memberList", memberList);
		model.addAttribute("isJoin", result);
		return "study/detail";
	}
	
	@RequestMapping("/study/modify")
	public String showModify(Model model, long id) {
		Study study = studyService.getOne(id);
		model.addAttribute("study", study);
		
		return "study/modify";
	}
	
	@RequestMapping("/study/list")
	public String showList(Model model) {
		List<Study> list = studyService.getList();
		int totalCount = studyService.getTotalCount();
		
		model.addAttribute("list", list);
		model.addAttribute("totalCount", totalCount);

		return "study/list";
	}
	
	@RequestMapping("/study/add")
	public String showAdd() {
	
		return "study/add";
	}
	
	@ResponseBody
	@RequestMapping("/study/doAdd")
	public String doAdd(Study study) {
		StudyMember member = studyService.add(study);
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
	
	// 스터디 그룹가입 AJAX 통신방식. 
	@ResponseBody
	@RequestMapping(value="/study/join", method=RequestMethod.POST)
	public ResponseEntity<String> joinGroup(String code, StudyMember studyMember, HttpSession session) {
		
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
	
	@ResponseBody
	@RequestMapping("/study/doDelete")
	public String doDelete(long id) {
		
		studyService.delete(id);
		String msg = id + "번 게시물이 삭제되었습니다.";
		StringBuilder sb = new StringBuilder();
		
		sb.append("alert('"  + msg + "');");
		sb.append("location.replace('./list');");
		sb.insert(0, "<script>");
		sb.append("</script>");
		
		return sb.toString();
		
	}
	
	@ResponseBody
	@RequestMapping("/study/doModify")
	public String doModify(@RequestParam Map<String, Object> param, long id) {
		
		studyService.modify(param);
		String msg = id + "번 게시물이 수정되었습니다.";
		StringBuilder sb = new StringBuilder();
		
		sb.append("alert('"  + msg + "');");
		sb.append("location.replace('./modify?id=" + id + "');");
		sb.insert(0, "<script>");
		sb.append("</script>");
		
		return sb.toString();
		
	}
}
