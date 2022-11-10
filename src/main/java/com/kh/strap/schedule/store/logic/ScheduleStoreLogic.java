package com.kh.strap.schedule.store.logic;

import java.util.Date;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kh.strap.schedule.domain.Schedule;
import com.kh.strap.schedule.store.ScheduleStore;

@Repository
public class ScheduleStoreLogic implements ScheduleStore{

	@Override
	public int insertSchedule(SqlSession session, Schedule schedule) {
		int result = session.insert("ScheduleMapper.insertSchedule",schedule);
		return result;
	}

	@Override
	public int insertDaySchedule(SqlSession session, Schedule schedule) {
		int result = session.insert("ScheduleMapper.insertDaySchedule",schedule);
		return result;
	}

	@Override
	public List<Schedule> selectAllSchedule(SqlSession session, String memberId) {
		List<Schedule> scList = session.selectList("ScheduleMapper.selectAllSchedule", memberId);
		return scList;
	}

	@Override
	public int deleteSchedule(SqlSession session, Integer matchNo) {
		int result = session.delete("ScheduleMapper.deleteSchedule", matchNo);
		return result;
	}

	@Override
	public int updateSchedule(SqlSession session, Schedule schedule) {
		int result = session.update("ScheduleMapper.updateSchedule", schedule);
		return result;
	}

	@Override
	public Schedule endSchedule(SqlSession session, Map<String, String> map) {
		Schedule schedule = session.selectOne("ScheduleMapper.endSchedule", map);
		return schedule;
	}

	@Override
	public int sendSurvey(SqlSession session, Schedule schedule) {
		int result1 = session.update("ScheduleMapper.sendSurveyOne", schedule);
		int result2 = session.update("ScheduleMapper.sendSurveyTwo", schedule);
		return result1;
	}

}
