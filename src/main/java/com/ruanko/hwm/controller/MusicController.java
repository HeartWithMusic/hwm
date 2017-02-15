package com.ruanko.hwm.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;

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
	public void addMusic(@ModelAttribute("music")Music music, @RequestParam("imageInfo") MultipartFile image, @RequestParam("lrcInfo") MultipartFile lrc, @RequestParam("songInfo") MultipartFile song, Model model, HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
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
        
        //System.out.println(request.getSession().getServletContext().getRealPath("/WEB-INF/music"));
		//System.out.println(music.getMusicname());
		String[] checkbox= request.getParameterValues("checkbox");
		
//		for(String s : checkbox) {
//			System.out.println(s);
//		}
		//System.out.println(mus.getMusicname() + mus.getMusictime() + mus.getLyr() + mus.getImg() + mus.getPlaycounts() + mus.getUploadtime());
		//System.out.println(song.getContentType());
		//System.out.println(Upload_Download.getMusicLength(new File(request.getSession().getServletContext().getRealPath("/WEB-INF/music/song") + "/" + song.getOriginalFilename())));
		//System.out.println(request.getParameter("select"));
		//插入数据库
		musicService.addMusic(mus);
	}
	
	public void manageMusic(Model model, HttpServletRequest request, HttpServletResponse response) {
		
	}
		
	
}
