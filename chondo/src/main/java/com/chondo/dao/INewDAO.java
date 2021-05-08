package com.chondo.dao;

import java.util.List;

import com.chondo.model.NewModel;

public interface INewDAO extends GenericDAO<NewModel> {
	List<NewModel> findAll();
}
