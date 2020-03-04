package com.example.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.example.model.Article;
import com.example.service.ArticleService;

import lombok.extern.slf4j.Slf4j;


@Controller
@Slf4j
public class ArticleController {
	
	@Autowired
	ArticleService articleService;
	
	@RequestMapping("/article/list")
	public String showList() {
		List<Article> list = articleService.getList();
		log.info("list: "+list);

		return "article/list";
	}
}
