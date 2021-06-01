package com.chondo.entity;

import java.sql.Date;
import java.util.ArrayList;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name = "promotions")
public class PromotionEntity extends BaseEntity {
	@Column
	private String code;
	
	@Column
	private String name;
	
	@Column
	private Integer value;
	
	@Column
	private String description;
	
	@Column(name = "date_begin")
	private Date dateBegin;
	
	@Column(name = "date_end")
	private Date dateEnd;
	
	@OneToMany(mappedBy = "promotion")
	private List<RoomTypeEntity> roomTypes = new ArrayList<RoomTypeEntity>();
	
	
}
