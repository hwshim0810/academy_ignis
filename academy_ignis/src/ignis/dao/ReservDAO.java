package ignis.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import ignis.bean.ig_reserv;
import ignis.mybatis.service.FactoryService;

public class ReservDAO {
	private static ReservDAO reservDAO = new ReservDAO();

	public static ReservDAO getInstance(){
		return reservDAO;
	}
	
	

	public boolean deleteAdminMem(String reservDel) {
		SqlSession ss = FactoryService.getFactory().openSession(true);
		
		int result = ss.delete("reserv.deleteReserv", reservDel);
		ss.close();
		
		return (result > 0) ? true : false;
	}
	public boolean deleteMem(String m_id) {
		SqlSession ss = FactoryService.getFactory().openSession(true);
		
		int result = ss.delete("reserv.deleteMem", m_id);
		ss.close();
		
		return (result > 0) ? true : false;
	}
	
	

	public boolean delete(int getR_num) {
		SqlSession ss = FactoryService.getFactory().openSession(true);
		int cnt = ss.delete("reserv.deleteReserv", getR_num);
		System.out.println("delete확인용 cnt" + cnt);
		ss.close();					return (cnt > 0) ? true : false;
	}
	
	public boolean update(String m_id) {
		SqlSession ss = FactoryService.getFactory().openSession(true);
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("m_id", m_id);			
		int cnt = ss.insert("reserv.updateReserv", map);
		System.out.println("update확인용 cnt" + cnt);
		ss.close();					return (cnt > 0) ? true : false;
	}

	public boolean insert(String r_guide, String r_day, String r_time, String r_findDoc, String m_id) {
		SqlSession ss = FactoryService.getFactory().openSession(true);
		HashMap<String, Object> map = new HashMap<>();
		System.out.println(r_guide);
		System.out.println(r_day);
		System.out.println(r_time);
		System.out.println(m_id);
		map.put("r_guide", r_guide);
		map.put("r_day", r_day);
		map.put("r_time", r_time);
		map.put("r_findDoc", r_findDoc);
		map.put("m_id", m_id);			
		int cnt = ss.insert("reserv.add", map);
		System.out.println("insert확인용 cnt" + cnt);
		ss.close();					return (cnt > 0) ? true : false;
	}
	
	public int getListcount() {
		
		SqlSession ss = FactoryService.getFactory().openSession(true);
		int listCount = ss.selectOne("reserv.listCount");
		return listCount;
	}
	
	public int getReservedListcount(String r_content, String m_id) {
		
		SqlSession ss = FactoryService.getFactory().openSession(true);
		HashMap<String, Object> map = new HashMap<>();
		map.put("r_content", r_content);
		map.put("m_id", m_id);
		
		int listCount = ss.selectOne("reserv.reservedlistCount",map);
		System.out.println(listCount + "listcount");
		return listCount;
	}
	
	
	public List<ig_reserv> getReservAll(String m_id, int begin, int end) {
		SqlSession ss = FactoryService.getFactory().openSession();
		HashMap<String, Object> map = new HashMap<>();
		System.out.println("ReservDAO내의 m_id확인용 : " + m_id);
		System.out.println("ReservDAO내의 begin확인용 : " + begin);
		System.out.println("ReservDAO내의 end확인용 : " + end);
		map.put("m_id", m_id);
		map.put("begin", begin);	
		map.put("end", end);
		
		List<ig_reserv> list = ss.selectList("reserv.selectAll", map);
		ss.close();
		System.out.println("ReservDAO내의 list의 사이즈입니다. " + list.size());
		return list;
	}
	
	
	
