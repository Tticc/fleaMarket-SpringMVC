package com.des.domain;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.des.entity.Comment;

@Repository
public class CommentDAOImpl {
	@Autowired
	private SessionFactory sessionFactory;
	public void addComment(Comment comment){
		sessionFactory.getCurrentSession().save(comment);
	}
	public void deleteComment(Comment comment){
		Comment com = (Comment) sessionFactory.getCurrentSession().load(Comment.class, comment.getId());
			sessionFactory.getCurrentSession().delete(com);
	}
	
}
