package com.kh.strap.match.service.logic;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.strap.match.service.MatchService;
import com.kh.strap.match.store.logic.MatchStoreLogic;



@Service
public class MatchServiceImpl implements MatchService {
	
	@Autowired
	private SqlSession session;
	@Autowired
	private MatchStoreLogic mStore;
	
	
}
