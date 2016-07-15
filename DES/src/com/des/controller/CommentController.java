package com.des.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.des.entity.Comment;
import com.des.entity.GoodsInfo;
import com.des.service.CommentServiceImpl;
import com.des.service.GoodsInfoServiceImpl;
import com.des.service.UserServiceImpl;
import com.des.util.Util;

@Controller
public class CommentController {
	@Autowired
	private CommentServiceImpl commentService;
	@Autowired
	private GoodsInfoServiceImpl goodsInfoService;
	@Autowired
	private UserServiceImpl userService;	
	@Autowired
	private Comment com;
	@Autowired
	private GoodsInfo goodsInfo;
	
	@RequestMapping(value="addComment/{id}",method=RequestMethod.POST)
	public String addComment(@RequestParam String comment,@PathVariable int id,HttpSession session){//method="addComment/${goodsInfo.id}"
		System.out.println("\n\nhere is the comment: ");
		if(null == session.getAttribute("usern")){
			return "redirect:/login";//�ض��򣬵�������������������login һ��get һ�� post ������ĸ��أ������get
		}
		goodsInfo = goodsInfoService.getGoods(id);
		com.setComment(comment);
		com.setCommentTime(Util.getFormatDateAll());
		com.setGoodsInfo(goodsInfo);
		com.setSender(userService.getUserByName(session.getAttribute("usern").toString()));		
		commentService.addComment(com);//��������
		
		//���� goodsinfo ��� newComment �ֶ�
		goodsInfo.setNewComment(Util.getFormatDateAll());
		goodsInfoService.updateGoodsInfo(goodsInfo);
		return "redirect:/detail/" + id;//�ض��򵽴���չʾ��Ʒ��Ϣ������
	}
}
