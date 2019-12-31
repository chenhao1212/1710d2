package com.bawei.service;

import java.util.List;

import com.bawei.entity.Brand;
import com.bawei.entity.Condition;
import com.bawei.entity.Goods;
import com.bawei.entity.Skind;

public interface GoodsService {

	List<Goods> queryAll(Condition con);

	List<Brand> queryAllBrand();

	List<Skind> queryAllSkind();

	int addGoods(Goods good);

	Goods queryOneGood(String gid);

	int deleteAll(Integer[] gidarray);

	void deleteOne(String gid);

	int updateOneGood(Goods good);

}
