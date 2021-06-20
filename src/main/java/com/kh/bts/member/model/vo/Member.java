package com.kh.bts.member.model.vo;

public class Member {

	private String email;

	private String nickname;

	private String authkey;
	private String auth;

	private String pw;

	private String gender;
	private String birthdate;

	private String phone;

	private String mailing;
	private String reqAgr;
	private String optAgr;

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	public String getAuthkey() {
		return authkey;
	}

	public void setAuthkey(String authkey) {
		this.authkey = authkey;
	}

	public String getAuth() {
		return auth;
	}

	public void setAuth(String auth) {
		this.auth = auth;
	}

	public String getPw() {
		return pw;
	}

	public void setPw(String pw) {
		this.pw = pw;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getBirthdate() {
		return birthdate;
	}

	public void setBirthdate(String birthdate) {
		this.birthdate = birthdate;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getMailing() {
		return mailing;
	}

	public void setMailing(String mailing) {
		this.mailing = mailing;
	}

	public String getReqAgr() {
		return reqAgr;
	}

	public void setReqAgr(String reqAgr) {
		this.reqAgr = reqAgr;
	}

	public String getOptAgr() {
		return optAgr;
	}

	public void setOptAgr(String optAgr) {
		this.optAgr = optAgr;
	}

	@Override
	public String toString() {
		return "Member [email=" + email + ", nickname=" + nickname + "]";
	}
}
