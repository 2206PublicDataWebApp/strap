package com.kh.strap.qna.service;

import java.util.List;

import com.kh.strap.qna.domain.Qna;

public interface QnaService {
	public int registerQna(Qna qna);
	public List<Qna> printAllQna(String memberId);
	public int modifyQna(Qna qna);
	public Qna printOneById(Qna qna);
	public int removeQna(Integer qnaNo);
}
