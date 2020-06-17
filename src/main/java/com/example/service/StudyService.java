package com.example.service;

import java.util.List;
import java.util.Map;

import com.example.model.Study;

public interface StudyService {
	
	public List<Study> getList();
	
	public String add(Study study);
	
	public int getTotalCount();
	
	public Study getOne(long id);

	public void delete(long id);

	public void modify(Map<String, Object> param);

	public void hitUp(long id); 
	
}
