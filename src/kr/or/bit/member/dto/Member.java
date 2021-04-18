package kr.or.bit.member.dto;

public class Member {
	private String email;
	private String password;
	private String division;
	private String nickname;

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getDivision() {
		return division;
	}

	public void setDivision(String division) {
		this.division = division;
	}

	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	@Override
	public String toString() {
		return "Member [email=" + email + ", password=" + password + ", division=" + division + ", nickname=" + nickname
				+ "]";
	}

}
