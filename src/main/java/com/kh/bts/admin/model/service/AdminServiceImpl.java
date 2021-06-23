package com.kh.bts.admin.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.bts.admin.model.dao.AdminDao;
import com.kh.bts.report.model.vo.Creport;

@Service("aService")
public class AdminServiceImpl implements AdminService {
	@Autowired
	private AdminDao aDao;
	
	@Override
	public int insertCreport(Creport vo) {
		return aDao.insertCreport(vo);
	}

}
