package com.jsp.service;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.jsp.dto.MemberVO;

public interface MemberService {
	
	// 회원리스트 조회
	List<MemberVO> getMemberList() throws SQLException;
	
	// 회원정보 조회
	MemberVO getMember(String id) throws SQLException;
}
