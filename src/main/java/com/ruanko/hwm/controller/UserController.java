package com.ruanko.hwm.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.ruanko.hwm.bean.Music;
import com.ruanko.hwm.bean.MusicSingerRela;
import com.ruanko.hwm.bean.MusicType;
import com.ruanko.hwm.bean.MusicTypeRela;
import com.ruanko.hwm.bean.Singer;
import com.ruanko.hwm.bean.SingerTypeRela;
import com.ruanko.hwm.bean.User;
import com.ruanko.hwm.service.IMusicService;
import com.ruanko.hwm.service.IMusicSingerService;
import com.ruanko.hwm.service.IMusicTypeRelationService;
import com.ruanko.hwm.service.IMusicTypeService;
import com.ruanko.hwm.service.ISingerService;
import com.ruanko.hwm.service.ISingerTypeRelaService;
import com.ruanko.hwm.service.ISingerTypeService;
import com.ruanko.hwm.service.IUserService;
import com.ruanko.hwm.utl.LrcAnalyze;
import com.ruanko.hwm.utl.LrcAnalyze.LrcData;
import com.ruanko.hwm.utl.MD5Util;
import com.ruanko.hwm.utl.Upload_Download;

@Controller
@RequestMapping("/home")
public class UserController {
	
	@Resource
	private IUserService userService;
	@Resource
	private IMusicTypeRelationService musicTypeRelaService;
	@Resource
	private IMusicTypeService musicTypeService;
	@Resource
	private IMusicService musicService;
	@Resource
	private ISingerTypeService singerTypeService;
	@Resource
	private ISingerService singerService;
	@Resource
	private ISingerTypeRelaService singerTypeRelaService;
	
	@Resource
	private IMusicSingerService musicSingerService;
	//每页项数
	private Integer pageSize = 5;
	
	/**
	 * 删除用户
	 * 
	 * @param model
	 * @param request
	 * @param response
	 */
	@RequestMapping({ "/deleteUser" })
	public String deleteUser(Model model, HttpServletRequest request, HttpServletResponse response) {
		int id = Integer.parseInt(request.getParameter("id"));
		User user = userService.getUserById(id);
		userService.deleteUserById(id);
		// 删除歌曲相关文件
		String root = request.getSession().getServletContext().getRealPath("/WEB-INF/user");
		String username = user.getUsername();
		if(user.getImg() != "" && user.getImg() != null) {
			Upload_Download.deleteFile(root + "/img/" + username + ".jpg");
		}
		

		List<User> userList = userService.findAllUser();
		// System.out.println(musicList);
		model.addAttribute("userList", userList);
		model.addAttribute("pageSize", pageSize);
  		model.addAttribute("counts", userList.size());
		model.addAttribute(new User());
		return "showManageUser";
	}
	//获得当前用户的资料
	@RequestMapping({ "/personMsg" })
	public String toPersonMsg(Model model, HttpServletRequest request, HttpServletResponse response) {
		HttpSession session=request.getSession();
		User currentUser=(User)session.getAttribute("user");
		currentUser = userService.getUserById(currentUser.getId());
		// 删除歌曲相关文件
		System.out.println("返回当前用户信息");
		System.out.println(currentUser.toString());
		model.addAttribute("currentUser", currentUser);
		
		model.addAttribute(new User());
		return "currentUserMsg";
	}
	
