package com.example.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.example.model.Criteria;
import com.example.model.PointVO;
import com.example.model.StudyMemberVO;
import com.example.model.StudyVO;

@Mapper //이 어노테이션으로 StudyDao의 구현체를 마이바티스가 대신 구현.
public interface StudyDao {
	public List<StudyVO> getList(Criteria cri);
	
	public List<Map<String, Object>> getMyStudyList(String id);
	
	public int add(StudyVO study);

	public void groupJoin(StudyMemberVO studyMember);
	
	public int isJoin(StudyMemberVO studyMember);
	
	public List<StudyMemberVO> getMemberList(long sno);
	
	public int getStudyNo(StudyVO study);
	
	public String getJoinCode(long sno);
	
	public int getTotalCount();

	public StudyVO getOne(long sno);
	
	public StudyMemberVO getMemberOne(String id, long sno);

	public void modify(StudyVO study);
	
	public int delete(String id, long sno);
	
	public int kickOut(String kickedId, long sno);
	
	public int pointUp(PointVO point);
	
	public int getPoint(long mno);
	
	public List<PointVO> getPointList(long mno);
	
	public PointVO getMno(String id, long sno);
}
