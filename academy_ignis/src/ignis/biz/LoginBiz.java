package ignis.biz;

import ignis.bean.User;
import ignis.dao.MemberDAO;

public class LoginBiz {

	public User getUserLogin(String id, String passwd) {
		MemberDAO memDao = new MemberDAO();
		User user = memDao.getUserLogin(id, passwd);
			
		return user;
	}


}
