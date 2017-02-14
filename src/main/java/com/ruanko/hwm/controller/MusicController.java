package com.ruanko.hwm.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.ruanko.hwm.bean.Music;
import com.ruanko.hwm.service.IMusicService;
import com.ruanko.hwm.utl.DateTime;


@Controller
@RequestMapping("/music")
public class MusicController {

	@Resource
	public IMusicService musicService;	
	
	@RequestMapping({"/doAddMusic/"})
	public void addMusic(@ModelAttribute("music")Music music, @RequestParam("imageInfo") MultipartFile image, @RequestParam("lrcInfo") MultipartFile lrc, @RequestParam("songInfo") MultipartFile song, Model model, HttpServletRequest request) {
		//保存音乐到数据库中
		Music mus = new Music();
		mus.setMusicname(music.getMusicname());
		mus.setPlaycounts(0);
		mus.setUploadtime(DateTime.getCurrentTime());
		mus.setLyr(music.getMusicname() + ".lrc");
		mus.setImg(music.getMusicname() + ".jpg");
		mus.setMusicname(musicname);
		System.out.println(music.getMusicname());
		String[] checkbox= request.getParameterValues("checkbox");
		
		for(String s : checkbox) {
			System.out.println(s);
		}
		
	}
}
