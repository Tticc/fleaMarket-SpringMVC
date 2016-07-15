package com.des.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import com.des.domain.CommentDAOImpl;
import com.des.entity.Comment;

@Service
public class CommentServiceImpl {
	@Autowired
	private CommentDAOImpl CommentDAO;
	@Transactional
	public void addComment(Comment comment){
		CommentDAO.addComment(comment);
	}
	@Transactional
	public void deleteComment(Comment comment){
		CommentDAO.deleteComment(comment);
	}
}
