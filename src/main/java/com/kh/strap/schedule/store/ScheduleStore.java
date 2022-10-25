package com.kh.strap.schedule.store;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.kh.strap.schedule.domain.Schedule;

public interface ScheduleStore {
	public int insertSchedule(SqlSession session, Schedule schedule);
	public List<Schedule> selectAllSchedule(SqlSession session, String memberId);
}
