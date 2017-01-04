package ignis.bean;

import java.sql.Date;

public class ig_reserv {
	String r_num;
	String r_guide;
	Date r_day;
	String r_time;
	String r_content;
	String m_id;
	
	public String getR_num() {
		return r_num;
	}
	public String getM_id() {
		return m_id;
	}
	public void setM_id(String m_id) {
		this.m_id = m_id;
	}
	public void setR_num(String r_num) {
		this.r_num = r_num;
	}
	public String getR_guide() {
		return r_guide;
	}
	public void setR_guide(String r_guide) {
		this.r_guide = r_guide;
	}
	public Date getR_day() {
		return r_day;
	}
	public void setR_day(Date r_day) {
		this.r_day = r_day;
	}
	public String getR_time() {
		return r_time;
	}
	public void setR_time(String r_time) {
		this.r_time = r_time;
	}
	public String getR_content() {
		return r_content;
	}
	public void setR_content(String r_content) {
		this.r_content = r_content;
	}
	
}
