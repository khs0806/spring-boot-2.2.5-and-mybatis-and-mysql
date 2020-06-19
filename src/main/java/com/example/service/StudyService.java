package com.example.service;

import java.util.List;
import java.util.Map;

import com.example.model.Study;
import com.example.model.StudyMember;

public interface StudyService {
	
	public List<Study> getList();
	
	public String add(Study study);
	
	public List<StudyMember> getMemberList(long sno);
	
	public int getTotalCount();
	
	public Study getOne(long id);

	public void delete(long id);

	public void modify(Map<String, Object> param);
}
