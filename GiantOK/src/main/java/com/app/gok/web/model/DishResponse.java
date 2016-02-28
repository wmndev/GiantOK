package com.app.gok.web.model;

import java.util.List;

import com.app.gok.platform.db.dish.model.Review;

public class DishResponse {
	
	String name;
	String Recipe;
	List<Review> reviews;
	
	public List<Review> getReviews() {
		return reviews;
	}
	public void setReviews(List<Review> reviews) {
		this.reviews = reviews;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getRecipe() {
		return Recipe;
	}
	public void setRecipe(String recipe) {
		Recipe = recipe;
	}
	
	

}
