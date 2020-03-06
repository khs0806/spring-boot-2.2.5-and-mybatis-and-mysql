package com.example.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.dao.ArticleDao;
import com.example.model.Article;

@Service
public class ArticleServiceImpl implements ArticleService {
	

	
	// 이제 ArticleService 데이터 관련 모두를 Dao에게 위임
	@Autowired
	ArticleDao articleDao;

	public List<Article> getList() {
		return articleDao.getList();	
  	}
	
	
}
