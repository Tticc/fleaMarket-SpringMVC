package com.des.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.des.domain.GoodsInfoDAOImpl;
import com.des.entity.Goods;
import com.des.entity.GoodsInfo;
import com.des.entity.User;

@Service
public class GoodsInfoServiceImpl {
	@Autowired
	private GoodsInfoDAOImpl GoodsInfoDAO;
	
	@Transactional
	public void addGoodsInfo(GoodsInfo goodsInfo){
		GoodsInfoDAO.addGoodsInfo(goodsInfo);
	}
	
	@Transactional
	public void deleteGoodsInfo(GoodsInfo goodsInfo){
		GoodsInfoDAO.deleteGoodsInfo(goodsInfo);
	}
	@Transactional
	public void updateGoodsInfo(GoodsInfo goodsInfo){
		GoodsInfoDAO.updateGoodsInfo(goodsInfo);
		
	}
	@Transactional
	public List<Goods> getGoodsByType(String type){
		return GoodsInfoDAO.getGoodsByType(type);
	}
	@Transactional
	public List<Goods> getAllGoods(){
		return GoodsInfoDAO.getAllGoods();
	}
	@Transactional
	public GoodsInfo getGoodsByTypes(String type){
		return GoodsInfoDAO.getGoodsByTypes(type);
	}
	@Transactional
	public GoodsInfo getGoods(int id){
		return GoodsInfoDAO.getGoods(id);
	}
	@Transactional
	public List<GoodsInfo> getGoodsByUser(User user){
		return GoodsInfoDAO.getGoodsByUser(user);
	}
}
