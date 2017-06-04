package org.movie.model;

public class UserLoginStatus {
	
	//手机网页登陆状态 0：未登陆   1:已登陆
	private int wapLoginStatus=0;
	//pc网页登陆状态 0：未登陆 1:已登陆
	private int wwwLoginStatus=0;
	//客户端（安卓，ios） 0：未登陆 1:已登陆
	private int clientLoginStatus=0;
	//用户id
	private String uid;
	private String wapSessionID;
	private String wwwSessionID;
	private String clientSessionID;
	
	//根据门户类型获取登陆状态
	public int getLoginStatus(int clientType) {
		return 0;
	}
	//根据门户类型设置登陆状态
	public void setLoginStatus(int clientType,int status) {
		this.wapLoginStatus = status;
	}
	
	public int getWapLoginStatus() {
		return wapLoginStatus;
	}
	public void setWapLoginStatus(int wapLoginStatus) {
		this.wapLoginStatus = wapLoginStatus;
	}
	public int getWwwLoginStatus() {
		return wwwLoginStatus;
	}
	public void setWwwLoginStatus(int wwwLoginStatus) {
		this.wwwLoginStatus = wwwLoginStatus;
	}
	public int getClientLoginStatus() {
		return clientLoginStatus;
	}
	public void setClientLoginStatus(int clientLoginStatus) {
		this.clientLoginStatus = clientLoginStatus;
	}
	public String getUid() {
		return uid;
	}
	public void setUid(String uid) {
		this.uid = uid;
	}
	public String getWapSessionID() {
		return wapSessionID;
	}
	public void setWapSessionID(String wapSessionID) {
		this.wapSessionID = wapSessionID;
	}
	public String getWwwSessionID() {
		return wwwSessionID;
	}
	public void setWwwSessionID(String wwwSessionID) {
		this.wwwSessionID = wwwSessionID;
	}
	public String getClientSessionID() {
		return clientSessionID;
	}
	public void setClientSessionID(String clientSessionID) {
		this.clientSessionID = clientSessionID;
	}
	
	
}
