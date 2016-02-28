package com.app.gok.web.controller;

import java.util.ArrayList;
import java.util.Locale;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.app.gok.platform.db.dish.model.Dish;
import com.app.gok.platform.db.dish.model.Review;
import com.app.gok.platform.db.dish.service.DishServiceImpl;
import com.app.gok.web.model.DishResponse;

@Controller
public class ReviewsController {
	
	@Autowired
	private DishServiceImpl dishServicrImpl;
	
	
	@RequestMapping(value = "/reviews",  method = RequestMethod.GET)
	public ModelAndView reviews(Locale locale) {		
		ModelAndView model = new ModelAndView("reviews");
		model.addObject("dishes", dishServicrImpl.findAllSortById());
		return model;
	}
	
	
	@RequestMapping(value = "/reviews",  params = {"id"}, method = RequestMethod.GET)
	@ResponseBody
	public DishResponse getRecipe(@RequestParam("id") long dishId) {	
		System.out.println(dishId); 
		Dish dish =  dishServicrImpl.findOneById(dishId);
		
		DishResponse response = new DishResponse();
		response.setName(dish.getName());
		response.setRecipe(dish.getRecipe());
		return response;
	}
	
	@RequestMapping(value = "/reviews",  params = {"id", "isGetReviews"}, method = RequestMethod.GET)
	@ResponseBody
	public DishResponse getReviews(@RequestParam("id") long dishId, @RequestParam("isGetReviews") boolean isGetREviews){
		Dish dish =  dishServicrImpl.findOneById(dishId);
		DishResponse response = new DishResponse();
		response.setName(dish.getName());
		response.setReviews(dish.getStats() != null ? dish.getStats().getReviews() : new ArrayList<Review>());
		
		return response;
	}
	
	@RequestMapping(value = "/postReview", method = RequestMethod.POST)
	public @ResponseBody String postReview(@RequestParam(value="dish") Long dishRef,
			@RequestParam(value="name") String userName,
			@RequestParam(value="review") String reviewText,
			@RequestParam(value="rate") Integer rate) {
		dishServicrImpl.addReviewToDish(dishRef, userName, reviewText, rate);
		return "OK";
	}
	
	

}
