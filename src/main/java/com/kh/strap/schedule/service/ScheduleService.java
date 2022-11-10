package com.kh.strap.schedule.service;

import java.util.List;
import java.util.Map;

import com.kh.strap.schedule.domain.Schedule;

public interface ScheduleService {
	public int registSchedule(Schedule schedule);
	public int registDaySchedule(Schedule schedule);
	public List<Schedule> printAllSchedule(String memberId);
	public int removeSchedule(Integer matchNo);
	public int modifySchedule(Schedule schedule);
	public Schedule endSchedule(Map<String, String> map);
	public int sendSurvey(Schedule schedule);
}
