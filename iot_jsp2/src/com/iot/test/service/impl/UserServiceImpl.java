package com.iot.test.service.impl;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;
import com.iot.test.dao.UserDAO;
import com.iot.test.dao.impl.UserDAOImpl;
import com.iot.test.service.UserService;
import com.iot.test.vo.UserClass;

public class UserServiceImpl implements UserService {
	private Gson gs = new Gson();
	private UserDAO ud = new UserDAOImpl();

	@Override
	public HashMap<String, Object> login(HttpServletRequest req) {
		UserClass uc = gs.fromJson(req.getParameter("param"), UserClass.class);
		UserClass checkUc = ud.selectUser(uc.getUiId());

		HashMap<String, Object> hm = new HashMap<String, Object>();
		hm.put("msg", "오 로그인 성공");
		hm.put("login", "ok");
		if (checkUc != null) {
			if (!checkUc.getUiPwd().equals(uc.getUiPwd())) {
				hm.put("msg", "비번확인요망");
				hm.put("login", "no");
			} else {
				HttpSession hs = req.getSession();
				hs.setAttribute("user", checkUc);
			}
		} else {
			hm.put("msg", "아디확인요망");
			hm.put("login", "no");
		}
		return hm;
	}

	@Override
	public void logout(HttpServletRequest req) {
		HttpSession hs = req.getSession();
		hs.invalidate();

	}

	@Override
	public void signin(HttpServletRequest req) {

		String json = req.getParameter("param");
		UserClass uc = gs.fromJson(json, UserClass.class);
		int result = ud.insertUser(uc);
		HashMap<String, String> rm = new HashMap<String, String>();
		rm.put("result", "no");
		rm.put("msg", "falut");
		
		if (result == 1) {
			rm.put("result", "ok");
			rm.put("msg", "success");
			HttpSession hs = req.getSession();
			hs.setAttribute("user", uc);

		}

		req.setAttribute("resStr", gs.toJson(rm));

	}

	@Override
	public ArrayList<UserClass> getUserList() {
		
		return  ud.selectUserList();
	}
}
