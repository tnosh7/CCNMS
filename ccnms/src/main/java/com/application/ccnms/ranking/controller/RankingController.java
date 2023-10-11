package com.application.ccnms.ranking.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.application.ccnms.ranking.service.RankingService;

@Controller
@RequestMapping("/ranking")
public class RankingController {
	@Autowired
	private RankingService rankingService;


	@GetMapping("/")
	public ModelAndView ranking()throws Exception {
		ModelAndView mv = new ModelAndView();
		mv.addObject("rankingList", rankingService.getRankingList());
		
		
		return new ModelAndView("/ranking");
	
	
	
	
	}






}