package org.movie.controller;

import org.movie.service.IndexService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/")
public class IndexController {
	
	@Autowired
	IndexService indexService;

	@RequestMapping("/index")
	public String index(){
		return "index";
	}
	@RequestMapping("/news")
	public String news(){
		indexService.getNewsList();
		return "index";
	}
}
