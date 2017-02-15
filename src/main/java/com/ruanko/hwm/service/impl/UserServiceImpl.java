package com.ruanko.hwm.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.ruanko.hwm.bean.User;
import com.ruanko.hwm.dao.AdminMapper;
import com.ruanko.hwm.dao.UserMapper;
import com.ruanko.hwm.service.IUserService;

@Service("userService")
public class UserServiceImpl implements IUserService{

	@Resource
	private UserMapper userMapper;

	public List<User> findAllUser() {
		return userMapper.queryAllUser();
	}

	public void  deleteUserById(int userId) {
		userMapper.deleteByPrimaryKey(userId);
	}

	public void updateUser(int userId) {
	}

	public User findUser(int userId) {
		return userMapper.selectByPrimaryKey(userId);
	}

}
