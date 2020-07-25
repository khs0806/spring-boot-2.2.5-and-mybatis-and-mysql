package com.example.service;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;
import java.util.Scanner;

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
		
		// 파일명 찾기
		if (file.exists()) {
			String[] fileList = file.list();
			for (int i=0; i<fileList.length; i++) {
				if (fileList[i].contains(date)) {
					date = fileList[i];
					System.out.println(date);
				}
			}
		}
		
		// 파일 내용 반환
		String str = "";
		String fileName = String.format("C:\\Users\\김현수\\Desktop\\khsworkspace\\diary\\%s",date);
		
		System.out.println(fileName);
		String line = "";
		try {
			inFile = new File(fileName);
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
}
