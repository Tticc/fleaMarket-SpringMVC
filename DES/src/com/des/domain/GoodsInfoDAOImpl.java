package com.des.domain;

import java.util.*;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.des.entity.*;

@Repository
public class GoodsInfoDAOImpl {
	@Autowired
	private Goods goods;
	@Autowired
	private SessionFactory sessionFactory;
	
	public void addGoodsInfo(GoodsInfo goodsInfo){
		sessionFactory.getCurrentSession().save(goodsInfo);
	}
	public void deleteGoodsInfo(GoodsInfo goodsInfo){
		if(null != goodsInfo){
			sessionFactory.getCurrentSession().delete(goodsInfo);
		}
	}
	public void updateGoodsInfo(GoodsInfo goodsInfo){
		sessionFactory.getCurrentSession().update(goodsInfo);
		
	}
	public List<Goods> getGoodsByType(String type){
		String hql = "from GoodsInfo where type = '" + type +"' order by newcomment desc";
		List<GoodsInfo> goodInfoList = sessionFactory.getCurrentSession().createQuery(hql).list();
		List<Goods> goodList = new ArrayList<Goods>();
		if(goodInfoList.size()!=0){
			for(GoodsInfo goodsInfo : goodInfoList){
				goodList.add(change(goodsInfo));
			}
			return goodList;
		}
		return null;
	}
	public List<Goods> getAllGoods(){
		String hql = "from GoodsInfo order by newcomment desc";
		List<GoodsInfo> goodInfoList = sessionFactory.getCurrentSession().createQuery(hql).list();
		List<Goods> goodList = new ArrayList<Goods>();
		if(goodInfoList.size()!=0){
			for(GoodsInfo goodsInfo : goodInfoList){
				goodList.add(change(goodsInfo));
			}
			return goodList;
		}
		return null;
	}
	public GoodsInfo getGoods(int id){
		String hql = "from GoodsInfo where id = " + id ;
		List<GoodsInfo> goods = sessionFactory.getCurrentSession().createQuery(hql).list();
		if(goods.size()!=0){
			return goods.get(0);
		}
		return null;
	}
	public List<GoodsInfo> getGoodsByUser(User user){
		String hql = "from GoodsInfo where user = " + user +"order by id desc";
		List<GoodsInfo> goods = sessionFactory.getCurrentSession().createQuery(hql).list();
		
		return goods;
	}
	@Deprecated
	public GoodsInfo getGoodsByTypes(String type){
		String hql = "from GoodsInfo where type = '" + type +"'";
		List<GoodsInfo> goods = sessionFactory.getCurrentSession().createQuery(hql).list();
		if(goods.size()!=0){			
			return goods.get(0);
		}
		return null;
	}
	
	
	private Goods change(GoodsInfo gs){
		Goods goods = new Goods();
		goods.setId(gs.getId());
		goods.setGoodsName(gs.getGoodsName());
		goods.setDetail(gs.getDetail());
		goods.setLinkName(gs.getLinkName());
		goods.setPhone(gs.getPhone());
		goods.setPhoto(gs.getPhoto());
		goods.setTitle(gs.getTitle());
		goods.setPrice(gs.getPrice());
		goods.setType(gs.getType());
		goods.setPublishTime(gs.getPublishTime());
		goods.setNewComment(gs.getNewComment());
		goods.setReadTimes(gs.getReadTimes());
		return goods;
	}
}
