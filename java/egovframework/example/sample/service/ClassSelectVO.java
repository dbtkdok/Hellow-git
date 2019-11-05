package egovframework.example.sample.service;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

public class ClassSelectVO extends SampleDefaultVO {

	private static final long serialVersionUID = 1L;

	private int cno;
	
	private String clwriter;

	private String clname;
	
	private Date clftime;
	
	private Date cletime;
	
	private Date cldate;
	
	private String classstatus;
	
	public String getClassstatus() {
		return classstatus;
	}
	public void setClassstatus(String classstatus) {
		this.classstatus = classstatus;
	}
	public int getCno() {
		return cno;
	}
	public void setCno(int cno) {
		this.cno = cno;
	}
	
	public String getClname() {
		return clname;
	}
	public void setClname(String clname) {
		this.clname = clname;
	}
	
	public Date getClftime() {
		return clftime;
	}
	public void setClftime(Date clftime) {
		this.clftime = clftime;
	}
	public Date getCletime() {
		return cletime;
	}
	public void setCletime(Date cletime) {
		this.cletime = cletime;
	}
	public Date getCldate() {
		return cldate;
	}
	public void setCldate(Date cldate) {
		this.cldate = cldate;
	}
	public String getClwriter() {
		return clwriter;
	}
	public void setClwriter(String clwriter) {
		this.clwriter = clwriter;
	}
	
}
