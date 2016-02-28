package com.app.gok.web.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.app.gok.platform.db.dish.service.DishService;
import com.app.gok.platform.db.order.service.OrderService;

@Controller
public class ConsoleController {
	
	@Autowired
	private DishService dishService;
	@Autowired
	private OrderService orderService;
	
	@RequestMapping(value = "/console", method = RequestMethod.GET)
	public ModelAndView getConsole() {		
		ModelAndView model = new ModelAndView("console");
		model.addObject("dishes", dishService.findAllSortById());
		model.addObject("orders", orderService.findAllSortById());
		return model;
	}
	
	@RequestMapping(value = "/newDish", method = RequestMethod.POST)
	public @ResponseBody String newDish(@RequestParam(value="dishName") String name,
			@RequestParam(value="dishDesc") String desc,
			@RequestParam(value="dishRecipe") String rec,
			@RequestParam(value="dishFrom") String fromStr,
			@RequestParam(value="dishFrom") String toStr) {
		
		try {
			SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
		
			Date from = formatter.parse(fromStr);
			Date to = formatter.parse(toStr);
			dishService.addNewDish(name.trim(), desc.trim(), rec.trim(), from, to);
		} catch (ParseException e) {
			e.printStackTrace();
		}
				
		return "OK";
	}

}
