package com.kh.strap.admin.service.logic;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.strap.admin.domain.Notice;
import com.kh.strap.admin.service.NoticeService;
import com.kh.strap.admin.store.logic.NoticeStoreLogic;

@Service
public class NoticeServiceImpl implements NoticeService {
	@Autowired
	private SqlSession session;
	@Autowired
	private NoticeStoreLogic nStore;
	
	@Override
	public int registerNotice(Notice notice) {
		int result = nStore.insertNotice(session, notice);
		return result;
	}

	@Override
	public List<Notice> printNoticeList(int currentPage, int noticeLimit) {
		List<Notice> nList = nStore.selectAllNotice(session, currentPage, noticeLimit);
		return nList;
	}

	@Override
	public int getTotalCount(String searchCondition, String searchValue) {
		int totalCount = nStore.selectTotalCount(session, searchCondition, searchValue);
		return totalCount;
	}

	@Override
	public Notice printOneByNo(Integer noticeNo) {
		Notice notice = nStore.selectOneByNo(session, noticeNo);
		return notice;
	}

	@Override
	public int viewUp(Integer noticeNo) {
		int result = 0;
		result = nStore.updateNoticeCount(session, noticeNo);
		return result;
	}


}
