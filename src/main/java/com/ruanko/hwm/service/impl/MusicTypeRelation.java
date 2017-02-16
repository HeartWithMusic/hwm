package com.ruanko.hwm.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.ruanko.hwm.bean.MusicTypeRela;
import com.ruanko.hwm.dao.MusicTypeRelaMapper;
import com.ruanko.hwm.service.IMusicTypeRelationService;
@Service
public class MusicTypeRelation implements IMusicTypeRelationService {

	@Resource
	private MusicTypeRelaMapper mtrMapper;
	
	public List<MusicTypeRela> getMusicByTypeId(Integer typeId) {
		return mtrMapper.selectByMusicTypeId(typeId);
	}

	public void addMusicTR(MusicTypeRela mtr) {
		mtrMapper.insert(mtr);
	}

	public void updateMusicTR(MusicTypeRela mtr) {
		mtrMapper.updateByPrimaryKey(mtr);
		
	}

}
