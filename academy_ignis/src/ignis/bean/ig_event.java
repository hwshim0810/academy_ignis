package ignis.bean;

import java.sql.Date;

public class ig_event {
	private String eb_num, eb_tutke, eb_content;
	private int eb_readcount;
	private java.sql.Date eb_regdate;
	public String getEb_num() {
		return eb_num;
	}
	public void setEb_num(String eb_num) {
		this.eb_num = eb_num;
	}
	public String getEb_tutke() {
		return eb_tutke;
	}
	public void setEb_tutke(String eb_tutke) {
		this.eb_tutke = eb_tutke;
	}
	public String getEb_content() {
		return eb_content;
	}
	public void setEb_content(String eb_content) {
		this.eb_content = eb_content;
	}
	public int getEb_readcount() {
		return eb_readcount;
	}
	public void setEb_readcount(int eb_readcount) {
		this.eb_readcount = eb_readcount;
	}
	public java.sql.Date getEb_regdate() {
		return eb_regdate;
	}
	public void setEb_regdate(java.sql.Date eb_regdate) {
		this.eb_regdate = eb_regdate;
	}
	
	
}
