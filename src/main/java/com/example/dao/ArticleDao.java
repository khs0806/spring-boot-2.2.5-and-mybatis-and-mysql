package com.example.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.example.model.Article;

@Mapper //이 어노테이션으로 ArticleAdo의 구현체를 마이바티스가 대신 구현.
public interface ArticleDao {
	public List<Article> getList();

	public void add(Map<String, Object> param);
}
