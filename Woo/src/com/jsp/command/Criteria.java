package com.jsp.command;

public class Criteria {

	private int page = 1;
	private int perPageNum = 100;
	private String searchType = "";
	private String keyword = "";
	
//	private int starowNum = 0;

	public int getPage() {
		return page;
	}

	public void setPage(int page) {
		this.page = page;
	}

	public int getPerPageNum() {
		return perPageNum;
	}

	public void setPerPageNum(int perPageNum) {
		this.perPageNum = perPageNum;
	}

	public String getSearchType() {
		return searchType;
	}

	public void setSearchType(String searchType) {
		this.searchType = searchType;
	}

	public String getKeyword() {
		return keyword;
	}

	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}

//	public int getStarowNum() {
//		return starowNum;
//	}
//
//	public void setStarowNum(int starowNum) {
//		this.starowNum = starowNum;
//	}
	
	
}
