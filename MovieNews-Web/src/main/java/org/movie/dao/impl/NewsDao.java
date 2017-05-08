package org.movie.dao.impl;

import java.io.UnsupportedEncodingException;
import java.util.HashMap;
import java.util.List;

import org.movie.dao.INewsDao;
import org.movie.model.News;
import org.movie.tools.Constant;
import org.springframework.stereotype.Repository;
import org.springframework.util.StringUtils;
@Repository
public class NewsDao extends BaseDao implements INewsDao {

	public List<News> getList() {
		
		return null;
	}
	
	/**
	 * 
	 * @param start 开始
	 * @param limit 几条记录
	 * @return
	 */
	public List<News> getList(Integer begin,Integer rows) {
		String sql="News.getList";
		List<News> list=null;
		if(StringUtils.isEmpty(begin)||begin<=Constant.ZERO){
			begin=Constant.ZERO;
		}
		if(StringUtils.isEmpty(rows)||rows<=Constant.ZERO){
			rows=Constant.DEFAULTPAGESIZE;
		}
		HashMap<String, Object> paramMap = new HashMap<String,Object>();
		paramMap.put("begin", begin);
		paramMap.put("rows",rows);
		
		try {
			list=this.getSqlSession().selectList(sql, paramMap);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return list;
	}
	


}
