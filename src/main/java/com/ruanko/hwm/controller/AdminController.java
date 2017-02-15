package com.ruanko.hwm.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ruanko.hwm.bean.Admin;
import com.ruanko.hwm.bean.Music;
import com.ruanko.hwm.bean.User;
import com.ruanko.hwm.service.IAdminService;
import com.ruanko.hwm.service.IUserService;
import com.ruanko.hwm.utl.MD5Util;

@Controller
@RequestMapping("/admin")
public class AdminController {

	@Resource
	public IAdminService adminService;
	
	@Resource
	private IUserService userService;
	
	@RequestMapping({"/logup/"})
	public String toLogup(Model model, HttpServletRequest request) {
		model.addAttribute("title", "注册");
		model.addAttribute(new Admin());
		return "showAdminLogup";
	}
	
	@RequestMapping({"/index/"})
	public String toIndex(Model model, HttpServletRequest request) {
		model.addAttribute("title", "首页");
		return "showAdminIndex";
	}
	
	@RequestMapping({"/addMusic/","/addMusic"})
	public String toAddMusic(Model model, HttpServletRequest request) {
		//model.addAttribute("title", "首页");
		model.addAttribute(new Music());
		return "showAddMusic";
	}
	
	@RequestMapping({"/manageMusic/"})
	public String toManageMusic(Model model, HttpServletRequest request) {
		//model.addAttribute("title", "首页");
		return "showManageMusic";
	}
	
	@RequestMapping({"/addSinger/","/addSinger"})
	public String toAddSinger(Model model, HttpServletRequest request) {
		//model.addAttribute("title", "首页");
		return "showAddSinger";
	}
	
	@RequestMapping({"/manageSinger/","/manageSinger"})
	public String toManageSinger(Model model, HttpServletRequest request) {
		//model.addAttribute("title", "首页");
		return "showManageSinger";
	}
	
	//获取所有用户
	@RequestMapping({"/manageUser/","/manageUser"})
	public String toManageUser(Model model, HttpServletRequest request) {
		System.out.println("admin中查询所有用户");
		
		List<User> userList=userService.findAllUser();
		System.out.println(userList.toString());
		model.addAttribute("userList", userList);
		
		return "showManageUser";
	}
	
	
	@RequestMapping({"/addAdmin/","/addAdmin"})
	public String toAddAdmin(Model model, HttpServletRequest request) {
		//model.addAttribute("title", "首页");
		return "showAddAdmin";
	}
	
	@RequestMapping({"/manageAdmin/","/manageAdmin"})
	public String toManageAdmin(Model model, HttpServletRequest request) {
		//model.addAttribute("title", "首页");
		return "showManageAdmin";
	}
	
	@RequestMapping({"/login/"})
	public String toLogin(Model model, HttpServletRequest request) {
		model.addAttribute("title", "登录");
		model.addAttribute(new Admin());
		return "showAdminLogin";
	}
	@RequestMapping({"/doLogin/"}) //登录
	public String login(@ModelAttribute("admin")Admin admin, Model model, HttpServletRequest request) throws Exception{
		System.out.println(admin.getAdminname());
		Admin ad = adminService.getAdminByName(admin.getAdminname());		
		String message = "";
		if(ad == null){
			message = "账号不存在";
			model.addAttribute("message",message);
		}else if(ad.getPassword().equalsIgnoreCase((MD5Util.getMD5Code(admin.getPassword())))){
			request.getSession().setAttribute("admin", admin);
			return "showAdminIndex";
		}else{
			message = "密码错误";
			model.addAttribute("message",message);
		}
		
		
		return "showAdminLogin";
	}
	@RequestMapping({"/doLogOut/"})
	public String LogOut(Model model, HttpServletRequest request){
		request.getSession().setAttribute("admin", null);
		model.addAttribute(new Admin());
		return "showAdminLogin";
	}
	
	@RequestMapping({"/doLogup/"}) //注册
	public String logup(@ModelAttribute("admin")Admin admin, Model model, HttpServletRequest request){
		System.out.println(admin.getEmail());	
		Admin ad = adminService.getAdminByName(admin.getAdminname());		
		String message = "";
		if(ad == null){
			admin.setPassword(MD5Util.getMD5Code(admin.getPassword()));
			adminService.addAdmin(admin);
			return "showAdminLogin";
		}
		return "showAdminLogup";
	}
	
}