	public List<ig_reserv> getReservListAll(int begin, int end) {
		SqlSession ss = FactoryService.getFactory().openSession();
		HashMap<String, Object> map = new HashMap<>();
		System.out.println("ReservDAO내의 begin확인용 : " + begin);
		System.out.println("ReservDAO내의 end확인용 : " + end);
		map.put("begin", begin);	
		map.put("end", end);
		
		List<ig_reserv> list = ss.selectList("reserv.selectListAll", map);
		ss.close();
		System.out.println("ReservDAO내의 getReservListAll의 사이즈입니다. " + list.size());
		return list;
	}
	
	
	public List<ig_reserv> getSearchReserv(String m_id, String r_content, int begin, int end) {
		SqlSession ss = FactoryService.getFactory().openSession();
		HashMap<String, Object> map = new HashMap<>();
		System.out.println("ReservDAO내의 r_title, r_content확인용 : " + r_content);
		map.put("m_id", m_id);
		map.put("r_content", r_content);
		map.put("begin", begin);	
		map.put("end", end);
		
		List<ig_reserv> list = ss.selectList("reserv.searchReserv", map);
		ss.close();
		
		return list;
	}
	
	
	
	
	
	
	
	
	public List<ig_reserv> checkAll() {
		SqlSession ss = FactoryService.getFactory().openSession();
		List<ig_reserv> list = ss.selectList("reserv.checkAll");
		ss.close();					return list;
	}
	
	
	
	
	
	
	//회원Id 검색을 통해 모든 예약 정보를 출력
	public List<ig_reserv> check(String m_id) {
		SqlSession ss = FactoryService.getFactory().openSession();
		List<ig_reserv> list = null;
		list = ss.selectList("reserv.check",m_id);
		ss.close();					return list;
	}
	
	//회원Id 검색을 통해 예약 건수를 출력
	public int getResCount(String m_id) {
		SqlSession ss = FactoryService.getFactory().openSession();
		
		int count = ss.selectOne("reserv.selectResCount", m_id);
		ss.close();
		
		return count;
	}


	
	// 관리자페이지의 멤버 아이디 조회
	public boolean searchMemberId(String m_id){
		SqlSession ss = FactoryService.getFactory().openSession();
		int num = ss.selectOne("reserv.searchMemberId", m_id);
		ss.close();
		
		return (num>0) ? true: false;
	}
	
	
	
	public int getAdminListCount(String r_type, String r_content) {
		SqlSession ss = FactoryService.getFactory().openSession();
		
		int num = 0;
		
		switch (r_type) {
		case "r_num":
			num = ss.selectOne("reserv.selectAdminCountNum", r_content);
			break;
		case "r_guide":
			num = ss.selectOne("reserv.selectAdminCountGuide", r_content);
			break;
		case "r_day":
			num = ss.selectOne("reserv.selectAdminCountDay", r_content);
			break;
		case "r_time":
			num = ss.selectOne("reserv.selectAdminCountTime", r_content);
			break;
		case "r_regdate":
			num = ss.selectOne("reserv.selectAdminCountRegdate", r_content);
			break;
		case "m_id":
			num = ss.selectOne("reserv.selectAdminCountId", r_content);
			break;
		case "all":
			num = ss.selectOne("reserv.selectAdminCountAll");
			break;
		
		default : System.out.println("잘못 찍혔습니다. "); break;
		}
		ss.close();
		return num;
		}
	
	
	public List<ig_reserv> getAdminSearchReserv(String r_type, String r_content, int begin, int end) {
		SqlSession ss = FactoryService.getFactory().openSession();
		HashMap<String, Object> map = new HashMap<>();
		System.out.println("ReservDAO내의 r_title, r_content확인용 : " + r_content);
		map.put("r_content", r_content);
		map.put("begin", begin);	
		map.put("end", end);
		List<ig_reserv> list = null;
		
		switch (r_type) {
		case "r_num" : 
			list = ss.selectList("reserv.selectAdminListNum", map);
			break;
		case "r_guide" : 
			list = ss.selectList("reserv.selectAdminListGuide", map);
			break;
		case "r_day" : 
			list = ss.selectList("reserv.selectAdminListDay", map);
			break;
		case "r_time" : 
			list = ss.selectList("reserv.selectAdminListTime", map);
			break;
		case "r_regdate" : 
			list = ss.selectList("reserv.selectAdminListRegdate", map);
			break;
		case "m_id" : 
			list = ss.selectList("reserv.selectAdminListId", map);
			break;
		case "all" : 
			list = ss.selectList("reserv.selectAdminListAll", map);
			break;
			
		default : System.out.println("잘못 찍혔습니다. "); break;
		}
		
		ss.close();
		return list;
	}
	
	
	//예약번호 검색을 통한 예약 상세 정보 보기
	public List<ig_reserv> getReservInfo(String reserv_num) {
		SqlSession ss = FactoryService.getFactory().openSession();
		List<ig_reserv> list = null;
		list = ss.selectList("reserv.reservInfo",reserv_num);
		ss.close();					return list;
	}
	
}

