package com.app.gok.platform.db.dish.model;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

public class Stats implements Serializable {

	private static final long serialVersionUID = 5667950850567036816L;
	
	private double totalRate;
	
	private List<Review> reviews;
	
	public Stats(){}
	
	public void addReview(String userName, String review, int rate){
		if (reviews == null){
			reviews = new ArrayList<>();
		}
		reviews.add(new Review(userName, review, rate));
		updateTotalRate();
	}
	
	private void updateTotalRate() {
		double total= 0;
		for (Review review : reviews){
			total+=review.getRate();
		}
		setTotalRate(total/reviews.size());
	}

	public double getTotalRate() {
		return totalRate;
	}

	public void setTotalRate(double totalRate) {
		this.totalRate = totalRate;
	}

	public List<Review> getReviews() {
		return reviews;
	}

	public void setReviews(List<Review> reviews) {
		this.reviews = reviews;
	}


	

}
