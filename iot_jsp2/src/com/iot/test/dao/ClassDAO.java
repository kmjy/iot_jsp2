package com.iot.test.dao;

import java.util.ArrayList;
import java.util.List;

import com.iot.test.vo.ClassInfo;
import com.iot.test.vo.UserClass;

public interface ClassDAO {
	
	ArrayList<ClassInfo> selectClassList();
	ClassInfo selectClass(int ciNo);
	int insertClass(ClassInfo ci);
	int updateClass(ClassInfo ci);
	int deleteClass(ClassInfo ci);

}
