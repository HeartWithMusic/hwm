package com.ruanko.hwm.controller;


import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;



@Controller
@RequestMapping("/user")
public class UserController {
	
	@RequestMapping({"/",""})
	public String toUser(Model model, HttpServletRequest request) {
		model.addAttribute("title", "首页");
		return "showHome";
	}
}
