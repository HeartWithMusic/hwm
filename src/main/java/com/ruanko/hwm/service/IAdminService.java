package com.ruanko.hwm.service;



import com.ruanko.hwm.bean.Admin;


public interface IAdminService {

	public Admin getAdminById(int adminId);
	
	public void addAdmin(Admin admin);
	
}
