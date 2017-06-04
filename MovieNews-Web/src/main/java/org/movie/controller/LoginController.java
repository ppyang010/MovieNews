package org.movie.controller;

import java.util.concurrent.TimeoutException;

import javax.servlet.http.HttpServletRequest;

import net.rubyeye.xmemcached.MemcachedClient;
import net.rubyeye.xmemcached.exception.MemcachedException;

import org.apache.log4j.Logger;
import org.movie.model.ResultEnumCode;
import org.movie.model.ResultInfo;
import org.movie.model.User;
import org.movie.service.IUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;


/**
 * 登陆相关
 * @author s
 *
 */
@Controller
@RequestMapping("/")
public class LoginController {
	
	private Logger logger=Logger.getLogger(LoginController.class);
	
	@Autowired
	MemcachedClient memcacahedClient;
	
	@Autowired
	IUserService userService;
	
	@ResponseBody
	@RequestMapping("/login")
	public ResultInfo login(User user,HttpServletRequest request){
		ResultInfo resultInfo = new ResultInfo();
		
		if(StringUtils.isEmpty(user.getEmail()) && StringUtils.isEmpty(user.getPhone()) 
				&& StringUtils.isEmpty(user.getUsername()) ){
			logger.error("param  is null !!!!!!");
			resultInfo.setResultInfo(ResultEnumCode.PARAM_IS_NULL);
		}
		
		User userInfo = userService.getUserInfo(user);
		if(StringUtils.isEmpty(userInfo)){
			logger.error("userinfo is null ！！！！");
			resultInfo.setResultInfo(ResultEnumCode.USERINFO_IS_NULL);
		}
		
		if(userInfo.getPassword().equals(user.getPassword()) ){
			logger.debug("login success!!!!");
			request.getSession().setAttribute("userInfo", userInfo);
			try {
				Object object = memcacahedClient.get("userLoginStatus"+userInfo.getUid());
			} catch (TimeoutException | InterruptedException
					| MemcachedException e) {
				logger.error("get userLoginStatus fail !!!", e);
			}
		}else{
			logger.error("password is null ！！！！");
			resultInfo.setResultInfo(ResultEnumCode.PASSWORD_ERROR);
		}
		return resultInfo;
		
	}
}
