package com.ruanko.hwm.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/home")
public class UserController {
	
	@RequestMapping({"/discover/"})
	public String toHome(Model model, HttpServletRequest request) {
		model.addAttribute("title", "心随乐动");
		return "showHome";
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
}
