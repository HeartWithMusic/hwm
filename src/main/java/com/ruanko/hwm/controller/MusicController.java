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
import com.ruanko.hwm.bean.MusicSingerRela;
import com.ruanko.hwm.bean.MusicTypeRela;
import com.ruanko.hwm.bean.Singer;
import com.ruanko.hwm.service.IMusicService;
import com.ruanko.hwm.service.IMusicSingerService;
import com.ruanko.hwm.service.IMusicTypeRelationService;
import com.ruanko.hwm.service.ISingerService;
import com.ruanko.hwm.utl.DateTime;
import com.ruanko.hwm.utl.Upload_Download;


@Controller
@RequestMapping("/music")
public class MusicController {

	@Resource
	public IMusicService musicService;	
	
	@Resource
	public ISingerService singerService;
	
	@Resource
	public IMusicSingerService musicSingerService;
	
	@Resource
	public IMusicTypeRelationService musicTypeService;
	
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
		//System.out.println(lrc.getOriginalFilename());
		String s[] = lrc.getOriginalFilename().split("\\.");
		//System.out.println(s.length);
		//判断上传的文件类型
		if(!image.getContentType().equals("image/jpeg")) {
			model.addAttribute("message","图片文件必须是jpg格式");
			model.addAttribute(new Music());
			return "showAddMusic";
		}else if(!song.getContentType().equals("audio/mpeg")) {
			model.addAttribute("message","音频文件必须是mp3格式");
			model.addAttribute(new Music());
			return "showAddMusic";
		}else if(!s[1].equals("lrc") && !s[1].equals("krc")) {
			model.addAttribute("message","歌词文件必须是lrc格式");
			model.addAttribute(new Music());
			return "showAddMusic";
		}
		//上传
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
        //保存歌曲信息
      	musicService.addMusic(mus);
      	//查询歌曲
      	int musicId = 0;
      	List<Music> musicList1 = musicService.getAllMusic();
      	for(Music m : musicList1) {
      		if(m.getMusicname().equals(mus.getMusicname())) {
      			musicId = m.getId();
      		}
      	}        
        
        
        //System.out.println(request.getSession().getServletContext().getRealPath("/WEB-INF/music"));
		//System.out.println(music.getMusicname());
        //保存至歌曲类别表中
		String[] checkbox= request.getParameterValues("checkbox");
		//System.out.println(musicId);
//		for(String s1 : checkbox) {
//			System.out.println(s1);
//		}
		addMusicAndTypeToRela(checkbox, musicId);
		
		//保存至歌曲歌手关联表
		int singerId = Integer.parseInt(request.getParameter("select"));
		MusicSingerRela msr = new MusicSingerRela();
		msr.setMusicid(musicId);
		msr.setSingerid(singerId);
		musicSingerService.addMS(msr);
		
		//System.out.println(mus.getMusicname() + mus.getMusictime() + mus.getLyr() + mus.getImg() + mus.getPlaycounts() + mus.getUploadtime());
		//System.out.println(song.getContentType());
		//System.out.println(Upload_Download.getMusicLength(new File(request.getSession().getServletContext().getRealPath("/WEB-INF/music/song") + "/" + song.getOriginalFilename())));
		//System.out.println(request.getParameter("select"));
		
		
		model.addAttribute(new Music());
		model.addAttribute("message","添加歌曲成功");
		return "showAddMusic";
	}
	
	/**
	 * 添加音乐到音乐类型关联表中
	 * @param type
	 * @param mid
	 */
	public void addMusicAndTypeToRela(String [] type, Integer mid) {
//		System.out.println(mid);
//		for(String s1 : type) {
//			System.out.println(s1);
//		}
		
		for(String s : type) {
			MusicTypeRela mtr = new MusicTypeRela();
			mtr.setMusicid(mid);
			mtr.setTypeid(Integer.parseInt(s));
			musicTypeService.addMusicTR(mtr);
		}
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
		
		//获取所有的歌手并返回前台
		List<Singer> singerList = singerService.getAllSinger();
		model.addAttribute("singerList", singerList);
		
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
		System.out.println(image.getContentType());
		String s[] = lrc.getOriginalFilename().split("\\.");
		//System.out.println(s.length);
		//判断上传的文件类型
		if(!image.getContentType().equals("image/jpeg")) {
			model.addAttribute("message","图片文件必须是jpg格式");
			model.addAttribute(new Music());
			return "showAddMusic";
		}else if(!song.getContentType().equals("audio/mpeg")) {
			model.addAttribute("message","音频文件必须是mp3格式");
			model.addAttribute(new Music());
			return "showAddMusic";
		}else if(!s[1].equals("lrc") && !s[1].equals("krc")) {
			model.addAttribute("message","歌词文件必须是lrc格式");
			model.addAttribute(new Music());
			return "showAddMusic";
		}
		
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
        
	    //更新至歌曲类别表中
	    String[] checkbox= request.getParameterValues("checkbox");
	    //System.out.println(musicId);
	//      		for(String s1 : checkbox) {
	//      			System.out.println(s1);
	//      		}
	    updateMusicAndTypeToRela(checkbox, id);
	      		
	    //更新至歌曲歌手关联表
	    int singerId = Integer.parseInt(request.getParameter("select"));
	    MusicSingerRela msr = new MusicSingerRela();
	    msr.setMusicid(id);
	    msr.setSingerid(singerId);
	    musicSingerService.updateMS(msr);
		
		List<Music> musicList = musicService.getAllMusic();
		//System.out.println(musicList);
		model.addAttribute("musicList", musicList);
		model.addAttribute("message","修改成功");
		model.addAttribute(music);
		return "showManageMusic";
	}
	
	
	/**
	 * 添加音乐到音乐类型关联表中
	 * @param type
	 * @param mid
	 */
	public void updateMusicAndTypeToRela(String [] type, Integer mid) {
//		System.out.println(mid);
//		for(String s1 : type) {
//			System.out.println(s1);
//		}
		
		for(String s : type) {
			MusicTypeRela mtr = new MusicTypeRela();
			mtr.setMusicid(mid);
			mtr.setTypeid(Integer.parseInt(s));
			musicTypeService.updateMusicTR(mtr);
		}
	}
	
}
