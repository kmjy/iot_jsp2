package com.iot.test.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;
import com.iot.test.dao.ClassDAO;
import com.iot.test.dao.UserDAO;
import com.iot.test.dao.impl.ClassDAOImpl;
import com.iot.test.dao.impl.UserDAOImpl;
import com.iot.test.service.ClassService;
import com.iot.test.vo.ClassInfo;
import com.iot.test.vo.UserClass;

public class ClassServiceImpl implements ClassService {
	
	private Gson gs = new Gson();
	private ClassDAO cd = new ClassDAOImpl();
	
	
	@Override
	public ArrayList<ClassInfo> getClassList() {
		return  cd.selectClassList();
	
	}
	@Override
	public void logout(HttpServletRequest req) {
	
		HttpSession hs = req.getSession();
		hs.invalidate();

	}
	@Override
	public void insert(HttpServletRequest req) {
		
		String json = req.getParameter("param");
		ClassInfo uc = gs.fromJson(json, ClassInfo.class);
		int result = cd.insertClass(uc);
		HashMap<String, String> rm = new HashMap<String, String>();
		if (result == 1) {
			rm.put("result", "ok");
			rm.put("msg", "success");
		}
		req.setAttribute("resStr", gs.toJson(rm));
	}
	
	
	
	@Override
	public String deleteClass(HttpServletRequest req) {
		int ciNo = Integer.parseInt(req.getParameter("ciNo"));
		ClassInfo ci = new ClassInfo();
		ci.setCiNo(ciNo);
		int result = cd.deleteClass(ci);
		HashMap<String, String> rm = new HashMap<String, String>();
		rm.put("result", "no");
		rm.put("msg", "아직 반에 인원이 남아  있습니다");
		
		
		if(result ==1) {
			rm.put("result", "ok");
			rm.put("msg", "success");
			
		}
		return gs.toJson(rm);
	}
	@Override
	public String updateClass(HttpServletRequest req) {
		String param = req.getParameter("param");
		ClassInfo ci = gs.fromJson(param, ClassInfo.class);
		
		int result = cd.updateClass(ci);
		HashMap<String, String> rm = new HashMap<String, String>();
		rm.put("result", "no");
		rm.put("msg", "falut");
		
		
		if(result ==1) {
			rm.put("result", "ok");
			rm.put("msg", "success");
			
		}
		return gs.toJson(rm);
		
	}
	




}
