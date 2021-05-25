package com.chondo.entity;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name = "payment_type")
public class PaymentTypeEntity extends BaseEntity{
	@Column
	private String code;
	
	@Column
	private String name;
	
	@Column
	private Integer active;
	
	@OneToMany(mappedBy = "type")
	private List<PaymentEntity> payments = new ArrayList<PaymentEntity>();
	
}
