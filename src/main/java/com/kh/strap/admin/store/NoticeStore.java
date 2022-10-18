package com.kh.strap.admin.store;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.kh.strap.admin.domain.Notice;

public interface NoticeStore {
	public int insertNotice(SqlSession session, Notice notice);
	public int updateNotice(SqlSession session, Notice notice);
	public int deleteOneByNo(SqlSession session, Integer noticeNo);
	public List<Notice> selectAllNotice(SqlSession session, int currentPage, int noticeLimit);
	public int selectTotalCount(SqlSession session, String searchCondition, String searchValue);
	public Notice selectOneByNo(SqlSession session, Integer noticeNo);
	public List<Notice> selectAllByValue(SqlSession session, String searchCondition, String searchValue, int currentPage, int noticeLimit);
	public int updateNoticeCount(SqlSession session, Integer noticeNo);
}
