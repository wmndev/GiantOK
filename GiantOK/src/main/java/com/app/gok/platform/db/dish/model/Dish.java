package com.app.gok.platform.db.dish.model;

import java.io.Serializable;
import java.util.Date;

import org.springframework.data.annotation.Id;

public class Dish implements Serializable {


	private static final long serialVersionUID = 9065642104446543557L;
	
	@Id
	private long id;
	private String name;
	private String description;
	private String recipe;
	private Date from;
	private Date to;
	private Stats stats;
	
	public Dish(){		
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

	public String getDescription() {
		return description;
	}

	public void setDescription(String desctiption) {
		this.description = desctiption;
	}

	public String getRecipe() {
		return recipe;
	}

	public void setRecipe(String recipe) {
		this.recipe = recipe;
	}

	public Date getFrom() {
		return from;
	}

	public void setFrom(Date from) {
		this.from = from;
	}

	public Date getTo() {
		return to;
	}

	public void setTo(Date to) {
		this.to = to;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	public Stats getStats() {
		return stats;
	}

	public void setStats(Stats stats) {
		this.stats = stats;
	}
}
