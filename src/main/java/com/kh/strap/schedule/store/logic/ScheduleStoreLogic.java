package com.kh.strap.schedule.store.logic;

import java.util.List;

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
	public List<Schedule> selectAllSchedule(SqlSession session, String memberId) {
		List<Schedule> scList = session.selectList("ScheduleMapper.selectAllSchedule", memberId);
		return scList;
	}

}
