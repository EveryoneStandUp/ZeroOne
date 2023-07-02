package com.example.teamplaying.domain;

import lombok.Data;

import java.time.LocalDateTime;

@Data
public class RunningBoard {
	// db에 존재하는 필드
	private Integer id;
	private String title;
	private String body;
	private LocalDateTime inserted;
	private String writer;
	// private List<String> fileName;
	private LocalDateTime time;
	
	private double Lat;
	private double Lng;
	private String address;
	
	private Integer people;
	private Integer currentNum;
	
	private String userId; // 호스트 ==> get 화면에서 가져올 수 있음
	private String memberId; // 게스트
	
	
}