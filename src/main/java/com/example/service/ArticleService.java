package com.example.service;

import java.util.List;
import java.util.Map;

import com.example.model.Article;

public interface ArticleService {
	public List<Article> getList();
	
	public void add(Map<String, Object> param); 
	
}
