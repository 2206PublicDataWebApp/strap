package com.kh.strap.match.controller;


import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import com.kh.strap.member.domain.Member;
import com.kh.strap.member.service.MemberService;
import com.kh.strap.schedule.domain.Schedule;
import com.kh.strap.schedule.service.ScheduleService;
import com.kh.strap.schedule.store.ScheduleStore;

@Component
public class Scheduler {
	
	@Autowired
	private ScheduleService sService;
	@Autowired
	private MemberService mService;
	
	//매일 오전 01시에 호출
	@Scheduled(cron="55 17 17 * * *")
	public void countReset() {
		
	}
}
