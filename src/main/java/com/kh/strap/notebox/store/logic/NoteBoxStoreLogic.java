package com.kh.strap.notebox.store.logic;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kh.strap.member.domain.Member;
import com.kh.strap.notebox.domain.NoteBox;
import com.kh.strap.notebox.store.NoteBoxStore;

@Repository
public class NoteBoxStoreLogic implements NoteBoxStore{

	@Override
	public int selectTotalCount(SqlSession session, String searchCondition, String searchValue, String memberId) {
		HashMap<String, String> paramMap = new HashMap<String, String>();
		paramMap.put("searchCondition", searchCondition);
		paramMap.put("searchValue", searchValue);
		paramMap.put("memberId", memberId);
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
	public NoteBox selectOneByNo(SqlSession session, NoteBox noteBox) {
		NoteBox nOne = session.selectOne("NoteBoxMapper.selectOneByNo", noteBox);
		return nOne;
	}

	@Override
	public Member selectOneByName(SqlSession session, String senderNick) {
		Member mOne = session.selectOne("NoteBoxMapper.selectOneByName", senderNick);
		return mOne;
	}

	@Override
	public int selectCountNoteBox(SqlSession session, String memberId) {
		int result = session.selectOne("NoteBoxMapper.selectCountNoteBox", memberId);
		return result;
	}

	@Override
	public List<NoteBox> selectAllByValue(SqlSession session, String searchCondition, String searchValue, String memberId,
			int currentPage, int noticeLimit) {
		int offset = (currentPage-1) * noticeLimit;
		RowBounds rowBounds = new RowBounds(offset, noticeLimit);
		HashMap<String, String> paramMap = new HashMap<String, String>();
		paramMap.put("searchCondition", searchCondition);
		paramMap.put("searchValue", searchValue);
		paramMap.put("memberId", memberId);
		List<NoteBox> nList = session.selectList("NoteBoxMapper.selectAllByValue", paramMap, rowBounds);
		return nList;
	}

	@Override
	public int updateCheckNote(SqlSession session, NoteBox noteBox) {
		int result = session.update("NoteBoxMapper.updateCheckNote", noteBox);
		return result;
	}

	@Override
	public int deleteNote(SqlSession session, int noteNo) {
		int result = session.delete("NoteBoxMapper.deleteNote", noteNo);
		return result;
	}


}
