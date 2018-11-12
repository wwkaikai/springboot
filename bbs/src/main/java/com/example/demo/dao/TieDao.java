package com.example.demo.dao;

import java.util.List;

import com.example.demo.entity.Tie;

public interface TieDao {
	public List<Tie> search();

	public int add(Tie tie);
}
