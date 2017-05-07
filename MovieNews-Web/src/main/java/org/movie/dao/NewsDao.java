package org.movie.dao;

import java.util.List;

import org.movie.model.News;
import org.springframework.stereotype.Repository;

@Repository
public interface NewsDao {
//    int deleteByPrimaryKey(Integer nid);
//
//    int insert(News record);
//
//    int insertSelective(News record);
//
//    News selectByPrimaryKey(Integer nid);
//
//    int updateByPrimaryKeySelective(News record);
//
//    int updateByPrimaryKey(News record);
	List<News> getList();
}