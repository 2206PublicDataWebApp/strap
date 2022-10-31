package com.kh.strap.match.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import com.kh.strap.match.service.MatchService;

@Component
public class Scheduler {
	
	@Autowired
	private MatchService mService;
	
	//매일 오전 01시에 호출
//	@Scheduled(cron="00 00 1 * * *")
//	public void countReset() {
//		//스케줄러 사용을 위해 파라미터를 비워야한다.
//		System.out.println("새로고침 초기화 스케줄 동작");
//		System.out.println("새로고침 초기화 스케줄 동작 완료 ");
//	}
}
