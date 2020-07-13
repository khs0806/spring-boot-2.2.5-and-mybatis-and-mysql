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
	// 게시글 목록 가져오기
	public List<StudyVO> getList(Criteria cri);
	// 내 스터디 목록 가져오기
	public List<Map<String, Object>> getMyStudyList(String id);
	// 스터디 등록하기
	public int add(StudyVO study);
	// 스터디 그룹 가입하기
	public void groupJoin(StudyMemberVO studyMember);
	// 스터디에 가입되있는지 확인
	public int isJoin(StudyMemberVO studyMember);
	// 스터디 그룹 회원 목록 확인
	public List<StudyMemberVO> getMemberList(long sno);
	// 스터디 번호 가져오기
	public int getStudyNo(StudyVO study);
	// 가입코드 가져오기
	public String getJoinCode(long sno);
	// 총 게시물 수 가져오기
	public int getTotalCount();
	// 한개 스터디 정보 가져오기
	public StudyVO getOne(long sno);
	// 스터디 멤버 가져오기
	public StudyMemberVO getMemberOne(String id, long sno);
	// 스터디 정보 수정하기
	public void modify(StudyVO study);
	// 스터디 삭제하기
	public int delete(String id, long sno);
	// 스터디 회원 추방하기
	public int kickOut(String kickedId, long sno);
	// 스터디 포인트 부여하기
	public int pointUp(PointVO point);
	// 스터디 포인트 확인하기
	public int getPoint(long mno);
	// 내 스터디 포인트 목록확인
	public List<PointVO> getPointList(long mno);
	// 스터디 멤버 번호 가져오기
	public PointVO getMno(String id, long sno);
}
