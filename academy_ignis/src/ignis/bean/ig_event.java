package ignis.bean;
  
import java.sql.Date;

public class ig_event {

	private int eb_num, eb_readcount;
	private String  eb_title, eb_content;
	private java.sql.Date eb_regdate;
	
	public ig_event(){}
	public ig_event(int eb_num, String eb_title, String eb_content, Date eb_regdate, int eb_readcount){
		super();
		
		this.eb_num = eb_num;
		this.eb_title = eb_title;
		this.eb_content = eb_content;
		this.eb_regdate = eb_regdate;
		this.eb_readcount = eb_readcount;
	}
	 
	public int getEb_num() {
		return eb_num;
	}
	public void setEb_num(int eb_num) {
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
	public java.sql.Date getEb_regdate() {
		return eb_regdate;
	}
	public void setEb_regdate(java.sql.Date eb_regdate) {
		this.eb_regdate = eb_regdate;
	}
	
	
}
