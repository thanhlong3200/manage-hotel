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
	
	@OneToMany(mappedBy = "paymentType")
	private List<PaymentEntity> payments = new ArrayList<PaymentEntity>();

	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Integer getActive() {
		return active;
	}

	public void setActive(Integer active) {
		this.active = active;
	}

	public List<PaymentEntity> getPayments() {
		return payments;
	}

	public void setPayments(List<PaymentEntity> payments) {
		this.payments = payments;
	}
	
	
	
}
