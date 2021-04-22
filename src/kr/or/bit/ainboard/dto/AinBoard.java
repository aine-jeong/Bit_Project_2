package kr.or.bit.ainboard.dto;

import java.util.Date;

public class AinBoard {
	private int cNumber;
	private String title;
	private String content;
	private Date writedate;
	private String filename;
	private int refer;
	private int depth;
	private int step;
	private int viewcount;
	private String email;
	
	public int getcNumber() {
		return cNumber;
	}
	public void setcNumber(int cNumber) {
		this.cNumber = cNumber;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
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
	public String getFilename() {
		return filename;
	}
	public void setFilename(String filename) {
		this.filename = filename;
	}
	public int getRefer() {
		return refer;
	}
	public void setRefer(int refer) {
		this.refer = refer;
	}
	public int getDepth() {
		return depth;
	}
	public void setDepth(int depth) {
		this.depth = depth;
	}
	public int getStep() {
		return step;
	}
	public void setStep(int step) {
		this.step = step;
	}
	public int getViewcount() {
		return viewcount;
	}
	public void setViewcount(int viewcount) {
		this.viewcount = viewcount;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	
	@Override
	public String toString() {
		return "AinBoard [cNumber=" + cNumber + ", title=" + title + ", content=" + content + ", writedate=" + writedate
				+ ", filename=" + filename + ", refer=" + refer + ", depth=" + depth + ", step=" + step + ", viewcount="
				+ viewcount + ", email=" + email + "]";
	}
	
}
