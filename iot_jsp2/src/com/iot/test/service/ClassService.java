package com.iot.test.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.iot.test.vo.ClassInfo;
import com.iot.test.vo.UserClass;

public interface ClassService {
	public  ArrayList<ClassInfo> getClassList(); 
	public void logout(HttpServletRequest req);
	public void insert(HttpServletRequest req);
	
	public String deleteClass(HttpServletRequest req);
	public String updateClass(HttpServletRequest req);
}
