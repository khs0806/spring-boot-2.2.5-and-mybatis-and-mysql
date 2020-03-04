package com.example.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Service;

import com.example.model.Article;

@Service
public class ArticleServiceImpl implements ArticleService {
	public List<Article> getList(){
		Article article1 = new Article(1,"2020-03-04 18:30:30", "title1", "context1");
		Article article2 = new Article(2,"2020-03-04 18:30:30", "title2", "context2");
		Article article3 = new Article(3,"2020-03-04 18:30:30", "title3", "context3");
		
		List<Article> list = new ArrayList<>();
		list.add(article3);
		list.add(article2);
		list.add(article1);
		
		return list;
	}
	
}
