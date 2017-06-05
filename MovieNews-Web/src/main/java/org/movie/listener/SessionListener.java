package org.movie.listener;

import java.util.concurrent.TimeoutException;

import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;

import org.movie.model.User;
import org.movie.model.UserLoginStatus;
import org.movie.tools.ApplicationContextUtil;
import org.movie.tools.Constant;
import org.movie.tools.MySessionContext;
import org.springframework.util.StringUtils;

import net.rubyeye.xmemcached.MemcachedClient;
import net.rubyeye.xmemcached.exception.MemcachedException;

/**
 * Application Lifecycle Listener implementation class SessionListener
 *
 */
public class SessionListener implements HttpSessionListener {
	
	//自己实现的一个session上下文
	private MySessionContext sessionContext=MySessionContext.getInstance();
    /**
     * Default constructor. 
     */
    public SessionListener() {
    }

	/**
     * @see HttpSessionListener#sessionCreated(HttpSessionEvent)
     */
    public void sessionCreated(HttpSessionEvent event)  {
    	sessionContext.addSession(event.getSession());
    }

	/**
     * @see HttpSessionListener#sessionDestroyed(HttpSessionEvent)
     */
    public void sessionDestroyed(HttpSessionEvent event )  { 
    	HttpSession session=event.getSession();
    	sessionContext.delSession(session.getId());
    	User userInfo = (User) session.getAttribute("userInfo");
    	//session中有用户信息
    	if(!StringUtils.isEmpty(userInfo)){
    		MemcachedClient memcacahedClient = (MemcachedClient) ApplicationContextUtil
    				.getBean("memcachedClient");
    		//清楚缓存中的用户信息
    		try {
    			UserLoginStatus loginStatus=memcacahedClient.get("userLoginStatus"+userInfo.getUid());
    			if(StringUtils.isEmpty(loginStatus)){
					loginStatus=new UserLoginStatus();
				}else{
					loginStatus.setWwwLoginStatus(Constant.NOT_LOGGED_IN);
					loginStatus.setWwwSessionID("");
				}
    			memcacahedClient.set("userLoginStatus"+userInfo.getUid(), 60*30, loginStatus);
			} catch (TimeoutException | InterruptedException | MemcachedException e) {
				
			}
    	}
    	
    	
    	
    }
	
}
