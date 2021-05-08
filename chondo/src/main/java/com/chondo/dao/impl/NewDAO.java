package com.chondo.dao.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.chondo.dao.INewDAO;
import com.chondo.mapper.NewMapper;
import com.chondo.model.NewModel;

@Repository
public class NewDAO extends AbstractDAO<NewModel> implements INewDAO {
	
	@Override
	public List<NewModel> findAll() {
		StringBuilder sql = new StringBuilder("SELECT * FROM news");
		return query(sql.toString(), new NewMapper());
	}
}
