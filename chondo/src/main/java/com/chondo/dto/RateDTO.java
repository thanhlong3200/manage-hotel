package com.chondo.dto;

import com.chondo.entity.BaseEntity;

public class RateDTO extends BaseEntity{

	private String comment;
	
	private Integer vote;

	public String getComment() {
		return comment;
	}

	public void setComment(String comment) {
		this.comment = comment;
	}

	public Integer getVote() {
		return vote;
	}

	public void setVote(Integer vote) {
		this.vote = vote;
	}
	
	
}
