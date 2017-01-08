package ignis.bean;

import java.sql.Date;

public class User {
	String m_id, m_pass, m_name, m_addr, m_email;
	String m_birth; 
	int m_phone, m_level;
	Date m_enterdate;

	public User() {}
	
	public User(String m_id, String m_pass, String m_name, String m_birth, String m_addr, 
			int m_phone, String m_email, int m_level, Date m_enterdate) {
		super();
		this.m_id = m_id;
		this.m_pass = m_pass;
		this.m_name = m_name;
		this.m_birth = m_birth;
		this.m_addr = m_addr;
		this.m_phone = m_phone;
		this.m_email = m_email;
		this.m_level = m_level;
		this.m_enterdate = m_enterdate;
	}
	
	public String getM_id() {
		return m_id;
	}
	public void setM_id(String m_id) {
		this.m_id = m_id;
	}
	public String getM_pass() {
		return m_pass;
	}
	public void setM_pass(String m_pass) {
		this.m_pass = m_pass;
	}
	public String getM_name() {
		return m_name;
	}
	public void setM_name(String m_name) {
		this.m_name = m_name;
	}
	public String getM_addr() {
		return m_addr;
	}
	public void setM_addr(String m_addr) {
		this.m_addr = m_addr;
	}
	public String getM_email() {
		return m_email;
	}
	public void setM_email(String m_email) {
		this.m_email = m_email;
	}
	public String getM_birth() {
		return m_birth;
	}
	public void setM_birth(String m_birth) {
		this.m_birth = m_birth;
	}
	public int getM_phone() {
		return m_phone;
	}
	public void setM_phone(int m_phone) {
		this.m_phone = m_phone;
	}
	public int getM_level() {
		return m_level;
	}
	public void setM_level(int m_level) {
		this.m_level = m_level;
	}
	public Date getM_enterdate() {
		return m_enterdate;
	}
	public void setM_enterdate(Date m_enterdate) {
		this.m_enterdate = m_enterdate;
	}
	
	
}
