package org.movie.controller;

import java.util.List;

import org.movie.model.News;
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

	@RequestMapping("/index")
	public String index() {
		return "index";
	}
	@RequestMapping("/freemarker")
	public String freemaker(Model model) {
		model.addAttribute("user", "hello");
		return "temp";
	}
	
}
