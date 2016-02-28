package com.app.gok.platform.db.order.service;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;

import com.app.gok.platform.db.order.model.Order;
import com.app.gok.platform.db.order.repository.OrderRepository;
import com.app.gok.platform.db.service.SequenceService;

@Service
public class OrderServiceImpl implements OrderService {
	
	@Autowired
	private OrderRepository orderRepository;
	@Autowired
	private SequenceService seqService;

	@Override
	public List<Order> findAllSortById() {
		return orderRepository.findAll(new Sort(Sort.Direction.DESC, "id"));
	}

	@Override
	public void addNewOrder(String name, String email, String date,
			String specialInructions) {
		Order order = new Order();
		order.setId(seqService.getNextSequenceId("order"));
		order.setName(name);
		order.setEmail(email);
		order.setSpecialInructions(specialInructions);
		order.setCreatedDate(new Date(System.currentTimeMillis()));
		
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
		
		try {
			Date supplyDate = formatter.parse(date);
			order.setSupplyDate(supplyDate);
		} catch (ParseException e) {
		}
		
		orderRepository.save(order);		
	}

}
