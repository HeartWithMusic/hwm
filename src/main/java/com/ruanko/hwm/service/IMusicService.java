package com.ruanko.hwm.service;

import java.util.List;

import com.ruanko.hwm.bean.Music;

public interface IMusicService {
	public Music getAdminById(int musicId);
	
	public void addMusic(Music music);
	
	public List<Music> getAllMusic();
}
