package service;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import dao.MemberDAO;
import dto.MemberVO;

public class MemberServiceImpl implements MemberService {

	private SqlSessionFactory sqlSessionFactory;
	public void setSqlSessionFactory (SqlSessionFactory sqlSessionFactory) {
		this.sqlSessionFactory = sqlSessionFactory;
	}
	
	private MemberDAO memberDAO;
	public void setMemberDAO(MemberDAO gridDAO) {
		this.memberDAO = gridDAO;
	}
	
	@Override
	public List<MemberVO> getMemberList() throws SQLException {
		SqlSession session = sqlSessionFactory.openSession();
		
		try {
			List<MemberVO> memberList = memberDAO.selectMemberList(session);
			return memberList;
		} finally {
			session.close();
		}
	}

}
