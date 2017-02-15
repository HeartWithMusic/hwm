package com.ruanko.hwm.service;

import java.util.List;

import com.ruanko.hwm.bean.User;

public interface IUserService {
	public List<User> findAllUser();

	public void  deleteUserById(int userId);

	public void updateUser(int userId);

	public User findUser(int userId);
}