package dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import dto.MemberVO;

public interface MemberDAO {

	// 회원 조회
	List<MemberVO> selectMemberList(SqlSession session) throws SQLException;
	
}
