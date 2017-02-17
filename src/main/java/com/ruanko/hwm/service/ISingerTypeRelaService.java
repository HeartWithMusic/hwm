package com.ruanko.hwm.service;

import java.util.List;

import com.ruanko.hwm.bean.SingerTypeRela;

public interface ISingerTypeRelaService {
	List<SingerTypeRela> getSingerByTypeId(Integer typeId);
	
	void addSingerTR(SingerTypeRela str);
	
	void updateSingerTR(SingerTypeRela str);
}
