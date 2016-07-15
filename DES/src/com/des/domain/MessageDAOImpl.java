package com.des.domain;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.des.entity.Message;

@Repository
public class MessageDAOImpl {
	@Autowired
	private SessionFactory sessionFactory;
	
	public void addMsg(Message msg){
		sessionFactory.getCurrentSession().save(msg);
	}
	public void updateMsg(Message msg){
		sessionFactory.getCurrentSession().update(msg);
	}
	public List<Message> getMsgById(int id){
		String hql = "from Message where receiver = " + id +" order by id desc";
		List<Message> list = sessionFactory.getCurrentSession().createQuery(hql).list();
		if(list.size()!=0){
			return list;
		}
		return null;
	}
	public Message getMsg(int id){
		return (Message) sessionFactory.getCurrentSession().load(Message.class, id);
	}
}
