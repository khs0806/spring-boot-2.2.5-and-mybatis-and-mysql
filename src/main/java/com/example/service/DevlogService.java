package com.example.service;

import java.util.List;
import java.util.Map;

public interface DevlogService {
	
	public String devlog(String date);
	
	public List<Map<String,String>> devlogSearch(String data);
	
}
