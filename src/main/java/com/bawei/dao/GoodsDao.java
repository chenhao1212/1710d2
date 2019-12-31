package com.bawei.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.bawei.entity.Brand;
import com.bawei.entity.Condition;
import com.bawei.entity.Goods;
import com.bawei.entity.Skind;

public interface GoodsDao {

	List<Goods> queryAll(Condition con);

	List<Brand> queryAllBrand();

	List<Skind> queryAllSkind();

	int addGoods(Goods good);

	Goods queryOneGood(String gid);

	int deleteAll(@Param("gidarray")Integer[] gidarray);

	void deleteOne(String gid);

	int updateOneGood(Goods good);

}
