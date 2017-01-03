package ignis.dao;

import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;

import ignis.mybatis.service.FactoryService;


public class MemberDAO {

	public boolean insert(String id, String pass, String name, String birth, String addr, String phone, String email) {
		SqlSession ss = FactoryService.getFactory().openSession(true);
		HashMap<String, String> map = new HashMap<>();
		map.put("id", id);
		map.put("pass", pass);
		map.put("name", name);
		map.put("birth", birth);
		map.put("addr", addr);
		map.put("phone", phone);
		map.put("email", email);
		
		int result = ss.insert("member.add", map);
		ss.close();
		return (result > 0) ? true : false;
	}

}
