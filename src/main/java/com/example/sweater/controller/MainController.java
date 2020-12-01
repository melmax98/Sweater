package com.example.sweater.controller;

import com.example.sweater.domain.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.sweater.domain.Message;

import com.example.sweater.repos.MessageRepo;

@Controller
public class MainController {

	@Autowired
	private MessageRepo messageRepo;

	@GetMapping("/")
	public String greeting (Model model) {
		return "greeting";
	}

	@GetMapping("/main")
	public String main(Model model) {
		Iterable<Message> messages = messageRepo.findAll();
		model.addAttribute("messages", messages);
		return "main";
	}

	@PostMapping("/main")
	public String add(
			@AuthenticationPrincipal User author,
			@RequestParam String text,
			@RequestParam String tag,
			Model model) {
		Message message = new Message(text, tag, author);
		messageRepo.save(message);
		return "redirect:main";
	}

	@PostMapping("filter")
	public String filter(@RequestParam String filter, Model model) {
		Iterable<Message> messages = null;

		if (filter != null && !filter.isEmpty()) {
			messages = messageRepo.findByTag(filter);
		} else {
			messages = messageRepo.findAll();
		}
		model.addAttribute("messages", messages);
		return "main";
	}

}
