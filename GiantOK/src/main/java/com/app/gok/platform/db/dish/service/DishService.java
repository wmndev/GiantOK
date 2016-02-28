package com.app.gok.platform.db.dish.service;

import java.util.Date;
import java.util.List;

import com.app.gok.platform.db.dish.model.Dish;

public interface DishService {
	
	void addNewDish(String name, String desc, String rec, Date from, Date to);
	
	void addReviewToDish(long dishId, String userName, String review, int rate);
	        
	List<Dish> findAllSortById();
	
	Dish findOneById(long dishId);
	
	Dish findLastDish();

}
