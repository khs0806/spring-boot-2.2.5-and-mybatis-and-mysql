package com.example.model;


import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class StudyVO{
	private long sno;
	private String id;
	private String sname;
	private String content;
	private String mname;
	private String location;
	private String totime;
	private String fromtime;
	private String sdate;
	private String joincode;
	private String lat;
	private String lng;
}
