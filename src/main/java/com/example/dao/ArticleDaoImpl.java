package com.example.dao;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Component;

import com.example.model.Article;

@Component
public class ArticleDaoImpl implements ArticleDao {
	public List<Article> getList(){
		//하드코딩으로 데이터를 넘겨준다. 중간확인용

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