	//修改当前用户的资料
	@RequestMapping({ "/updateCurrentUser" })
	public String toUpdateCurrentUser(String userName,String userTel,String email,String userAge,Model model, HttpServletRequest request, HttpServletResponse response) {
		Integer userId=((User)request.getSession().getAttribute("user")).getId();
		Integer age=Integer.parseInt(userAge);
		System.out.println(userName+":"+userAge+":"+userId);
		
		User newUser=new User();
		newUser.setId(userId);
		newUser.setUsername(userName);
		newUser.setAge(age);
		newUser.setEmail(email);
		newUser.setTel(userTel);
		
		userService.updateCurrentUser(newUser);
		
		
		model.addAttribute(new User());
		return toMyMusic(model, request);
	}
	/**
	 * 修改用户获取用户
	 * 
	 * @param model
	 * @param request
	 * @param response
	 */
	@RequestMapping({ "/getUser" })
	public String getUser(Model model, HttpServletRequest request, HttpServletResponse response) {
		int id = Integer.parseInt(request.getParameter("id"));
		User user = userService.getUserById(id);

//		// 获取所有的歌手并返回前台
//		List<Singer> singerList = singerService.getAllSinger();
//		model.addAttribute("singerList", singerList);

		List<User> userList = userService.findAllUser();
		// System.out.println(musicList);
		model.addAttribute("pageSize", pageSize);
  		model.addAttribute("counts", userList.size());
		model.addAttribute("singerList", userList);
		model.addAttribute("user",user);
		return "showManageUser";
	}

	/**
	 * 更新用户
	 * 
	 * @param model
	 * @param request
	 * @param response
	 */
	@RequestMapping({ "/updateUser" })
	public String updateMusic(@ModelAttribute("user") User user, @RequestParam("imageInfo") MultipartFile image, Model model,
			HttpServletRequest request, HttpServletResponse response) {
		int id = Integer.parseInt(request.getParameter("id"));
		User us = userService.getUserById(id);
		
		us.setAge(user.getAge());
		us.setEmail(user.getEmail());
		us.setImg(user.getUsername() + ".jpg");
		us.setTel(user.getTel());
		us.setUsername(user.getUsername());
		
		
		//System.out.println(image.getContentType());
		//String s[] = lrc.getOriginalFilename().split("\\.");
		// System.out.println(s.length);
		// 判断上传的文件类型
		if (!image.getContentType().equals("image/jpeg")) {
			model.addAttribute("message", "图片文件必须是jpg格式");
			List<User> userList = userService.findAllUser();
			//System.out.println(musicList);
			model.addAttribute("userList", userList);
			model.addAttribute("pageSize", pageSize);
	  		model.addAttribute("counts", userList.size());
			model.addAttribute(user);
			return "showManageUser";
		} 

		try {
			Upload_Download.upload_img2(image, request, user.getUsername());
		} catch (IOException e) {
			System.out.println("文件上传失败");
			e.printStackTrace();
		}

		// 播放时长
//		String time = Upload_Download
//				.getMusicLength(new File(request.getSession().getServletContext().getRealPath("/WEB-INF/music/song")
//						+ "/" + music.getMusicname() + ".mp3"));
//		mus.setMusictime(time);

		userService.updateUser(us);

//		// 更新至歌曲类别表中
//		String radio = request.getParameter("radio");
//		// System.out.println(musicId);
//		// for(String s1 : checkbox) {
//		// System.out.println(s1);
//		// }
//		updateSingerAndTypeToRela(radio, id);

		// 更新至歌曲歌手关联表
//		int singerId = Integer.parseInt(request.getParameter("select"));
//		MusicSingerRela msr = new MusicSingerRela();
//		msr.setMusicid(id);
//		msr.setSingerid(singerId);
//		musicSingerService.updateMS(msr);

		List<User> userList = userService.findAllUser();
		// System.out.println(musicList);
		model.addAttribute("userList", userList);
		model.addAttribute("pageSize", pageSize);
  		model.addAttribute("counts", userList.size());
		model.addAttribute("message", "修改成功");
		model.addAttribute(user);
		return "showManageUser";
	}


	/**
	 * ajax
	 * 
	 * @param pageIndex
	 * @param pageSize
	 * @param totalPage
	 * @return
	 */
	@RequestMapping("/ajax_operation")
	public @ResponseBody List<User> findSingerAjax1(String pageIndex, String pageSize, String totalPage, String userName) {
		//System.out.println(musicName);
		return ajax_common1(pageIndex, pageSize, totalPage, userName);
		
	}
	
