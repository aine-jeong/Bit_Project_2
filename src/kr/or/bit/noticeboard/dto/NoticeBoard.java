package kr.or.bit.noticeboard.dto;

public class NoticeBoard {
	private int nNumber;
	private String nTitle;
	private String nFilename;
	private int nFilesize;
	private String nRealFilename;
	private int nViewcount;
	private String email;

	public int getnNumber() {
		return nNumber;
	}

	public void setnNumber(int nNumber) {
		this.nNumber = nNumber;
	}

	public String getnTitle() {
		return nTitle;
	}

	public void setnTitle(String nTitle) {
		this.nTitle = nTitle;
	}

	public String getnFilename() {
		return nFilename;
	}

	public void setnFilename(String nFilename) {
		this.nFilename = nFilename;
	}

	public int getnFilesize() {
		return nFilesize;
	}

	public void setnFilesize(int nFilesize) {
		this.nFilesize = nFilesize;
	}

	public String getnRealFilename() {
		return nRealFilename;
	}

	public void setnRealFilename(String nRealFilename) {
		this.nRealFilename = nRealFilename;
	}

	public int getnViewcount() {
		return nViewcount;
	}

	public void setnViewcount(int nViewcount) {
		this.nViewcount = nViewcount;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	@Override
	public String toString() {
		return "NoticeBoard [nNumber=" + nNumber + ", nTitle=" + nTitle + ", nFilename=" + nFilename + ", nFilesize="
				+ nFilesize + ", nRealFilename=" + nRealFilename + ", nViewcount=" + nViewcount + ", email=" + email
				+ "]";
	}

}
