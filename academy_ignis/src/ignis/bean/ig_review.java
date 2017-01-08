package ignis.bean;

import java.sql.Date;

public class ig_review {
	private int rb_num;
	private String rb_title;
	private String m_name;
	private String rb_content;
	private String rb_file;
	private int rb_replycount;
	private int rb_readcount;
	private java.sql.Date rb_regdate;

	public ig_review(){}
	public ig_review(int rb_num, String rb_title, String m_name, String rb_content, String rb_file, int rb_replycount, int rb_readcount, Date rb_regdate){
		super();
		
		this.rb_num = rb_num;
		this.rb_title = rb_title;
		this.m_name = m_name;
		this.rb_content = rb_content;
		this.rb_file = rb_file;
		this.rb_replycount = rb_replycount;
		this.rb_readcount = rb_readcount;
		this.rb_regdate = rb_regdate;
	}
	
	public int getRb_num() {
		return rb_num;
	}
	public void setRb_num(int rb_num) {
		this.rb_num = rb_num;
	}
	public String getRb_title() {
		return rb_title;
	}
	public void setRb_title(String rb_title) {
		this.rb_title = rb_title;
	}
	public String getM_name() {
		return m_name;
	}
	public void setM_name(String m_name) {
		this.m_name = m_name;
	}
	public String getRb_content() {
		return rb_content;
	}
	public void setRb_content(String rb_content) {
		this.rb_content = rb_content;
	}
	public String getRb_file() {
		return rb_file;
	}
	public void setRb_file(String rb_file) {
		this.rb_file = rb_file;
	}
	public int getRb_replycount() {
		return rb_replycount;
	}
	public void setRb_replycount(int rb_replycount) {
		this.rb_replycount = rb_replycount;
	}
	public int getRb_readcount() {
		return rb_readcount;
	}
	public void setRb_readcount(int rb_readcount) {
		this.rb_readcount = rb_readcount;
	}
	public Date getRb_regdate() {
		return rb_regdate;
	}
	public void setRb_regdate(Date rb_regdate) {
		this.rb_regdate = rb_regdate;
	}
}
