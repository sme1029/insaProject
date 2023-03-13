package com.greedy.insaProject.service;

import java.util.List;

import com.greedy.insaProject.dto.InsaComDTO;
import com.greedy.insaProject.dto.InsaDTO;

public interface InsaService {
	
	// 조회
	List<InsaComDTO> selectCodeList() throws Exception; // 코드 조회
	
	// 사번조회 등록
	List<InsaDTO> selectSabun() throws Exception;
	
	// 사번조회 수정
	InsaDTO selectUser(String sabun) throws Exception;
	
	// 등록, 사용안함, 업설트로 대체
	//int insertInfo(InsaDTO insaDTO) throws Exception;

	// 등록 + 저장 후 수정
	int updateInfo(InsaDTO insaDTO) throws Exception;

	// 조회 검색
	List<InsaDTO> selectParamSearch(InsaDTO insaDTO) throws Exception;
	// total
	int totalPage(InsaDTO insaDTO);
	
	// 삭제
	int deleteList(String sabun);
	
///////////////////////////////////////////////////////////////////////////////
	
	// 공통코드 추가 과제 셋팅
	List<InsaComDTO> commonList() throws Exception;
	
	// 공통코드 저장

	//List<InsaComDTO> commonUpsert() throws Exception;

	int commonUpsert(InsaComDTO insaComDTO) throws Exception;
	
///////////////////////////////////////////////////////////////////////////////

}
