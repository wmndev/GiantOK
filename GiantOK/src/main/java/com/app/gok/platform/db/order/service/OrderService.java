package com.app.gok.platform.db.order.service;

import java.util.List;
import com.app.gok.platform.db.order.model.Order;

public interface OrderService {
	
	List<Order> findAllSortById();
	
	void addNewOrder(String name, String email, String date, String sInstructions);

}
