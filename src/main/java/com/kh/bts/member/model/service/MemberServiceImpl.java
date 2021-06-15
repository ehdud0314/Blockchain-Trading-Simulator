package com.kh.bts.member.model.service;

import javax.inject.Inject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kh.bts.member.email.MailHandler;
import com.kh.bts.member.email.TempKey;
import com.kh.bts.member.model.dao.MemberDAO;
import com.kh.bts.member.model.vo.Member;

@Service("mService")
public class MemberServiceImpl implements MemberService{
	@Autowired
	private MemberDAO mDao;

	@Inject
	private JavaMailSender mailSender;

	@Transactional
	@Override
	public int insertMember(Member vo) throws Exception{
		int result = 0;
		result=mDao.insertMember(vo);
		
		String key = new TempKey().getKey(50, false); // 랜덤 문자 생성
		mDao.createAuthkey(vo.getEmail(), key); 
		MailHandler sendMail = new MailHandler(mailSender);
		sendMail.setSubject("메일 인증 테스트");
		sendMail.setText(
				new StringBuffer().append("<h1> 안녕하세요 </h1>").append("<a href='http://localhost:8090/bts/emailConfirm?email=").append(vo.getEmail()).append("&authkey=").append(key).append("' target='blenk'>이메일 인증 확인</a>").toString());
		sendMail.setFrom("Aces.Recruited.Member@gmail.com", "BTS");
		sendMail.setTo(vo.getEmail());
		sendMail.send();
	
		return result;
	}

	@Override
	public int updateMember(Member vo) {
		return mDao.updateMember(vo);
	}

	@Override
	public int deleteMember(String email) {
		return mDao.deleteMember(email);
	}

	@Override
	public void authMember(Member vo) {
		mDao.authMember(vo);
	}

	@Override
	public Member loginMember(Member vo) throws Exception{
		return mDao.loginMember(vo);
	}
	

}
