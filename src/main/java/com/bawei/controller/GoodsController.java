package com.bawei.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.bawei.entity.Brand;
import com.bawei.entity.Condition;
import com.bawei.entity.Goods;
import com.bawei.entity.Skind;
import com.bawei.service.GoodsService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

@Controller
public class GoodsController {
	@Autowired
	private GoodsService service;
	
	@RequestMapping("list.do")
	public String queryAll(Model m,Condition con) {
		if(con.getPageNum()==null) {
			con.setPageNum(1);
		}
		PageHelper.startPage(con.getPageNum(), 3);
		List<Goods> list=service.queryAll(con);
		PageInfo<Goods> page=new PageInfo<Goods>(list);
		
		m.addAttribute("page", page);
		m.addAttribute("list", list);
		m.addAttribute("con", con);
		return "list";
	}
	
	@RequestMapping("queryAllBrandAndSkind.do")
	public String queryAllBrandAndSkind(Model m) {
		List<Brand> brands=service.queryAllBrand();
		List<Skind> skinds=service.queryAllSkind();
		m.addAttribute("brands", brands);
		m.addAttribute("skinds", skinds);
		return "add";
		
	}
	@ResponseBody
	@RequestMapping("queryAllBrand.do")
	public Object queryAllBrand(Model m) {
		List<Brand> brands=service.queryAllBrand();
		return brands;
		
	}
	@ResponseBody
	@RequestMapping("queryAllSkind.do")
	public Object queryAllSkind(Model m) {
		List<Skind> skinds=service.queryAllSkind();
		return skinds;
		
	}
	@ResponseBody
	@RequestMapping("addGoods.do")
	public boolean addGoods(Goods good,MultipartFile myfile) {
		System.out.println(good);
		int i=service.addGoods(good);
		
		if(i>0) {
			return true;
		}else {
			return false;
		}
	}
	
	
	@ResponseBody
	@RequestMapping("queryGood.do")
	public Object queryGood(String gid) {
		Goods good=service.queryOneGood(gid);
		return good;
	}
	
	@RequestMapping("deleteAll.do")
	public String deleteAll(String ids) {
		if(ids.length()>0) {
			String gids=ids.substring(0, ids.length()-1);
			String[] split = gids.split(",");
			Integer []gidarray=new Integer[split.length];
			for (int i = 0; i < split.length; i++) {
				gidarray[i]=Integer.parseInt(split[i]);
			}
			int j=service.deleteAll(gidarray);
		}
		
		
		return "redirect:list.do";
	}
	
	@RequestMapping("deleteOne.do")
	public String deleteOne(String gid) {
		service.deleteOne(gid);
		return "redirect:list.do";
	}
	@ResponseBody
	@RequestMapping("updateGood.do")
	public boolean updateOneGood(Goods good) {
		int i=service.updateOneGood(good);
		if(i>0) {
			return true;
		}else {
			return false;
		}
	} 
}
