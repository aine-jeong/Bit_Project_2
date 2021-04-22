package kr.or.bit.ainboard.dto;

import java.util.Date;

public class AinReply {
	private int crNumber;
	private String content;
	private Date writedate;
	private String email;
	private int cNumber;
	
	public int getCrNumber() {
		return crNumber;
	}
	public void setCrNumber(int crNumber) {
		this.crNumber = crNumber;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Date getWritedate() {
		return writedate;
	}
	public void setWritedate(Date writedate) {
		this.writedate = writedate;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public int getcNumber() {
		return cNumber;
	}
	public void setcNumber(int cNumber) {
		this.cNumber = cNumber;
	}
	@Override
	public String toString() {
		return "AinReply [crNumber=" + crNumber + ", content=" + content + ", writedate=" + writedate + ", email="
				+ email + ", cNumber=" + cNumber + "]";
	}
	
}
