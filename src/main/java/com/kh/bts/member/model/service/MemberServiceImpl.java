package com.kh.bts.member.model.service;

import javax.inject.Inject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kh.bts.acnt.model.vo.Acnt;
import com.kh.bts.member.email.MailHandler;
import com.kh.bts.member.email.TempKey;
import com.kh.bts.member.model.dao.MemberDAO;
import com.kh.bts.member.model.vo.Member;

@Service("mService")
public class MemberServiceImpl implements MemberService {
	@Autowired
	private MemberDAO mDao;

	@Inject
	private JavaMailSender mailSender;

	@Transactional
	@Override
	public int insertMember(Member vo, Acnt vo2) throws Exception {
		int result = 0;
		result = mDao.insertMember(vo, vo2);

		String key = new TempKey().getKey(12, false); // 랜덤 문자 생성
		mDao.createAuthkey(vo.getEmail(), key);
		MailHandler sendMail = new MailHandler(mailSender);
		sendMail.setSubject("메일 인증 테스트");
		sendMail.setText(new StringBuffer().append("<h1> 안녕하세요 </h1>")
				.append("<a href='http://localhost:8090/bts/emailconfirm?email=").append(vo.getEmail())
				.append("&authkey=").append(key).append("' target='blenk'>이메일 인증 확인</a>").toString());
		sendMail.setFrom("Aces.Recruited.Member@gmail.com", "BTS");
		sendMail.setTo(vo.getEmail());
		sendMail.send();

		return result;
	}
	
	@Override
	public void createTempPassword(String email, String pw) throws Exception {
		mDao.createTempPassword(email, pw);
	}
	
	@Override
	public String findPassword(Member vo) throws Exception {
		String result = null;
		if(vo.getEmail()!=null) {
			String key = new TempKey().getKey(12, false); // 랜덤 문자 생성
			mDao.createTempPassword(vo.getEmail(), key);
			MailHandler sendMail = new MailHandler(mailSender);
			sendMail.setSubject("임시 비밀번호 발급 테스트");
			sendMail.setText(new StringBuffer().append("<h1> 안녕하세요 </h1>")
					.append("<p>").append(vo.getEmail()).append("님께서 요청하신 임시 비밀번호입니다.</p>")
					.append("<p>임시 비밀번호: ").append(key).append("</p>").toString());
			sendMail.setFrom("Aces.Recruited.Member@gmail.com", "BTS");
			sendMail.setTo(vo.getEmail());
			sendMail.send();
			result = "Success";
		} else {
			result = "Fail";
		}
		return result;
	}

	@Override
	public int dupeEmail(Member vo) throws Exception{
		int result = 0;
		result = mDao.dupeEmail(vo);
		return result;
	}

	@Override
	public int dupeNick(Member vo)  throws Exception{
		int result = 0;
		result = mDao.dupeNick(vo);
		return result;
	}
	@Override
	public int checkAcntno(String acntno) {
		return mDao.checkAcntno(acntno);
	}

	@Override
	public void createAuthkey(String email, String authkey) throws Exception {
		mDao.createAuthkey(email, authkey);
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
	public Member loginMember(Member vo) throws Exception {
		return mDao.loginMember(vo);
	}
	
	// 이메일로 닉네임 가져오는 함수
	@Override
	public String returnNickname(String email) {
		return mDao.returnNickname(email);
	}

}
