package com.kh.bts.investment.model.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.bts.investment.model.vo.Sold;
import com.kh.bts.investment.model.vo.WaitSold;

@Repository("sDao")
public class SoldDao {
	@Autowired
	private SqlSession sqlSession;

	public int insertSold(WaitSold vo) { // 글 입력
		// 체결 내역으로 옮기기
		int result1 = sqlSession.insert("sold.insertSold", vo);
		if (result1 > 0) {
			System.out.println("체결 내역으로 정상 이동");
		} else {
			System.out.println("체결 내역으로 이동 실패");
		}

		// 코인 계좌에서 빼기
		int result2 = sqlSession.update("coinacnt.afterSoldCoinAcnt", vo);
		if (result2 > 0) {
			System.out.println("코인 계좌로 삽입 성공");
		} else {
			System.out.println("코인 계좌로 삽입 실패");
		}
		// 미체결 내역 삭제
		int result3 = sqlSession.delete("waitSold.afterSoldDelete", vo);
		if (result3 > 0) {
			System.out.println("미체결 내역 삭제 성공");
		} else {
			System.out.println("미체결 내역 삭제 실패");
		}
		return result1*result2*result3;
	}
	
	
	
	
	
	

	public int deleteWaitSold(int usno) {
		return sqlSession.delete("sold.deleteSold", usno);
	}

	public List<Sold> selectList(String acntno) {
		return sqlSession.selectList("sold.selectListSold", acntno);
	}

}
