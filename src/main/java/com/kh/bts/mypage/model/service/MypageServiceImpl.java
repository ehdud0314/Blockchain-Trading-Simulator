package com.kh.bts.mypage.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kh.bts.acnt.model.vo.Acnt;
import com.kh.bts.acnt.model.vo.CoinAcnt;
import com.kh.bts.cash.model.vo.CashLog;
import com.kh.bts.community.model.vo.Community;
import com.kh.bts.member.model.vo.Member;
import com.kh.bts.mypage.model.dao.MypageDao;
import com.kh.bts.mypage.model.vo.MyRcommunity;

@Service("myService")
public class MypageServiceImpl implements MypageService {
	@Autowired
	private MypageDao myDao;

	
	@Override
	public Member myInfo(String email) {
		return myDao.myInfo(email);
	}
	
	@Transactional
	@Override
	public int myInfoUpdate(Member vo) {
		return myDao.myInfoUpdate(vo);
	}

	
	@Transactional
	@Override
	public int passwordUpdate(Member vo) {
		return myDao.passwordUpdate(vo);
	}

	@Transactional
	@Override
	public int bankPwUpdate(Acnt vo) {
		return myDao.bankPwUpdate(vo);
	}

	@Override
	public List<Community> myCommunity(String email) {
		return myDao.myCommunity(email);
	}

	@Transactional
	@Override
	public int myDelete(String email) {
		return myDao.myDelete(email);
	}

	@Override
	public Acnt myAcnt(String email) {
		return myDao.myAcnt(email);
	}

	@Override
	public List<MyRcommunity> selectMyRcommunity(String email) {
		return myDao.selectMyRcommunity(email);
	}

	@Override
	public int myTotalCoin(Acnt vo) {
		return myDao.myTotalCoin(vo);
	}

	@Override
	public int coinListCount(Acnt vo) {
		return myDao.coinListCount(vo);
	}

	@Override
	public List<CoinAcnt> selectMyCoinAcnt(String acntno) {
		return myDao.selectMyCoinAcnt(acntno);
	}
	@Override
	public List<CashLog> selectMyCashLog(String email) {
		return myDao.selectMyCashLog(email);
	}

}
