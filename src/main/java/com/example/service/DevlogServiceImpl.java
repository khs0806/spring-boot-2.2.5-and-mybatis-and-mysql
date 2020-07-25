package com.example.service;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

@Service
public class DevlogServiceImpl implements DevlogService{
	@Override
	public String devlog(String date) {
		File inFile = null;
		FileReader fr = null;
		BufferedReader br = null;
		
		// 디렉터리 안에 폴더들 이름 반환
		File file = new File("C:\\Users\\김현수\\Desktop\\khsworkspace\\diary");
		
		
		String fileName = null;
		
		// 파일명 찾기
		if (file.exists()) {
			String[] fileList = file.list();
			for (int i=0; i<fileList.length; i++) {
				if (fileList[i].contains(date)) {
					fileName = fileList[i];
				}
			}
		}
		
		// 매칭되는 파일이 없으면 널값 반환.
		if (fileName == null) {
			return fileName;
		}
		
		// 파일 내용 반환
		String str = "";
		String filePath = String.format("C:\\Users\\김현수\\Desktop\\khsworkspace\\diary\\%s",fileName);
		
		String line = "";
		try {
			inFile = new File(filePath);
			fr = new FileReader(inFile);
			br = new BufferedReader(fr);
			
			
			while((line = br.readLine()) != null) {
				str += line + "\r\n";
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return str;
	}
	
	@Override
	public List<Map<String,String>> devlogSearch(String data) {
		File inFile = null;
		FileReader fr = null;
		BufferedReader br = null;
		
		List<Map<String, String>> mapList = new ArrayList<Map<String, String>>();
		Map<String, String> map = null;
		
		// 디렉터리 안에 폴더들 이름 반환
		File file = new File("C:\\Users\\김현수\\Desktop\\khsworkspace\\diary");
		
		// 파일명 찾기
		if (file.exists()) {
			String[] fileList = file.list();
			for (int i=0; i<fileList.length; i++) {
					
					String str = "";
					String line = "";
					try {
						inFile = new File("C:\\Users\\김현수\\Desktop\\khsworkspace\\diary\\" + fileList[i]);
						fr = new FileReader(inFile);
						br = new BufferedReader(fr, 1024);
						
						// 파일 내용 반환
						while((line = br.readLine()) != null) {
							str += line + "\r\n";
						}
						
						// 사용자가 검색한 문자열과 매칭된다면 파일명 반환.
						if (str.contains(data)) {
							
							// 날짜형태로 문자포맷팅
							String format = fileList[i].substring(0, 6);
							
							String year = format.substring(0, 2);
							String month = format.substring(2, 4);
							String day = format.substring(4, 6);
							
							String date = String.format("20%s년 %s월 %s일", year,month,day);
							String devlog = String.format("20%s-%s-%s", year, month, day);
							
							// Map형태로 List에 차곡차곡 담자.
							map = new HashMap<String, String>();
							map.put("devlog",devlog);				//	2020-01-01 형태
							map.put("date",date);					//  2020년01월01일 형태
							
							mapList.add(map);
						}
						
					} catch (Exception e) {
						e.printStackTrace();
					}
			}
		}
		
		return mapList;
	}
	
}
