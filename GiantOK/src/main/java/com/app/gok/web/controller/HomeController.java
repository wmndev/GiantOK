package com.app.gok.web.controller;

import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.app.gok.platform.db.dish.service.DishService;
import com.app.gok.platform.db.order.service.OrderService;
import com.app.gok.platform.mail.MailSenderService;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {

	private static final Logger logger = LoggerFactory
			.getLogger(HomeController.class);

	@Autowired
	private MailSenderService mailSenderService;
	
	@Autowired
	private OrderService orderService;
	
	@Autowired
	private DishService dishService;
	

	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = { "/", "/home" }, method = RequestMethod.GET)
	public ModelAndView home(Locale locale) {
		logger.info("Welcome home! The client locale is {}.", locale);


		ModelAndView model = new ModelAndView("home");
		model.addObject("dish", dishService.findLastDish());
		return model;
	}
	


	@RequestMapping(value = "/Order", method = RequestMethod.POST)
	public @ResponseBody
	String order(@RequestParam(value = "InputName") String name,
			@RequestParam(value = "InputEmail") String email,
			@RequestParam(value = "InputDate") String date,
			@RequestParam(value = "InputMessage") String sInstructions) {
		orderService.addNewOrder(name, email, date, sInstructions);
		
		//mailSenderService.sendMail(name, email, date, sInstructions);
		
		return "Your order has been confirmed, Thank You!";
	}
	

}
