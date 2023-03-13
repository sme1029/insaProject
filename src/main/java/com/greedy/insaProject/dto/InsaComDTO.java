package com.greedy.insaProject.dto;

public class InsaComDTO {
	
	private String gubun;
	private String code;
	private String name;
	private String note;
	
	public InsaComDTO() {}
	
	// 실무에서 많이 사용하는 리스트
	//public List<InsaComDTO> list;
	
	public InsaComDTO(String gubun, String code, String name, String note) {
		super();
		this.gubun = gubun;
		this.code = code;
		this.name = name;
		this.note = note;
	}

	public String getGubun() {
		return gubun;
	}

	public void setGubun(String gubun) {
		this.gubun = gubun;
	}

	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getNote() {
		return note;
	}

	public void setNote(String note) {
		this.note = note;
	}

	@Override
	public String toString() {
		return "InsaComDTO [gubun=" + gubun + ", code=" + code + ", name=" + name + ", note=" + note + "]";
	}
	
	

}
