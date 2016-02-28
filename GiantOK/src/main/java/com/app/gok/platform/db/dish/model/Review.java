package com.app.gok.platform.db.dish.model;

import java.io.Serializable;

public class Review implements Serializable {

	private static final long serialVersionUID = -7313811787956686502L;
	
	
	private String userName;
	
	private String review;
	
	private int rate;
	
	public Review(){}
	
	public Review(String userName, String review, int rate){
		this.userName = userName;
		this.review = review;
		this.rate = rate;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getReview() {
		return review;
	}

	public void setReview(String review) {
		this.review = review;
	}

	public int getRate() {
		return rate;
	}

	public void setRate(int rate) {
		this.rate = rate;
	}

}
