package com.ruanko.hwm.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.ruanko.hwm.bean.Music;
import com.ruanko.hwm.dao.MusicMapper;
import com.ruanko.hwm.service.IMusicService;
@Service("musicService")
public class MusicServiceImpl implements IMusicService {

	@Resource
	private MusicMapper musicMapper;
	
	public Music getAdminById(int musicId) {
		return musicMapper.selectByPrimaryKey(musicId);
	}

	public void addMusic(Music music) {
		musicMapper.insert(music);
	}

	public List<Music> getAllMusic() {
		return musicMapper.selectAllMusic();
	}

}
