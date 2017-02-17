package com.ruanko.hwm.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ruanko.hwm.bean.User;
import com.ruanko.hwm.service.IUserService;
import com.ruanko.hwm.utl.MD5Util;
import com.sun.mail.handlers.message_rfc822;

@Controller
@RequestMapping("/home")
public class UserController {
	
	@Resource
	private IUserService userService;
	
	//查询所有用户
	@RequestMapping({"/manageUser/"})
	public String toManageUser(Model model, HttpServletRequest request) {
		System.out.println("跳转到了控制器中");
		List<User> userList=userService.findAllUser();
		
		model.addAttribute("userList", userList);
		return "showManageUser";
	}
	
	@RequestMapping({"/discover/"})
	public String toHome(Model model, HttpServletRequest request) {
		model.addAttribute("title", "心随乐动");
		model.addAttribute(new User());
		return "showHome";
	}
	
	@RequestMapping({"/discover/1"})
	public String toHome1(Model model, HttpServletRequest request) {
		model.addAttribute("title", "心随乐动");
		model.addAttribute(new User());
		return "showHome1";
	}
	@RequestMapping({"/discover/rankList"})
	public String toRankList(Model model, HttpServletRequest request) {
		model.addAttribute("title", "排行榜");
		return "showRankList";
	}
	
	@RequestMapping({"/discover/musicList"})
	public String toMusicList(Model model, HttpServletRequest request) {
		model.addAttribute("title", "歌单");
		return "showMusicList";
	}
	
	@RequestMapping({"/discover/radio"})
	public String toRadio(Model model, HttpServletRequest request) {
		model.addAttribute("title", "电台");
		return "showRadio";
	}
	
	@RequestMapping({"/discover/singer"})
	public String toSinger(Model model, HttpServletRequest request) {
		model.addAttribute("title", "歌手");
		return "showSinger";
	}
	
	@RequestMapping({"/discover/album"})
	public String toAlbum(Model model, HttpServletRequest request) {
		model.addAttribute("title", "新碟上架");
		return "showAlbum";
	}
	
	@RequestMapping({"/music"})
	public String toMusic(Model model, HttpServletRequest request) {
		model.addAttribute("title", "阳光宅男");
		return "showMusicInfo";
	}
	@RequestMapping({"/singer"})
	public String toSingerMess(Model model, HttpServletRequest request) {
		model.addAttribute("title", "JayChou");
		return "showSingerInfo";
	}
	@RequestMapping({"/logup"})
	public String toLogup(Model model, HttpServletRequest request) {
		model.addAttribute("title", "用户注册");
		model.addAttribute(new User());
		return "showLogup";
	}
	@RequestMapping({"/doLogup"}) //用户注册
	public String doLogup(@ModelAttribute("user") User user, Model model, HttpServletRequest request){
		System.out.println(user.getUsername());
		User user1 = userService.getUserByName(user.getUsername());
		String message = "";
		if(user1 == null){
			user.setPassword(MD5Util.getMD5Code(user.getPassword()));
			user.setImg("0");
			user.setLevel(0);
			user.setGrade(0);
			user.setPlaycount(0);
			userService.addUser(user);
			message = "注册成功！";
			model.addAttribute("message",message);
		}
		else{
			message = "该用户名已经存在";
			model.addAttribute("message",message);
			
		}
		model.addAttribute(new User());
		return "showLogup";
	}
	@RequestMapping({"/doLogin"})//用户登录
	public String doLogin(@ModelAttribute("user") User user, Model model,HttpServletRequest request){
		String message = "";
		User user1 = userService.getUserByName(user.getUsername());		
		if(user1 == null){
			message = "用户名不存在";
		}
		else if(user1.getPassword().equalsIgnoreCase(MD5Util.getMD5Code(user.getPassword()))){
			request.getSession().setAttribute("user", user1);			
		}
		else{
			message = "密码错误";
			
		}
		model.addAttribute(new User());
		request.getSession().setAttribute("message",message);	
		return "showHome";
	}
	@RequestMapping({"/clearSession/"})
	public @ResponseBody void clearSession(HttpServletRequest request) {
		request.getSession().setAttribute("message", "");
	}
	@RequestMapping({"/getPassword/"})
	public String toGetPwd(Model model, HttpServletRequest request){
		model.addAttribute("title", "找回密码");
		model.addAttribute(new User());
		model.addAttribute("message","");
		return "showGetPassword";
	}
	@RequestMapping({"/doGetPwd/"})//用户找回密码
	public String doGetPwd(@ModelAttribute("user") User user,Model model, HttpServletRequest request){
		String message = "";
		System.out.println(user.getUsername());
		User user1 = userService.getUserByName(user.getUsername());
		if(user1 == null){
			message = "该用户名未注册";	
			//model.addAttribute(new User());
			model.addAttribute("message",message);
			
		}
		else if(user1.getEmail().equals(user.getEmail())){
			//message = "验证成功";
			//model.addAttribute("message",message);
			return "showAlterPwd";
		}
		else{
			System.out.println(user1.getEmail());
			message = "邮箱和用户名不一致";
			model.addAttribute("message",message);
			
		}
		return "showGetPassword";		
	}
	@RequestMapping({"/doAlterPwd/"})//用户找回密码
	public String doAlterPwd(@ModelAttribute("user") User user,Model model, HttpServletRequest request){
		
		return null;
	}
}
