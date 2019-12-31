package com.bawei.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bawei.dao.GoodsDao;
import com.bawei.entity.Brand;
import com.bawei.entity.Condition;
import com.bawei.entity.Goods;
import com.bawei.entity.Skind;
import com.bawei.service.GoodsService;
@Service
public class GoodsServiceImpl implements GoodsService {
	@Autowired
	private GoodsDao dao;
	
	@Override
	public List<Goods> queryAll(Condition con) {
		// TODO Auto-generated method stub
		return dao.queryAll(con);
	}

	@Override
	public List<Brand> queryAllBrand() {
		// TODO Auto-generated method stub
		return dao.queryAllBrand();
	}

	@Override
	public List<Skind> queryAllSkind() {
		// TODO Auto-generated method stub
		return dao.queryAllSkind();
	}

	@Override
	public int addGoods(Goods good) {
		// TODO Auto-generated method stub
		return dao.addGoods(good);
	}

	@Override
	public Goods queryOneGood(String gid) {
		// TODO Auto-generated method stub
		return dao.queryOneGood(gid);
	}

	@Override
	public int deleteAll(Integer[] gidarray) {
		// TODO Auto-generated method stub
		return dao.deleteAll(gidarray);
	}

	@Override
	public void deleteOne(String gid) {
		// TODO Auto-generated method stub
		dao.deleteOne(gid);
	}

	@Override
	public int updateOneGood(Goods good) {
		// TODO Auto-generated method stub
		return dao.updateOneGood(good);
	}

}
