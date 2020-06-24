package com.example.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.example.model.Point;
import com.example.model.Study;
import com.example.model.StudyMember;

@Mapper //이 어노테이션으로 StudyDao의 구현체를 마이바티스가 대신 구현.
public interface StudyDao {
	public List<Study> getList();
	
	public List<Map<String, Object>> getMyStudyList(String id);
	
	public int add(Study study);

	public void groupJoin(StudyMember studyMember);
	
	public int isJoin(StudyMember studyMember);
	
	public List<StudyMember> getMemberList(long sno);
	
	public int getStudyNo(Study study);
	
	public String getJoinCode(long sno);
	
	public int getTotalCount();

	public Study getOne(long sno);
	
	public StudyMember getMemberOne(String id, long sno);

	public void modify(Study study);
	
	public int delete(String id, long sno);
	
	public int kickOut(String kickedId, long sno);
	
	public int pointUp(Point point);
	
	public int getPoint(long mno);
	
	public List<Point> getPointList(long mno);
	
	public Point getMno(String id, long sno);
}
