package org.movie.controller;

import org.movie.model.User;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;


/**
 * 登陆相关
 * @author s
 *
 */
@Controller
@RequestMapping("/")
public class LoginController {
	
	@RequestMapping("/login")
	public void login(User user){
		
	}
}
