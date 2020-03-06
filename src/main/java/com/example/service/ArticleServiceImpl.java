package com.example.service;

import java.math.BigInteger;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.dao.ArticleDao;
import com.example.model.Article;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class ArticleServiceImpl implements ArticleService {
	// 이제 ArticleService 데이터 관련 모두를 Dao에게 위임
	@Autowired
	ArticleDao articleDao;
	
	@Override
	public List<Article> getList() {
		return articleDao.getList();	
  	}
	
	@Override
	public long add(Map<String, Object> param) {
		articleDao.add(param);
		
		BigInteger bigIntId = (BigInteger)param.get("id");
		long newId = bigIntId.longValue();
		
		return newId;
	}
	
}
