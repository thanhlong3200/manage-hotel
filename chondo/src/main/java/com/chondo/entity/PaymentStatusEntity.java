package com.chondo.entity;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name = "payment_status")
public class PaymentStatusEntity extends BaseEntity{
	@Column
	private String code;
	
	@Column
	private String name;
	
	@Column
	private String description;
	
	@Column
	private Integer active;
	
	@OneToMany(mappedBy = "status")
    private List<PaymentEntity> payments = new ArrayList<PaymentEntity>();
}
