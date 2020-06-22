package com.example.service;

import java.util.List;

import com.example.model.Study;
import com.example.model.StudyMember;

public interface StudyService {
	
	public List<Study> getList();
	
	public StudyMember add(Study study);
	
	public void groupJoin(StudyMember studyMember,String code) throws Exception;
	
	public boolean isJoin(StudyMember studyMember);
	
	public List<StudyMember> getMemberList(long sno);
	
	public int getTotalCount();
	
	public Study getOne(long sno);
	
	public void modify(Study study);
	
	public int delete(String id, long sno);
	
	public int kickOut(String id, long sno, String kickedId);
}
