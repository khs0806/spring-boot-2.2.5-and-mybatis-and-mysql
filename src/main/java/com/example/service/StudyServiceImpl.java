package com.example.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.dao.StudyDao;
import com.example.model.Study;
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
		studyDao.add(study);
		String id = (String) study.getId();
		return id;
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

	@Override
	public void hitUp(long id) {
		studyDao.hitUp(id);
	}
}
