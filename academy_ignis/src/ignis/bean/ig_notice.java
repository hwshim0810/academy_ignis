package ignis.bean;

import java.sql.Date;

public class ig_notice {
private int nb_num;
private String nb_title;
private String nb_content;
private int nb_readcount;
private java.sql.Date date;

public ig_notice(int nb_num, String nb_title, String nb_content, int nb_readcount, Date date) {
	super();
	this.nb_num = nb_num;
	this.nb_title = nb_title;
	this.nb_content = nb_content;
	this.nb_readcount = nb_readcount;
	this.date = date;
}

public int getNb_num() {
	return nb_num;
}

public void setNb_num(int nb_num) {
	this.nb_num = nb_num;
}

public String getNb_title() {
	return nb_title;
}

public void setNb_title(String nb_title) {
	this.nb_title = nb_title;
}

public String getNb_content() {
	return nb_content;
}

public void setNb_content(String nb_content) {
	this.nb_content = nb_content;
}

public int getNb_readcount() {
	return nb_readcount;
}

public void setNb_readcount(int nb_readcount) {
	this.nb_readcount = nb_readcount;
}

public java.sql.Date getDate() {
	return date;
}

public void setDate(java.sql.Date date) {
	this.date = date;
}


}
