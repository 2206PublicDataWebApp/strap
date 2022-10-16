package com.kh.strap.admin.service;

import java.util.List;

import com.kh.strap.admin.domain.Notice;

public interface NoticeService {
	public int registerNotice(Notice notice);
	public List<Notice> printNoticeList(int currentPage, int noticeLimit);
	public int getTotalCount(String searchCondition, String searchValue);
	public Notice printOneByNo(Integer noticeNo);
	public int viewUp(Integer noticeNo);
}
