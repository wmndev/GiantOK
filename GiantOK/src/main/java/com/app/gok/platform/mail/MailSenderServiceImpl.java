package com.app.gok.platform.mail;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.app.gok.service.MailService;

@Service
public class MailSenderServiceImpl implements MailSenderService {

	@Autowired
	private MailService mailService;

	@Override
	public void sendMail(String name, String email, String date,
			String sInstructions) {
		StringBuilder builder = new StringBuilder();
		builder.append("Name :").append(name).append("\n");
		builder.append("Order to Date :").append(date).append("\n");
		builder.append("Special Instructions :").append(sInstructions)
				.append("\n");
		builder.append("Email :").append(email).append("\n");

		mailService.sendMail("itay.wiseman@gmail.com", "New Order from: "
				+ name, builder.toString());

	}

}
