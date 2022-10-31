package com.kh.strap.schedule.service.logic;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.strap.schedule.domain.Schedule;
import com.kh.strap.schedule.service.ScheduleService;
import com.kh.strap.schedule.store.ScheduleStore;

@Service
public class ScheduleServiceImpl implements ScheduleService {
	
	@Autowired
	private SqlSession session;
	@Autowired
	private ScheduleStore scStore;
	
	@Override
	public int registSchedule(Schedule schedule) {
		int result = scStore.insertSchedule(session, schedule);
		return result;
	}

	@Override
	public int registDaySchedule(Schedule schedule) {
		int result = scStore.insertDaySchedule(session, schedule);
		return result;
	}

	@Override
	public List<Schedule> printAllSchedule(String memberId) {
		List<Schedule> scList = scStore.selectAllSchedule(session, memberId);
		return scList;
	}

	@Override
	public int removeSchedule(Integer matchNo) {
		int result = scStore.deleteSchedule(session, matchNo);
		return result;
	}

	@Override
	public int modifySchedule(Schedule schedule) {
		int result = scStore.updateSchedule(session, schedule);
		return result;
	}
	
	
}
