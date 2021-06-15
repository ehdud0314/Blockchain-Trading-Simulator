package com.kh.bts.community.model.service;

import java.util.List;

import com.kh.bts.community.model.vo.Community;

public interface CommunityService {

	List<Community> selectSearch(String keyword, int searchType);

	List<Community> selectList(int startPage, int limit);

	int totalCount();

	Community selectCommunity(int chk, int cno);
	
	void insertCommunity(Community c);

	Community updateCommunity(Community c);

	void deleteCommunity(int cno);
}
