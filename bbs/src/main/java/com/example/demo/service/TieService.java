package com.example.demo.service;

import java.util.List;

import com.example.demo.entity.Tie;

public interface TieService {
	public List<Tie> search();
	public  int  add(Tie tie);
}
