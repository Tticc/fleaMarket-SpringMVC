package com.des.domain;

import java.util.*;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.des.entity.User;

@Repository
public class UserDAOImpl {
	@Autowired
	private SessionFactory sessionFactory;
	
	public User getUserByName(String userName){
		String Qu = "from  User WHERE userName =  '"+ userName +"'";
		//System.out.println("\n\n\nhere is the userName1: " + userName);
		List<User> ur = sessionFactory.getCurrentSession().createQuery(Qu).list();
		if(ur.size()!=0){
			//System.out.println("\n\n\nhere is the userName2: " + ur.get(0).getUserName());
			return ur.get(0);
		}
		return null;
	}
	
	public void addUser(User user){
		sessionFactory.getCurrentSession().save(user);
	}
	
	public void deleteUser(User user){
		if(null!=user){
			sessionFactory.getCurrentSession().delete(user);
		}
	}
	public User updateUser(User user){
		if(null!=user){
			sessionFactory.getCurrentSession().update(user);
		}
		return (User) sessionFactory.getCurrentSession().get(User.class, user.getId());
	}
	
	public User getUser(int id){
		return (User) sessionFactory.getCurrentSession().load(User.class, id);
	}

	public List<User> getUser() {
		List<User> ur = sessionFactory.getCurrentSession().createQuery("from User").list();
		if(ur!=null){
			return ur;
		}
		return null;
	}
	
}
