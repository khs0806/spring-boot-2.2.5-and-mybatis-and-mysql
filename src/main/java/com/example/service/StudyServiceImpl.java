package com.example.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.dao.StudyDao;
import com.example.model.Study;
import com.example.model.StudyMember;
import com.example.util.CUtil;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class StudyServiceImpl implements StudyService {
	
	// 이제 StudyService 데이터 관련 모두를 Dao에게 위임
	@Autowired
	StudyDao studyDao;
	
	@Override
	public List<Study> getList() {
		return studyDao.getList();	
  	}
	
	@Override
	public String add(Study study) {
		int result = studyDao.add(study);
		int no = studyDao.getStudyNo(study);
		if (result == 1) {
			StudyMember studyMember = new StudyMember();
			studyMember.setSno(no);
			studyMember.setId(study.getId());
			studyDao.join(studyMember);
		}
		String id = (String) study.getId();
		return id;
	}
	
	@Override
	public List<StudyMember> getMemberList(long sno) {
		List<StudyMember> studyList = studyDao.getMemberList(sno);
		return studyList;
	}

	@Override
	public int getTotalCount() {
		return studyDao.getTotalCount();
	}

	@Override
	public Study getOne(long id) {
		
		return studyDao.getOne(id);
	}

	@Override
	public void delete(long id) {
		studyDao.delete(id);
	}

	@Override
	public void modify(Map<String, Object> param) {
		studyDao.modify(param);
	}
}
