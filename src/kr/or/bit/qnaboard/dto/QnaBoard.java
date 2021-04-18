package kr.or.bit.qnaboard.dto;

import java.util.Date;

public class QnaBoard {
	private int qnaNumber;
	private String qnaTitle;
	private String qnaFilename;
	private int qnaFilesize;
	private String qnaRealFilename;
	private Date qnaWritedate;
	private int qnaRefer;
	private int qnaDepth;
	private int qnaStep;
	private int qnaViewcount;
	private String email;

	public int getQnaNumber() {
		return qnaNumber;
	}

	public void setQnaNumber(int qnaNumber) {
		this.qnaNumber = qnaNumber;
	}

	public String getQnaTitle() {
		return qnaTitle;
	}

	public void setQnaTitle(String qnaTitle) {
		this.qnaTitle = qnaTitle;
	}

	public String getQnaFilename() {
		return qnaFilename;
	}

	public void setQnaFilename(String qnaFilename) {
		this.qnaFilename = qnaFilename;
	}

	public int getQnaFilesize() {
		return qnaFilesize;
	}

	public void setQnaFilesize(int qnaFilesize) {
		this.qnaFilesize = qnaFilesize;
	}

	public String getQnaRealFilename() {
		return qnaRealFilename;
	}

	public void setQnaRealFilename(String qnaRealFilename) {
		this.qnaRealFilename = qnaRealFilename;
	}

	public Date getQnaWritedate() {
		return qnaWritedate;
	}

	public void setQnaWritedate(Date qnaWritedate) {
		this.qnaWritedate = qnaWritedate;
	}

	public int getQnaRefer() {
		return qnaRefer;
	}

	public void setQnaRefer(int qnaRefer) {
		this.qnaRefer = qnaRefer;
	}

	public int getQnaDepth() {
		return qnaDepth;
	}

	public void setQnaDepth(int qnaDepth) {
		this.qnaDepth = qnaDepth;
	}

	public int getQnaStep() {
		return qnaStep;
	}

	public void setQnaStep(int qnaStep) {
		this.qnaStep = qnaStep;
	}

	public int getQnaViewcount() {
		return qnaViewcount;
	}

	public void setQnaViewcount(int qnaViewcount) {
		this.qnaViewcount = qnaViewcount;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	@Override
	public String toString() {
		return "QnaBoard [qnaNumber=" + qnaNumber + ", qnaTitle=" + qnaTitle + ", qnaFilename=" + qnaFilename
				+ ", qnaFilesize=" + qnaFilesize + ", qnaRealFilename=" + qnaRealFilename + ", qnaWritedate="
				+ qnaWritedate + ", qnaRefer=" + qnaRefer + ", qnaDepth=" + qnaDepth + ", qnaStep=" + qnaStep
				+ ", qnaViewcount=" + qnaViewcount + ", email=" + email + "]";
	}

}
