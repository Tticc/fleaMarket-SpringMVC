package com.des.entity;

import java.util.ArrayList;
import java.util.List;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import org.springframework.stereotype.Component;

//多方
@Component
@Entity
@Table(name="GOODSINFO")
public class GoodsInfo {
	@Id
	@GeneratedValue
	@Column(name="GOODSINFO_ID")
	private int id;
	
	@ManyToOne(cascade={CascadeType.MERGE,CascadeType.PERSIST,CascadeType.REFRESH})
	@JoinColumn(name="USER_ID",nullable=false)//
	private User user;//商品发布人
	
	@OneToMany(cascade={CascadeType.ALL},fetch = FetchType.LAZY,targetEntity = Comment.class,mappedBy="goodsInfo")
    private List<Comment> comment = new ArrayList<Comment>();//该商品评论,评论要排序，要使用list
	
	@Column(name="GOODSNAME",nullable=false)
	private String goodsName;//商品名称
	
	@Column(name="TYPE",nullable=false)
	private String type;//商品类型，用来查询
	
	@Column(name="PRICE",nullable=false)
	private int price;//商品价格
	
	@Column(name="LINKNAME",nullable=false)
	private String linkName;//联系人
	
	@Column(name="PHONE",nullable=false)
	private String phone;//联系电话
	
	@Column(name="DETAIL")
	private String detail;//商品详情
	
	@Column(name="PHOTO")
	private String photo;//图片
	
	@Column(name="PUBLISHTIME",nullable=false)
	private String publishTime;//发布时间
	
	@Column(name="NEWCOMMENT",nullable=false)
	private String newComment;//最新评论
	
	@Column(name="TITLE",nullable=false)
	private String title;//展示标题
	
	@Column(name="READTIMES",nullable=false)
	private int readTimes;//浏览次数
	
	public List<Comment> getComment() {
		return comment;
	}
	public void setComment(List<Comment> comment) {
		this.comment = comment;
	}
	public GoodsInfo(){
		this.price=0;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public String getLinkName() {
		return linkName;
	}
	public void setLinkName(String linkName) {
		this.linkName = linkName;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getDetail() {
		return detail;
	}
	public void setDetail(String detail) {
		this.detail = detail;
	}
	public String getPhoto() {
		return photo;
	}
	public void setPhoto(String photo) {
		this.photo = photo;
	}
	public String getPublishTime() {
		return publishTime;
	}
	public void setPublishTime(String publishTime) {
		this.publishTime = publishTime;
	}
	public String getNewComment() {
		return newComment;
	}
	public void setNewComment(String newComment) {
		this.newComment = newComment;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public int getId(){
		return this.id;
	}
	public void setId(int id){
		this.id = id;
	}
	public String getGoodsName(){
		return this.goodsName;
	}
	public void setGoodsName(String goodsName){
		this.goodsName = goodsName;
	}
	public String getType(){
		return this.type;
	}
	public void setType(String type){
		this.type = type;
	}
	public User getUser(){
		return this.user;
	}
	public void setUser(User user){
		this.user = user;
	}
	public int getReadTimes() {
		return readTimes;
	}
	public void setReadTimes(int readTimes) {
		this.readTimes = readTimes;
	}
}
