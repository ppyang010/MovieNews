package org.movie.controller;

import org.movie.model.News;
import org.movie.model.PageBean;
import org.movie.service.INewsService;
import org.movie.service.IndexService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/")
public class IndexController {
	@Autowired
	IndexService indexService;
	
	@Autowired
	INewsService newsService;
	
	@RequestMapping("/index")
	public String index() {
		return "index";
	}
	@RequestMapping("/temp")
	public String freemaker(Model model) {
		PageBean<News> pageBean = newsService.getNewsListByPage(1, 10);
		model.addAttribute("pageBean", pageBean);
		return "temp";
	}
	
}
