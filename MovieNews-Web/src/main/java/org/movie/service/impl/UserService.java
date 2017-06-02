package org.movie.service.impl;

import org.movie.model.User;
import org.movie.service.IUserService;
import org.springframework.stereotype.Service;
@Service
public class UserService implements IUserService{
	
	/**
	 * 获取用户信息 
	 * 可以根据id 手机号 用户名 邮箱获取
	 */
	@Override
	public User getUserInfo(User user) {
		return null;
	}

}
