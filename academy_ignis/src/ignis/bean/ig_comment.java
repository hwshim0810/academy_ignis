package ignis.bean;

import java.sql.Date;

public class ig_comment {
	String co_num;
	String co_content;
	String m_name;
	int rb_num;
	int co_seq;
	Date co_regdate;
	public String getCo_num() {
		return co_num;
	}
	public void setCo_num(String co_num) {
		this.co_num = co_num;
	}
	public String getCo_content() {
		return co_content;
	}
	public void setCo_content(String co_content) {
		this.co_content = co_content;
	}
	public String getM_name() {
		return m_name;
	}
	public void setM_name(String m_name) {
		this.m_name = m_name;
	}
	public int getRb_num() {
		return rb_num;
	}
	public void setRb_num(int rb_num) {
		this.rb_num = rb_num;
	}
	public int getCo_seq() {
		return co_seq;
	}
	public void setCo_seq(int co_seq) {
		this.co_seq = co_seq;
	}
	public Date getCo_regdate() {
		return co_regdate;
	}
	public void setCo_regdate(Date co_regdate) {
		this.co_regdate = co_regdate;
	}

}
