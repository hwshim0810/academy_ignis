package ignis.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import ignis.bean.User;
import ignis.mybatis.service.FactoryService;


public class MemberDAO {
	private static MemberDAO memDao = new MemberDAO();

	private MemberDAO() {}

	public static MemberDAO getInstance() {
		return memDao;
	}
	

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
		SqlSession ss = FactoryService.getFactory().openSession();
		User user = null; 
		user = (User) ss.selectOne("member.selectId", id);
		return user;
	}

	public User getUserId(String email) {
		SqlSession ss = FactoryService.getFactory().openSession();
		User user = null; 
		user = (User) ss.selectOne("member.selectEmail", email);
		return user;
	}

	public boolean getUserPass(String id, String name, String email) {
		SqlSession ss = FactoryService.getFactory().openSession();
		HashMap<String, Object> map = new HashMap<>();
		User user = null; 

		map.put("id", id);
		map.put("name", name);
		map.put("email", email);
		
		user = ss.selectOne("member.selectUserInfo", map);
		ss.close();
		return (user != null) ? true : false;
	}
	
	public List<User> getUserAll(int begin, int end) {
		SqlSession ss = FactoryService.getFactory().openSession();
		HashMap<String, Object> map = new HashMap<>();
		
		map.put("begin", begin);	
		map.put("end", end);
		
		List<User> list = ss.selectList("member.selectAll", map);
		ss.close();
		
		return list;
	}
	
	public int getUserCount() {
		SqlSession ss = FactoryService.getFactory().openSession();
		int count = ss.selectOne("member.selectUserCount");
		ss.close();
		
		return count;
	}

	public boolean adupdateMem(String id, String name, int birth, 
			String addr, int phone, String email, int level) {
		SqlSession ss = FactoryService.getFactory().openSession(true);
		HashMap<String, Object> map = new HashMap<>();

		map.put("id", id);
		map.put("name", name);
		map.put("birth", birth);
		map.put("addr", addr);
		map.put("phone", phone);
		map.put("email", email);
		map.put("level", level);
		
		int result = ss.update("member.adupdateMem", map);
		ss.close();					
		return (result > 0) ? true : false;
	}

	public boolean updateMem(String id, int birth, String addr, int phone, String email) {
		SqlSession ss = FactoryService.getFactory().openSession(true);
		HashMap<String, Object> map = new HashMap<>();
	
		map.put("id", id);
		map.put("birth", birth);
		map.put("addr", addr);
		map.put("phone", phone);
		map.put("email", email);
		
		int result = ss.update("member.updateMem", map);
		ss.close();					
		return (result > 0) ? true : false;
	}

	public boolean updatePass(String id, String pass) {
		SqlSession ss = FactoryService.getFactory().openSession(true);
		HashMap<String, Object> map = new HashMap<>();
		
		map.put("id", id);
		map.put("pass", pass);
		
		int result = ss.update("member.updatePass", map);
		ss.close();					
		return (result > 0) ? true : false;
	}

	public boolean deleteMem(String id) {
		SqlSession ss = FactoryService.getFactory().openSession(true);
		
		int result = ss.delete("member.deleteMem", id);
		ss.close();
		
		return (result > 0) ? true : false;
	}

}
