package com.example.demo.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.demo.dao.TieDao;
import com.example.demo.entity.Tie;
import com.example.demo.service.TieService;

@Service
public class TieServiceImpl implements TieService{

	@Autowired
	TieDao tieDao;
	
	public List<Tie> search() {
		return tieDao.search();
	}

	public int add(Tie tie) {
		return 0;
	}

}
