package ignis.dao;

import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;

import ignis.bean.User;
import ignis.mybatis.service.FactoryService;


public class MemberDAO {

	public boolean insert(String id, String pass, String name, int birth
			, String addr, int phone, String email, int level) {
		SqlSession ss = FactoryService.getFactory().openSession(true);
		HashMap<String, Object> map = new HashMap<>();
		map.put("id", id);
		map.put("pass", pass);
		map.put("name", name);
		map.put("birth", birth);
		map.put("addr", addr);
		map.put("phone", phone);
		map.put("email", email);
		map.put("level", level);
		
		int result = ss.insert("member.add", map);
		ss.close();
		return (result > 0) ? true : false;
	}

	public User isMember(String id) {
		SqlSession ss = FactoryService.getFactory().openSession(true);
		User user = null; 
		user = (User) ss.selectOne("member.selectId", id);
		return user;
	}

}
