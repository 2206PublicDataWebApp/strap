package com.kh.strap.schedule.service.logic;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.strap.schedule.service.ScheduleService;
import com.kh.strap.schedule.store.logic.ScheduleStoreLogic;

@Service
public class ScheduleServiceImpl implements ScheduleService {
	
	@Autowired
	private SqlSession session;
	@Autowired
	private ScheduleStoreLogic scStore;
	
	
}