	/**
	 * 返回每页的数据
	 * @param pageIndex
	 * @param pageSize
	 * @param totalPage
	 * @return
	 */
	public List<User> ajax_common1(String pageIndex, String pageSize, String totalPage, String username) {
		List<User> userList = new ArrayList<User>();
		//判断是否为搜索
		if(username == "") {
			userList = userService.findAllUser();
			
		}else {
			List<User> sl = userService.findAllUser();
			for(User u : sl) {
				if(u.getUsername().contains((username))) {
					userList.add(u);
				}
			}
		}
//		//获取对应的歌手
//		for(Music m : resultList) {
//			//System.out.println(m.getId());
//			Singer singer = singerService.getSingerById(musicSingerService.getSingerByMusicId(m.getId()).getSingerid());
//			singerList.add(singer);
//		}
		
		Integer pageIndex1 = Integer.parseInt(pageIndex);
		Integer pageSize1 = Integer.parseInt(pageSize);
		Integer totalPage1 = Integer.parseInt(totalPage);
		List<User> resultList = new ArrayList<User>();
		if (pageIndex1 <= totalPage1 / pageSize1) {
			resultList = userList.subList((pageIndex1 - 1) * pageSize1, pageIndex1 * pageSize1);
		} else {
			resultList = userList.subList((pageIndex1 - 1) * pageSize1, totalPage1);
		}
		
		return resultList;
	}
	
	
	@RequestMapping({"/discover/"})
	public String toHome(Model model, HttpServletRequest request) {
		model.addAttribute("title", "心随乐动");
		model.addAttribute("url", request.getRequestURL()+"1");
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
		String typeName = "";
		List<Music> musicList = new ArrayList<Music>();
		List<Singer> singerList = new ArrayList<Singer>();
		if(request.getParameter("cat") == null) {
			typeName += "心动飙升榜";
			List<Music> musicList_all = musicService.getAllMusic();
			musicList = musicList_all.subList(0, musicList_all.size() > 20 ? 20 : musicList_all.size());
			singerList = new ArrayList<Singer>();
			for(Music m : musicList ) {
				singerList.add(singerService.getSingerById(musicSingerService.getSingerByMusicId(m.getId()).getSingerid()));
			}
		}else {
			Integer id = Integer.parseInt(request.getParameter("cat"));
			//System.out.println(id);
			//根据id获取歌曲类别信息
			typeName = musicTypeService.getMusicTypeById(id).getTypename();
			//获取歌曲列表
			List<MusicTypeRela> mtrList = musicTypeRelaService.getMusicByTypeId(id);
			for(MusicTypeRela m : mtrList) {
				musicList.add(musicService.getMusicById(m.getMusicid()));
			}
			//size = mtrList.size();
		}
		
		model.addAttribute("typeName", typeName);
		model.addAttribute("musicList", musicList);
		model.addAttribute("singerList", singerList);
		model.addAttribute("title", "排行榜");
		model.addAttribute(new User());
		return "showRank";
	}
	
	@RequestMapping({"/discover/musicList"})
	public String toMusicList(Model model, HttpServletRequest request) {
		
		String typeName = "";
		int size = 0;
		//System.out.println(size);
		List<Music> musicList = new ArrayList<Music>();
		if(request.getParameter("cat") == null) {
			typeName += "全部";
			musicList = musicService.getAllMusic();
			size = musicList.size();
		}else {
			Integer id = Integer.parseInt(request.getParameter("cat"));
			//System.out.println(id);
			//根据id获取歌曲类别信息
			typeName = musicTypeService.getMusicTypeById(id).getTypename();
			//获取歌曲列表
			List<MusicTypeRela> mtrList = musicTypeRelaService.getMusicByTypeId(id);
			for(MusicTypeRela m : mtrList) {
				musicList.add(musicService.getMusicById(m.getMusicid()));
			}
			size = mtrList.size();
		}
		
		model.addAttribute("typeName", typeName);
		model.addAttribute("musicList", musicList);
		model.addAttribute("size", (int)Math.ceil(size*1.0/5));
		model.addAttribute("cat", typeName);
		model.addAttribute("title", "歌单");
		model.addAttribute(new User());
		return "showMusicList";
	}
	
