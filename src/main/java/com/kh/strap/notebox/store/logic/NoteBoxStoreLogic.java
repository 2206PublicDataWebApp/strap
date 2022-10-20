package com.kh.strap.notebox.store.logic;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kh.strap.notebox.domain.NoteBox;
import com.kh.strap.notebox.store.NoteBoxStore;

@Repository
public class NoteBoxStoreLogic implements NoteBoxStore{

	@Override
	public int selectTotalCount(SqlSession session, String searchCondition, String searchValue) {
		HashMap<String, String> paramMap = new HashMap<String, String>();
		paramMap.put("searchCondition", searchCondition);
		paramMap.put("searchValue", searchValue);
		int totalCount = session.selectOne("NoteBoxMapper.selectTotalCount", paramMap);
		return totalCount;
	}

	@Override
	public List<NoteBox> selectAllNoteBox(SqlSession session, String memberId, int currentPage, int noticeLimit) {
		int offset = (currentPage-1)*noticeLimit;
		RowBounds rowBounds = new RowBounds(offset, noticeLimit);
		List<NoteBox> nList = session.selectList("NoteBoxMapper.selectAllNoteBox", memberId, rowBounds);
		return nList;
	}

	@Override
	public NoteBox selectOneByNo(SqlSession session, Integer noteNo) {
		NoteBox noteBox = session.selectOne("NoteBoxMapper.selectOneByNo", noteNo);
		return noteBox;
	}

}
