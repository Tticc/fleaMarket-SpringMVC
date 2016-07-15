package com.des.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.des.domain.MessageDAOImpl;
import com.des.entity.Message;

@Service
public class MessageServiceImpl {
	@Autowired
	private MessageDAOImpl messageDAO;
	@Transactional
	public void addMsg(Message msg){
		messageDAO.addMsg(msg);
	}
	@Transactional
	public void updateMsg(Message msg){
		messageDAO.updateMsg(msg);
	}
	@Transactional
	public List<Message> getMsgById(int id){
		return messageDAO.getMsgById(id);
	}
	@Transactional
	public Message getMsg(int id){
		return messageDAO.getMsg(id);
	}
}
