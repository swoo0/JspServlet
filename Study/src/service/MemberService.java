package service;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.SqlSessionFactory;

import dto.MemberVO;

public interface MemberService {

	// 회원리스트 조회
	List<MemberVO> getMemberList() throws SQLException;

}
