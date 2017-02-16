package com.ruanko.hwm.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.util.Streams;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.ruanko.hwm.bean.Music;
import com.ruanko.hwm.service.IMusicService;
import com.ruanko.hwm.utl.DateTime;
import com.ruanko.hwm.utl.Upload_Download;


@Controller
@RequestMapping("/music")
public class MusicController {

	@Resource
	public IMusicService musicService;	
	
	@RequestMapping({"/doAddMusic/"})
	public String addMusic(@ModelAttribute("music")Music music, @RequestParam("imageInfo") MultipartFile image, @RequestParam("lrcInfo") MultipartFile lrc, @RequestParam("songInfo") MultipartFile song, Model model, HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		//保存音乐到数据库中
		Music mus = new Music();
		mus.setMusicname(music.getMusicname());
		mus.setPlaycounts(0);
		mus.setUploadtime(DateTime.getCurrentTime());
		mus.setLyr(music.getMusicname() + ".lrc");
		mus.setImg(music.getMusicname() + ".jpg");
		//上传音乐相关文件
		//System.out.println(image.getName()+"---"+image.getContentType()+"---"+image.getOriginalFilename());
        try {
        	Upload_Download.upload_img(image, request,music.getMusicname());
        	Upload_Download.upload_lrc(lrc, request,music.getMusicname());
        	Upload_Download.upload_song(song, request,music.getMusicname());
        } catch (IOException e) {
            System.out.println("文件上传失败");
            e.printStackTrace();
        }
        
        //播放时长
        String time = Upload_Download.getMusicLength(new File(request.getSession().getServletContext().getRealPath("/WEB-INF/music/song") + "/" + music.getMusicname() + ".mp3"));
        mus.setMusictime(time);
        
        System.out.println(request.getSession().getServletContext().getRealPath("/WEB-INF/music"));
		//System.out.println(music.getMusicname());
		String[] checkbox= request.getParameterValues("checkbox");
		
//		for(String s : checkbox) {
//			System.out.println(s);
//		}
		System.out.println(mus.getMusicname() + mus.getMusictime() + mus.getLyr() + mus.getImg() + mus.getPlaycounts() + mus.getUploadtime());
		//System.out.println(song.getContentType());
		//System.out.println(Upload_Download.getMusicLength(new File(request.getSession().getServletContext().getRealPath("/WEB-INF/music/song") + "/" + song.getOriginalFilename())));
		//System.out.println(request.getParameter("select"));
		//插入数据库
		musicService.addMusic(mus);
		model.addAttribute(new Music());
		model.addAttribute("message","添加歌曲成功");
		return "showAddMusic";
	}
	
	/**
	 * 删除音乐
	 * @param model
	 * @param request
	 * @param response
	 */
	@RequestMapping({"/deleteMusic"})
	public String deleteMusic(Model model, HttpServletRequest request, HttpServletResponse response) {
		int id = Integer.parseInt(request.getParameter("id"));
		Music music = musicService.getMusicById(id);
		musicService.deleteMusic(id);
		//删除歌曲相关文件
		String root = request.getSession().getServletContext().getRealPath("/WEB-INF/music");
		String musicname = music.getMusicname();
		Upload_Download.deleteFile(root + "/song/" + musicname + ".mp3");
		Upload_Download.deleteFile(root + "/img/" + musicname + ".jpg");
		Upload_Download.deleteFile(root + "/lrc/" + musicname + ".lrc");
		
		List<Music> musicList = musicService.getAllMusic();
		//System.out.println(musicList);
		model.addAttribute("musicList", musicList);
		model.addAttribute(new Music());
		return "showManageMusic";
	}
	
	/**
	 * 修改音乐获取音乐
	 * @param model
	 * @param request
	 * @param response
	 */
	@RequestMapping({"/getMusic"})
	public String getMusic(Model model, HttpServletRequest request, HttpServletResponse response) {
		int id = Integer.parseInt(request.getParameter("id"));
		Music music = musicService.getMusicById(id);
		
		List<Music> musicList = musicService.getAllMusic();
		//System.out.println(musicList);
		model.addAttribute("musicList", musicList);
		model.addAttribute(music);
		return "showManageMusic";
	}
	
	/**
	 * 更新音乐
	 * @param model
	 * @param request
	 * @param response
	 */
	@RequestMapping({"/updateMusic"})
	public String updateMusic(@ModelAttribute("music")Music music, @RequestParam("imageInfo") MultipartFile image, @RequestParam("lrcInfo") MultipartFile lrc, @RequestParam("songInfo") MultipartFile song, Model model, HttpServletRequest request, HttpServletResponse response) {
		int id = Integer.parseInt(request.getParameter("id"));
		Music mus = musicService.getMusicById(id);
		
		mus.setMusicname(music.getMusicname());
		mus.setPlaycounts(mus.getPlaycounts());
		mus.setImg(music.getMusicname() + ".jpg");
		mus.setLyr(music.getMusicname() + ".lrc");
		mus.setUploadtime(DateTime.getCurrentTime());
		
		try {
        	Upload_Download.upload_img(image, request,music.getMusicname());
        	Upload_Download.upload_lrc(lrc, request,music.getMusicname());
        	Upload_Download.upload_song(song, request,music.getMusicname());
        } catch (IOException e) {
            System.out.println("文件上传失败");
            e.printStackTrace();
        }
        
        //播放时长
        String time = Upload_Download.getMusicLength(new File(request.getSession().getServletContext().getRealPath("/WEB-INF/music/song") + "/" + music.getMusicname() + ".mp3"));
        mus.setMusictime(time);
        
        musicService.updateMusic(mus);
		
		List<Music> musicList = musicService.getAllMusic();
		//System.out.println(musicList);
		model.addAttribute("musicList", musicList);
		model.addAttribute(music);
		return "showManageMusic";
	}
	
	
}
