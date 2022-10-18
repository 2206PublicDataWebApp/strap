package com.kh.strap.admin.service;

import java.util.List;

import com.kh.strap.admin.domain.Notice;

public interface NoticeService {
	public int registerNotice(Notice notice);
	public int modifyNotice(Notice notice);
	public int removeOneByNo(Integer noticeNo);
	public List<Notice> printNoticeList(int currentPage, int noticeLimit);
	public int getTotalCount(String searchCondition, String searchValue);
	public Notice printOneByNo(Integer noticeNo);
	public List<Notice> printAllByValue(String searchCondition, String searchValue, int currentPage, int noticeLimit);
	public int viewUp(Integer noticeNo);
}
