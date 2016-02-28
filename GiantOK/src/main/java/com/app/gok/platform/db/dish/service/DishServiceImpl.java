package com.app.gok.platform.db.dish.service;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Sort;
import org.springframework.data.mongodb.core.MongoTemplate;
import org.springframework.data.mongodb.core.query.Criteria;
import org.springframework.data.mongodb.core.query.Query;
import org.springframework.data.mongodb.core.query.Update;
import org.springframework.stereotype.Service;

import com.app.gok.platform.db.dish.model.Dish;
import com.app.gok.platform.db.dish.model.Stats;
import com.app.gok.platform.db.dish.repository.DishRepository;
import com.app.gok.platform.db.service.SequenceService;

@Service
public class DishServiceImpl implements DishService {

	@Autowired
	private DishRepository dishRepository;
	@Autowired
	private SequenceService seqService;
	@Autowired
	private MongoTemplate mongoTemplte;
	
	
	@Override
	public void addNewDish(String name, String desc, String rec, Date from,
			Date to) {
		Dish dish = new Dish();
		dish.setId(seqService.getNextSequenceId("dish"));
		dish.setName(name);
		dish.setDescription(desc);
		dish.setRecipe(rec);
		dish.setFrom(from);
		dish.setTo(to);
		dishRepository.save(dish);
	}

	@Override
	public List<Dish> findAllSortById() {
		return dishRepository.findAll(new Sort(Sort.Direction.DESC, "id"));
	}

	@Override
	public Dish findLastDish() {
		return findAllSortById().get(0);
	}

	@Override
	public void addReviewToDish(long dishId, String userName, String review,
			int rate) {
		Query query = new Query();
		query.addCriteria(Criteria.where("id").is(dishId));
		query.fields().include("stats");
		
		Dish dish = mongoTemplte.findOne(query, Dish.class);
		
		if (dish.getStats() == null){
			dish.setStats(new Stats());
		}
		dish.getStats().addReview(userName, review, rate);
		
		Update update = new Update();
		update.set("stats", dish.getStats());
		
		mongoTemplte.updateFirst(query, update, Dish.class);	
		
	}

	@Override
	public Dish findOneById(long dishId) {
		return dishRepository.findOne(dishId);
	}
	
	

}
