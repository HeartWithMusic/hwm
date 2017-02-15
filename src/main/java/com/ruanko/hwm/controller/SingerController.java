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
import com.ruanko.hwm.bean.Singer;
import com.ruanko.hwm.service.IMusicService;
import com.ruanko.hwm.service.ISingerService;
import com.ruanko.hwm.utl.DateTime;
import com.ruanko.hwm.utl.Upload_Download;


@Controller
@RequestMapping("/singer")
public class SingerController {

	@Resource
	public ISingerService singerService;	
	
	@RequestMapping({"/doAddSinger/"})
	public void addMusic(@ModelAttribute("singer")Singer singer, @RequestParam("imageInfo") MultipartFile image, Model model, HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		//保存音乐到数据库中
		Singer sin = new Singer();
		sin.setSingername(singer.getSingername());
		sin.setIntroduction(singer.getIntroduction());
		sin.setImg(singer.getSingername()+".jpg");
		sin.setCounts(0);
		sin.setUploadtime(DateTime.getCurrentTime());
		//上传音乐相关文件
		//System.out.println(image.getName()+"---"+image.getContentType()+"---"+image.getOriginalFilename());
        try {
        	Upload_Download.upload_img1(image, request,singer.getSingername());
        	
        } catch (IOException e) {
            System.out.println("文件上传失败");
            e.printStackTrace();
        }
        
      
		String[] checkbox= request.getParameterValues("checkbox");
		
//		for(String s : checkbox) {
//			System.out.println(s);
//		}
		//System.out.println(mus.getMusicname() + mus.getMusictime() + mus.getLyr() + mus.getImg() + mus.getPlaycounts() + mus.getUploadtime());
		//System.out.println(song.getContentType());
		//System.out.println(Upload_Download.getMusicLength(new File(request.getSession().getServletContext().getRealPath("/WEB-INF/music/song") + "/" + song.getOriginalFilename())));
		//System.out.println(request.getParameter("select"));
		//插入数据库
		singerService.addSinger(sin);
	}
}
