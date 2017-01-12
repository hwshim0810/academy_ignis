package ignis.bean;

import java.sql.Date;

public class ig_evententry {
	private int eb_num;
	private String m_name;
	private java.sql.Date eb_entrydate;
	
	public ig_evententry(){}
	public ig_evententry(int eb_num, String m_name, Date eb_entrydate) {
		super();
		this.eb_num = eb_num;
		this.m_name = m_name;
		this.eb_entrydate = eb_entrydate;
	}
	

	public int getEb_num() {
		return eb_num;
	}

	public void setEb_num(int eb_num) {
		this.eb_num = eb_num;
	}

	public String getM_name() {
		return m_name;
	}

	public void setM_name(String m_name) {
		this.m_name = m_name;
	}

	public java.sql.Date getEb_entrydate() {
		return eb_entrydate;
	}

	public void setEb_entrydate(java.sql.Date eb_entrydate) {
		this.eb_entrydate = eb_entrydate;
	}
	
}
