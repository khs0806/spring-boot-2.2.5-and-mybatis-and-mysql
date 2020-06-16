package com.example.service;

import java.math.BigInteger;
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
	
	// 이제 ArticleService 데이터 관련 모두를 Dao에게 위임
	@Autowired
	StudyDao studyDao;
	
	@Override
	public List<Study> getList() {
		return studyDao.getList();	
  	}
	
	@Override
	public long add(Map<String, Object> param) {
		studyDao.add(param);
		
		return CUtil.getAsLong(param.get("id"));
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
