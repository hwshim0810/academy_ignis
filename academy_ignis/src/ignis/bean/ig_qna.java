package ignis.bean;

import java.sql.Date;

public class ig_qna {
private String qb_mal;
private String qb_num;
private String m_id;
private String qb_title;
private String qb_content;
private int qb_groupnum;
private int qb_readcount;
private java.sql.Date date;
public ig_qna(){}
public ig_qna(String qb_mal, String qb_num, String m_id, String qb_title, String qb_content, int qb_groupnum,
		int qb_readcount, Date date) {
	super();
	this.qb_mal = qb_mal;
	this.qb_num = qb_num;
	this.m_id = m_id;
	this.qb_title = qb_title;
	this.qb_content = qb_content;
	this.qb_groupnum = qb_groupnum;
	this.qb_readcount = qb_readcount;
	this.date = date;
}

public String getQb_mal() {
	return qb_mal;
}

public void setQb_mal(String qb_mal) {
	this.qb_mal = qb_mal;
}

public String getQb_num() {
	return qb_num;
}

public void setQb_num(String qb_num) {
	this.qb_num = qb_num;
}

public String getM_id() {
	return m_id;
}

public void setM_id(String m_id) {
	this.m_id = m_id;
}

public String getQb_title() {
	return qb_title;
}

public void setQb_title(String qb_title) {
	this.qb_title = qb_title;
}

public String getQb_content() {
	return qb_content;
}

public void setQb_content(String qb_content) {
	this.qb_content = qb_content;
}

public int getQb_groupnum() {
	return qb_groupnum;
}

public void setQb_groupnum(int qb_groupnum) {
	this.qb_groupnum = qb_groupnum;
}

public int getQb_readcount() {
	return qb_readcount;
}

public void setQb_readcount(int qb_readcount) {
	this.qb_readcount = qb_readcount;
}

public java.sql.Date getDate() {
	return date;
}

public void setDate(java.sql.Date date) {
	this.date = date;
}



}
