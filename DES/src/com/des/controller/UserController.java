package com.des.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.des.entity.Comment;
import com.des.entity.Goods;
import com.des.entity.Message;
import com.des.entity.User;
import com.des.service.CommentServiceImpl;
import com.des.service.GoodsInfoServiceImpl;
import com.des.service.MessageServiceImpl;
import com.des.service.UserServiceImpl;
import com.des.util.Util;

@Controller
public class UserController {
	@Autowired
	private UserServiceImpl userService;
	@Autowired
	private GoodsInfoServiceImpl goodsInfoService;
	@Autowired
	private User user;
	@Autowired
	private CommentServiceImpl CommentService;
	@Autowired
	private Comment comment;
	@Autowired
	private MessageServiceImpl messageService;
	
	//���ӳ�ʼ���û�
	@RequestMapping(value="/user",method = RequestMethod.GET)
	public String addUser(){
		/*user.setUserName("cv");
		user.setPassword("admin");
		userService.addUser(user);*/
		/*user.setUserName("����");
		user.setPassword("admin");
		userService.addUser(user);*/
		return "redirect:/index";
	}
	
	//��ת����ҳ return "jsp/error";
	@RequestMapping(value="/index",method=RequestMethod.GET)
	public String index(Model model){
		if(userService.getUser().size()==0){
			System.out.println("\n\n\n��ʼ���û���");
			
			User u1 = new User();
			u1.setUserName("cv");
			u1.setPassword("admin");
			userService.addUser(u1);
			
			User u2 = new User();
			u2.setUserName("����");
			u2.setPassword("admin");
			userService.addUser(u2);
			
			User u3 = new User();
			u3.setUserName("cvs");
			u3.setPassword("admin");
			userService.addUser(u3);
		}
		List<Goods> list = new ArrayList<Goods>();
		list = goodsInfoService.getAllGoods();
		
		String[] pho ;
		if(null != list && 0 != list.size()){
			for(Goods g : list){
				pho = g.getPhoto().split(";");
				if(pho[0].length()<1){
					pho[0]="/DES/upload/default_swu.jpg";
				}
				g.setPhoto(pho[0]);
				if(g.getTitle().length()>7){//�����������ֻ��ʾǰ�߸���
					g.setTitle(g.getTitle().substring(0, 7));
				}
			}
			System.out.println(list.get(0).getTitle());
			model.addAttribute("goodlist", list);
		}
		return "jsp/index";
	}
	//��¼ POST
	@RequestMapping(value="/login",method = RequestMethod.POST)
	public String loginP(User user,Model model,HttpSession session){
		User u = userService.getUserByName(user.getUserName());
		if(null != u && u.getPassword().equals(user.getPassword())){
			session.setAttribute("usern", u.getUserName());
			session.setAttribute("userid", u.getId());
			//System.out.println(session.getAttribute("userid"));
			return "redirect:/index";
		}
		model.addAttribute("message","�û������������");
		return "jsp/login";
	}
	//��¼ GET
	@RequestMapping(value="/login",method = RequestMethod.GET)
	public String logout(HttpServletRequest request){
		String backUrl=request.getRequestURI();
		System.out.println("\n\n\nhere is the backUrl:"+backUrl);
		return "jsp/login";
	}
	//�˳���¼
	@RequestMapping(value="/logout",method = RequestMethod.GET)
	public String logout(HttpSession session){
		session.setAttribute("usern",null);
		return "redirect:/index";
	}
	//�鿴�û�
	@RequestMapping(value="/touchUser/{id}",method = RequestMethod.GET)
	public String touchUser(@PathVariable int id,Model model){
		User u = userService.getUser(id);
		if(u==null){
			return "jsp/error";
		}
		model.addAttribute("user", u);
		return "jsp/touchUser";
	}
	//������Ϣ��
	@RequestMapping(value="sendMessage/{id}",method=RequestMethod.GET)
	public String sendIt(@PathVariable int id,HttpSession session){
		if(null == session.getAttribute("usern")){
			return "redirect:/login";//�ض��򣬵�������������������login һ��get һ�� post ������ĸ��أ������get
		}
		return "jsp/touchUser";
	}
	//������Ϣ��
	@RequestMapping(value="sendMessage/{id}",method=RequestMethod.POST)
	public String sendIt(@PathVariable int id,Message msg ,HttpSession session,Model model){
		if(null == session.getAttribute("usern")){
			System.out.println("\n\nhere is the addGoods method\n\n");
			return "redirect:/login";//�ض��򣬵�������������������login һ��get һ�� post ������ĸ��أ������get
		}
		//System.out.println(id);
		User u = userService.getUser(id);
		if(u==null){
			return "jsp/error";
		}
		//msg.setSender(userService.getUserByName(session.getAttribute("usern").toString()).getId());

		msg.setSender(Integer.parseInt(session.getAttribute("userid").toString()));
		msg.setReceiver(id);
		msg.setSendtime(Util.getFormatDateAll());
		msg.setMessage(msg.getMessage());
		msg.setIsRead("not");

		messageService.addMsg(msg);
		model.addAttribute("user", u);
		model.addAttribute("status", "��Ϣ���ͳɹ���");
		return "jsp/touchUser";
	}
	//�г���Ϣ
	@RequestMapping(value = "listMsg" , method = RequestMethod.GET)
	public String listMsg(Model model,HttpSession session){
		if(null == session.getAttribute("usern")){
			//System.out.println("\n\nhere is the addGoods method\n\n");
			return "redirect:/login";//�ض��򣬵�������������������login һ��get һ�� post ������ĸ��أ������get
		}
		int id = Integer.parseInt(session.getAttribute("userid").toString());
		List<Message> list = messageService.getMsgById(id);
		//System.out.println(list.size());
		//System.out.println(list.get(0).getMessage());
		String message = "";
		if(list!=null){
			for(Message msg : list){
				message = msg.getMessage();
				if(message.length()>10){
					msg.setMessage(message.substring(0, 9)+"......");
					//System.out.println("\n\nhere is the length:"+message.length()+"\n\n");
				}
			}
		}
		model.addAttribute("list", list);
		return "jsp/msgList";
	}
	//�鿴��Ϣ����
	@RequestMapping(value="msgDetail/{id}",method = RequestMethod.GET)
	public String msgDetail(@PathVariable int id ,Model model,HttpSession session){
		if(null == session.getAttribute("usern")){
			System.out.println("\n\nhere is the addGoods method\n\n");
			return "redirect:/login";//�ض��򣬵�������������������login һ��get һ�� post ������ĸ��أ������get
		}
		Message msg = messageService.getMsg(id);
		User u = userService.getUser(msg.getSender());
		if(u==null){
			return "jsp/error";
		}
		/*if(msg !=null){
			model.addAttribute("msg", msg);
		}else{
			return "redirect:error.jsp";
		}*/
		model.addAttribute("msg", msg);
		model.addAttribute("userName", u.getUserName());
		msg.setIsRead("hasRead");//���Ϊ�Ѷ�
		messageService.updateMsg(msg);//��������
		return "jsp/msgDetail";
	}
	
	//����ɾ���û� ����
	@Deprecated
	@RequestMapping(value="/del",method = RequestMethod.GET)
	public String deleteUser(Model model){
		User user = userService.getUserByName("����");
		if(null != user){
			System.out.println(user.getPassword());
			System.out.println(user.getUserName());
			model.addAttribute(user);//ͨ��${user.xxx}��ȡ����
		}
		userService.deleteUser(user);
		return "redirect:/index";
	}

	// ���Լ��� ����
	@Deprecated
	@RequestMapping(value = "/cas", method = RequestMethod.GET)
	public String testCas() {
		// getUser();
		comment.setComment("this is the first comment");
		comment.setCommentTime(Util.getFormatDateAll());
		comment.setSender(userService.getUserByName("cv"));
		CommentService.addComment(comment);
		return "/index";
	}
	//ע���û� ����
	@Deprecated
	@RequestMapping(value="/getu",method = RequestMethod.POST)
	public String getUser(User user){
		System.out.println(user.getUserName());
		userService.addUser(user);
		System.out.println(user.getPassword());
		return "/addUser";
	}
}
