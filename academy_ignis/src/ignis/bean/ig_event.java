package ignis.bean;

import java.sql.Date;

public class ig_event {
	String eb_num;
	String eb_title;
	String eb_content;
	int eb_readcount;
	Date eb_regdate;
	public String getEb_num() {
		return eb_num;
	}
	public void setEb_num(String eb_num) {
		this.eb_num = eb_num;
	}
	public String getEb_title() {
		return eb_title;
	}
	public void setEb_title(String eb_title) {
		this.eb_title = eb_title;
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
	public Date getEb_regdate() {
		return eb_regdate;
	}
	public void setEb_regdate(Date eb_regdate) {
		this.eb_regdate = eb_regdate;
	}
	
}
