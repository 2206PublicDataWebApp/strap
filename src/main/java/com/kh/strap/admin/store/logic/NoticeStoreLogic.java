package com.kh.strap.admin.store.logic;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kh.strap.admin.domain.Notice;
import com.kh.strap.admin.store.NoticeStore;

@Repository
public class NoticeStoreLogic implements NoticeStore{

	@Override
	public int insertNotice(SqlSession session, Notice notice) {
		int result = session.insert("NoticeMapper.insertNotice", notice);
		return result;
	}

	@Override
	public List<Notice> selectAllNotice(SqlSession session, int currentPage, int noticeLimit) {
		List<Notice> nList = session.selectList("NoticeMapper.selectAllNotice");
		return nList;
	}

	@Override
	public int selectTotalCount(SqlSession session, String searchCondition, String searchValue) {
		HashMap<String, String> paramMap = new HashMap<String, String>();
		paramMap.put("searchCondition", searchCondition);
		paramMap.put("searchValue", searchValue);
		int totalCount = session.selectOne("NoticeMapper.selectTotalCount", paramMap);
		return totalCount;
	}

	@Override
	public Notice selectOneByNo(SqlSession session, Integer noticeNo) {
		Notice notice = session.selectOne("NoticeMapper.selectOneByNo", noticeNo);
		return notice;
	}
	
	@Override
	public int updateNoticeCount(SqlSession session, Integer noticeNo) {
		int result = session.update("NoticeMapper.updateCount", noticeNo);
		return result;
	}



}
