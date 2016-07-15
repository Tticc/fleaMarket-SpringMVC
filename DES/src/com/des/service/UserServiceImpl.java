package com.des.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.des.domain.UserDAOImpl;
import com.des.entity.User;

@Service
public class UserServiceImpl {
	@Autowired
	private UserDAOImpl userDAO;
	
	
	
	@Transactional
	public void addUser(User user){
		userDAO.addUser(user);
	}
	@Transactional
	public User getUserByName(String userName){
		return userDAO.getUserByName(userName);
	}
	@Transactional
	public void deleteUser(User user){
		userDAO.deleteUser(user);
	}
	@Transactional
	public User updateUser(User user){
		return userDAO.updateUser(user);
	}
	@Transactional
	public User getUser(int id){
		return userDAO.getUser(id);
	}
	@Transactional
	public List<User> getUser() {
		return userDAO.getUser();
		
	}
}
