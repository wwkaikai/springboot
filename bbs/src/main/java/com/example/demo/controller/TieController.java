package com.example.demo.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.example.demo.entity.Tie;
import com.example.demo.service.TieService;

@RestController
public class TieController {

	@Autowired
	private TieService tieService;

	@RequestMapping("tie")
	public List<Tie> search() {
		return tieService.search();
	}

}
