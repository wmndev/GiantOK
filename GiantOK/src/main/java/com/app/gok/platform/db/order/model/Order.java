package com.app.gok.platform.db.order.model;

import java.io.Serializable;
import java.util.Date;

import org.springframework.data.annotation.Id;

public class Order implements Serializable{


	private static final long serialVersionUID = -3789764805264348825L;

	@Id
	private long id;
	private String name;
	private String email;
	private Date supplyDate;
	private Date createdDate;
	private String specialInructions;

	public Order() {
	}

	public long getId() {
		return id;
	}

	public void setId(long id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public Date getSupplyDate() {
		return supplyDate;
	}

	public void setSupplyDate(Date supplyDate) {
		this.supplyDate = supplyDate;
	}

	public Date getCreatedDate() {
		return createdDate;
	}

	public void setCreatedDate(Date createdDate) {
		this.createdDate = createdDate;
	}

	public String getSpecialInructions() {
		return specialInructions;
	}

	public void setSpecialInructions(String specialInructions) {
		this.specialInructions = specialInructions;
	}
}