	@RequestMapping({"/discover/radio"})
	public String toRadio(Model model, HttpServletRequest request) {
		model.addAttribute("title", "电台");
		model.addAttribute(new User());
		return "showRadio";
	}
	
	@RequestMapping({"/discover/singer"})
	public String toSinger(Model model, HttpServletRequest request) {
		String typeName = "";
		List<Singer> singerList = new ArrayList<Singer>();
		if(request.getParameter("cat") == null) {
			model.addAttribute("title", "推荐");
			//获取singerList1,singerList2,size
			int length = singerService.getAllSinger().size();
			//获取入驻歌手
			List<Singer> singerList1 = singerService.getAllSinger().subList(0, (length > 10 ? 10: length));
			int size = (int)Math.ceil(length*1.0/5);
			//System.out.println(size);
			//获取热门歌手
			List<Singer> singerList_2 = singerService.getAllSinger();
			Collections.sort(singerList_2);  
			//List<Singer> singerList2 = singerList_2.subList(0, (length > 9 ? 9: length));
		
			model.addAttribute("size", size);
			model.addAttribute("singerList1", singerList1);
			model.addAttribute("singerList2", singerList_2);
			model.addAttribute(new User());
			
			return "showSinger1";
		}else if(Integer.parseInt(request.getParameter("cat")) == 0){
			model.addAttribute("title", "入驻新歌");
			int length = singerService.getAllSinger().size();
			List<Singer> singerList1 = singerService.getAllSinger();
			int size = (int)Math.ceil(length*1.0/5);
			model.addAttribute("size", size);
			model.addAttribute("singerList1", singerList1);
			model.addAttribute(new User());
			
			return "showSinger2";
			
		}else {
			int id = Integer.parseInt(request.getParameter("cat"));
			typeName = singerTypeService.getSingerTypeById(id).getTypename();
			List<SingerTypeRela> singerTypeRelaList = singerTypeRelaService.getSingerByTypeId(id);
			for(SingerTypeRela s : singerTypeRelaList) {
				singerList.add(singerService.getSingerById(s.getSingerid()));
			}
		}
		
		model.addAttribute("typeName", typeName);
		model.addAttribute("singerList", singerList);
		model.addAttribute("title", "歌手");
		model.addAttribute(new User());
		return "showSinger";
	}

	
	@RequestMapping({"/discover/album"})
	public String toAlbum(Model model, HttpServletRequest request) {
		model.addAttribute("title", "新碟上架");
		model.addAttribute(new User());
		return "showAlbum";
	}
	
	
	
	
	@RequestMapping({"/discover/1/rf"})
	public String toHome11(Model model, HttpServletRequest request) {
		model.addAttribute("title", "心随乐动");
		model.addAttribute("url", request.getRequestURL().toString().split("\\/rf")[0]);
		//System.out.println(request.getRequestURL().toString().split("\\/rf")[0]);
		model.addAttribute(new User());
		return "showHome";
	}
	@RequestMapping({"/discover/rankList/rf"})
	public String toRankList1(Model model, HttpServletRequest request) {
		model.addAttribute("title", "排行榜");
		model.addAttribute("url", request.getRequestURL().toString().split("/rf")[0]);
		model.addAttribute(new User());
		return "showHome";
	}
	
	@RequestMapping({"/discover/musicList/rf"})
	public String toMusicList1(Model model, HttpServletRequest request) {
		model.addAttribute("title", "歌单");
		model.addAttribute("url", request.getRequestURL().toString().split("/rf")[0]);
		model.addAttribute(new User());
		return "showHome";
	}
	
	@RequestMapping({"/discover/radio/rf"})
	public String toRadio1(Model model, HttpServletRequest request) {
		model.addAttribute("title", "电台");
		model.addAttribute("url", request.getRequestURL().toString().split("/rf")[0]);
		model.addAttribute(new User());
		return "showHome";
	}
	
	@RequestMapping({"/discover/singer/rf"})
	public String toSinger1(Model model, HttpServletRequest request) {
		model.addAttribute("title", "歌手");
		model.addAttribute("url", request.getRequestURL().toString().split("/rf")[0]);
		model.addAttribute(new User());
		return "showHome";
	}
	
