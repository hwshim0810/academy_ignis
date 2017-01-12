package ignis.bean;
  
import java.sql.Date;

public class ig_event {

	private int eb_num, eb_winner, eb_readcount;
	private String  eb_title, eb_content, eb_period, eb_announceday;
	private java.sql.Date eb_regdate;
	
	public ig_event() {}
	
	public ig_event(int eb_num, int eb_winner, int eb_readcount, String eb_title, String eb_content, String eb_period,
			String eb_announceday, Date eb_regdate) {
		super();
		this.eb_num = eb_num;
		this.eb_winner = eb_winner;
		this.eb_readcount = eb_readcount;
		this.eb_title = eb_title;
		this.eb_content = eb_content;
		this.eb_period = eb_period;
		this.eb_announceday = eb_announceday;
		this.eb_regdate = eb_regdate;
	}

	public int getEb_num() {
		return eb_num;
	}

	public void setEb_num(int eb_num) {
		this.eb_num = eb_num;
	}

	public int getEb_winner() {
		return eb_winner;
	}

	public void setEb_winner(int eb_winner) {
		this.eb_winner = eb_winner;
	}

	public int getEb_readcount() {
		return eb_readcount;
	}

	public void setEb_readcount(int eb_readcount) {
		this.eb_readcount = eb_readcount;
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

	public String getEb_period() {
		return eb_period;
	}

	public void setEb_period(String eb_period) {
		this.eb_period = eb_period;
	}

	public String getEb_announceday() {
		return eb_announceday;
	}

	public void setEb_announceday(String eb_announceday) {
		this.eb_announceday = eb_announceday;
	}

	public java.sql.Date getEb_regdate() {
		return eb_regdate;
	}

	public void setEb_regdate(java.sql.Date eb_regdate) {
		this.eb_regdate = eb_regdate;
	}

	
	
}
