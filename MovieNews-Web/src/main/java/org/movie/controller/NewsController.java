package org.movie.controller;

import org.movie.model.News;
import org.movie.model.PageBean;
import org.movie.service.INewsService;
import org.movie.tools.Constant;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping("/news")
@Scope(value="prototype")
public class NewsController {
	@Autowired
	INewsService newsService;
	
	@RequestMapping("/{pageNum}")
	public String list(@PathVariable("pageNum") int pageNum,Model model ) {
		if(pageNum<=0){
			pageNum=1;
		}
		PageBean<News> pageBean = newsService.getNewsListByPage(pageNum, Constant.DEFAULTPAGESIZE);
		model.addAttribute("pageBean", pageBean);
		return "list";
	}
	
}
