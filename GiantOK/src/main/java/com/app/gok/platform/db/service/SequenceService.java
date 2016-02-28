package com.app.gok.platform.db.service;

import com.app.gok.platform.exception.SequenceException;


public interface SequenceService {
	
	long getNextSequenceId(String key) throws SequenceException;

}
