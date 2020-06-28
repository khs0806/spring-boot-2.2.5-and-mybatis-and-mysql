package com.example.model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class PointVO {
	private long no;
	private long mno;
	private long score;
	private String reason;
	private String gdate;
}
