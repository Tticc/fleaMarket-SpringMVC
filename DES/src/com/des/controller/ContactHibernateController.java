package com.des.controller;

import java.util.Map;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.des.entity.*;
import com.des.service.*;

@Controller
public class ContactHibernateController {
	 	@Autowired
	    private ContactServiceImpl contactService;
	 	@Autowired
		private UserServiceImpl userServiceImpl;
	    /*@RequestMapping("/index")
	    public String listContacts(Map<String, Object> map) {
	 
	        map.put("contact", new Contact());
	        map.put("contactList", contactService.listContact());
	 
	        return "contacts/contact";
	    }*/
	 
	    @RequestMapping(value = "/add", method = RequestMethod.POST)
	    public String addContact(Contact contact){
	        contactService.addContact(contact);	 
	        return "/Hello";
	    }
	    /*@RequestMapping(value = "/userss", method = RequestMethod.POST)
	    public String addUser(User user){
	    	System.out.println("before");
			System.out.println(user.getPassword());
			System.out.println(user.getUserName());
			userServiceImpl.addUser(user);
			System.out.println("after");
			System.out.println(user.getPassword());
			System.out.println(user.getUserName()); 
	        return "/Hello";
	    }*/
	    /*public String addContact(@ModelAttribute("contact")
	    Contact contact, BindingResult result){
	 
	        contactService.addContact(contact);
	 
	        return "redirect:/index";
	    }*/
	 
	    /*@RequestMapping("/delete/{contactId}")
	    public String deleteContact(@PathVariable("contactId")
	    Integer contactId) {
	 
	        contactService.removeContact(contactId);
	 
	        return "redirect:/index";
	    }*/
}

