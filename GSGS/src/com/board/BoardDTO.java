package com.board;

public class BoardDTO {
	private String category;
	private int board_num;
	private String board_title;
	private String board_writer;
	private String board_date;
	private String board_content;
	private String board_imgpath;
	private int board_views;
	public BoardDTO() {
	}
	public BoardDTO(String category, int board_num, String board_title, String board_writer, String board_date,
			String board_content, String board_imgpath, int board_views) {
		this.category = category;
		this.board_num = board_num;
		this.board_title = board_title;
		this.board_writer = board_writer;
		this.board_date = board_date;
		this.board_content = board_content;
		this.board_imgpath = board_imgpath;
		this.board_views = board_views;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public int getBoard_num() {
		return board_num;
	}
	public void setBoard_num(int board_num) {
		this.board_num = board_num;
	}
	public String getBoard_title() {
		return board_title;
	}
	public void setBoard_title(String board_title) {
		this.board_title = board_title;
	}
	public String getBoard_writer() {
		return board_writer;
	}
	public void setBoard_writer(String board_writer) {
		this.board_writer = board_writer;
	}
	public String getBoard_date() {
		return board_date;
	}
	public void setBoard_date(String board_date) {
		this.board_date = board_date;
	}
	public String getBoard_content() {
		return board_content;
	}
	public void setBoard_content(String board_content) {
		this.board_content = board_content;
	}
	public String getBoard_imgpath() {
		return board_imgpath;
	}
	public void setBoard_imgpath(String board_imgpath) {
		this.board_imgpath = board_imgpath;
	}
	public int getBoard_views() {
		return board_views;
	}
	public void setBoard_views(int board_views) {
		this.board_views = board_views;
	}
	
}
