package com.kh.strap.admin.service;

import com.kh.strap.member.domain.Member;

public interface AdminService {
	public String adminPwdById(String memberId);
	public Member adminById(String memberId);
}
