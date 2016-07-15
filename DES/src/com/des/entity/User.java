package com.des.entity;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import org.springframework.stereotype.Component;

//Ò»·½
@Component
@Entity  
@Table(name="DES_USER")  
public class User {  
    @Id
    @GeneratedValue
    @Column(name="USER_ID")
    private Integer id;

    @Column(name="USERNAME",nullable=false)  
    private String userName;

    @Column(name="PASSWORD",nullable=false)  
    private String password;
    
    @OneToMany(cascade={CascadeType.ALL},fetch = FetchType.LAZY,targetEntity = GoodsInfo.class,mappedBy="user")
    private List<GoodsInfo> goodsInfo = new ArrayList<GoodsInfo>();  
    
    @OneToMany(cascade={CascadeType.ALL},fetch = FetchType.EAGER,targetEntity = Comment.class,mappedBy="sender")
    private Set<Comment> comment = new HashSet<Comment>();
    
    public User(String usname){
    	this.userName = usname;
    }
    public User(){}
    
    //new start
    /*
    @OneToMany(cascade={CascadeType.ALL},fetch = FetchType.EAGER,targetEntity = Message.class,mappedBy="sender")
    private Set<Message> sended = new HashSet<Message>(); 
    
    @OneToMany(cascade={CascadeType.ALL},fetch = FetchType.EAGER,targetEntity = Message.class,mappedBy="receiver")
    private Set<Message> received = new HashSet<Message>();
    public Set<Message> getSended() {
		return sended;
	}
	public void setSended(Set<Message> sended) {
		this.sended = sended;
	}
	public Set<Message> getReceived() {
		return received;
	}
	public void setReceived(Set<Message> received) {
		this.received = received;
	}*/
	//new end
    	
	public Integer getId() {  
        return id;  
    }    
    public void setId(Integer id) {  
        this.id = id;  
    }    
    public String getUserName() {  
        return userName;  
    }    
    public void setUserName(String userName) {  
        this.userName = userName;  
    }  
    public String getPassword() {  
        return password;  
    }    
    public void setPassword(String password) {  
        this.password = password;  
    }  
    public List<GoodsInfo> getGoodsInfo(){
    	return this.goodsInfo;
    }
    public void setGoodsInfo(List<GoodsInfo> goodsInfo){
    	this.goodsInfo = goodsInfo;
    }
	public Set<Comment> getComment() {
		return comment;
	}
	public void setComment(Set<Comment> comment) {
		this.comment = comment;
	}
    
}  

