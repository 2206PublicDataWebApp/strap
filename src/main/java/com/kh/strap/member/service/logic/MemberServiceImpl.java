package com.kh.strap.member.service.logic;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.strap.member.service.MemberService;
import com.kh.strap.member.store.logic.MemberStoreLogic;


@Service
public class MemberServiceImpl implements MemberService {
	
	@Autowired
	private SqlSession session;
	@Autowired
	private MemberStoreLogic memberStore;
	
	
}
