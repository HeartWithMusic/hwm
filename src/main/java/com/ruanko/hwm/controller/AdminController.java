package com.ruanko.hwm.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/admin")
public class AdminController {
	@RequestMapping({"/login/"})
	public String toLogin(Model model, HttpServletRequest request) {
		model.addAttribute("title", "登录");
		return "showAdminLogin";
	}
	
	@RequestMapping({"/logup/"})
	public String toLogup(Model model, HttpServletRequest request) {
		model.addAttribute("title", "注册");
		return "showAdminLogup";
	}
	
	@RequestMapping({"/index/"})
	public String toIndex(Model model, HttpServletRequest request) {
		model.addAttribute("title", "首页");
		return "showAdminIndex";
	}
}
