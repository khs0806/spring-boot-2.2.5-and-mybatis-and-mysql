package com.example.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.model.Study;
import com.example.service.StudyService;

import lombok.extern.slf4j.Slf4j;


@Controller
@Slf4j
public class StudyController {
	
	@Autowired
	StudyService studyService;
	
	@RequestMapping("/study/detail")
	public String showDetail(Model model, long sno) {
		Study study = studyService.getOne(sno);
		model.addAttribute("study", study);
		
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
		System.out.println(study.getSdate());
		
		String newId = studyService.add(study);
		String msg = newId + "님의 스터디그룹이 추가되었습니다.";
		StringBuilder sb = new StringBuilder();
		
		sb.append("alert('"  + msg + "');");
//		sb.append("location.replace('./detail?id=" + newId + "');");
		sb.append("location.replace('./list');");
		sb.insert(0, "<script>");
		sb.append("</script>");

		return sb.toString();
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
