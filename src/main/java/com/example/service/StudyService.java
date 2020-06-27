package com.example.service;

import java.util.List;
import java.util.Map;

import com.example.model.Criteria;
import com.example.model.PointVO;
import com.example.model.StudyMemberVO;
import com.example.model.StudyVO;

public interface StudyService {
	
	public List<StudyVO> getList(Criteria cri);
	
	public List<Map<String, Object>> getMyStudyList(String id);
	
	public StudyMemberVO add(StudyVO study);
	
	public void groupJoin(StudyMemberVO StudyMember,String code) throws Exception;
	
	public boolean isJoin(StudyMemberVO StudyMember);
	
	public List<StudyMemberVO> getMemberList(long sno);
	
	public StudyMemberVO getMemberOne(String id, long sno);
	
	public int getTotalCount();
	
	public StudyVO getOne(long sno);
	
	public void modify(StudyVO study);
	
	public int delete(String id, long sno);
	
	public int kickOut(String id, long sno, String kickedId);
	
	public int groupOut(String id, long sno);
	
	public int pointUp(PointVO point);
	
	public int getPoint(long mno);
	
	public List<PointVO> getPointList(long mno);
}