	@RequestMapping({"/discover/album/rf"})
	public String toAlbum1(Model model, HttpServletRequest request) {
		model.addAttribute("title", "新碟上架");
		model.addAttribute("url", request.getRequestURL().toString().split("/rf")[0]);
		model.addAttribute(new User());
		return "showHome";
	}
	
	
	
	@RequestMapping({"/music"})
	public String toMusic(Model model, HttpServletRequest request) {
		int id = Integer.parseInt(request.getParameter("id"));
		//获取歌曲和歌手
		Music music = musicService.getMusicById(id);
		Singer singer = singerService.getSingerById(musicSingerService.getSingerByMusicId(id).getSingerid());
		//获取所属分类
		List<MusicTypeRela> musicTypeRela = musicTypeRelaService.getMusicTypeByMusicId(id);
		List<MusicType> musicType = new ArrayList<MusicType>();
		for(MusicTypeRela mtr : musicTypeRela) {
			musicType.add(musicTypeService.getMusicTypeById(mtr.getTypeid()));
		}
		//读取歌词传到前台
		String root = request.getSession().getServletContext().getRealPath("/static/music/lrc");
		//String lrc = Upload_Download.lrc2String(root + "//" +music.getLyr());
		//System.out.println(lrc);
		
		List<LrcData> lrcList = new LrcAnalyze(root + "//" +music.getLyr()).LrcGetList();
		List<String> lrcList1 = new ArrayList<String>();
		for(LrcData l:lrcList) {
			//System.out.println(l.LrcLine);
			lrcList1.add(l.LrcLine);
		}
		model.addAttribute("lrcList", lrcList1);
		model.addAttribute("musicType", musicType);
		model.addAttribute("title", music.getMusicname());
		model.addAttribute("music", music);
		model.addAttribute("singer", singer);
		model.addAttribute(new User());
		return "showMusicInfo";
	}
	
	
	
	
	@RequestMapping({"/singer"})
	public String toSingerMess(Model model, HttpServletRequest request) {
		int id = Integer.parseInt(request.getParameter("id"));
		//获取歌手id
		System.out.println(id);
		Singer singer = singerService.getSingerById(id);
		List<Music> musicList = new ArrayList<Music>();
		List<MusicSingerRela> musicSinger = musicSingerService.getMusicBySingerId(id);
		for(MusicSingerRela msr : musicSinger) {
			musicList.add(musicService.getMusicById(msr.getMusicid()));
		}
		model.addAttribute("musicList",musicList);
		model.addAttribute("title", singer.getSingername());
		model.addAttribute("introduction",singer.getIntroduction());
		model.addAttribute("singer",singer);
		model.addAttribute(new User());
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
	
	//点击我的音乐，显示用户的歌单情况
		@RequestMapping({"/myMusic"})
		public String toMyMusic(Model model, HttpServletRequest request) {
			HttpSession session= request.getSession();
			User currentUser=(User)session.getAttribute("user");
			List<Music> musicList=musicService.findMusicByUserId(currentUser.getId());
			//歌单注入模型
			model.addAttribute("currentMusic", musicList);
			
			model.addAttribute("title", "阳光宅男");
			model.addAttribute(new User());
			return "showMusicListOfUser";
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
			User user2 = userService.getUserByName(user.getUsername());
			//System.out.println(user2.getId());
			model.addAttribute("user2",user2);
			
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
		String username = request.getParameter("user2");
		//System.out.println(username);
		User user1 = userService.getUserByName(username.trim());
		//System.out.println(user1);
		user1.setPassword(MD5Util.getMD5Code(user.getPassword()));
		userService.updateUser(user1);
		String message= "密码修改成功";
		model.addAttribute("message",message);
		model.addAttribute(new User());
		return "showAlterPwd";
	}
	@RequestMapping({"/logOut"})
	public String doLogOut(Model model, HttpServletRequest request){
		request.getSession().setAttribute("user", null);
		model.addAttribute(new User());
		return "showHome";
	}
}