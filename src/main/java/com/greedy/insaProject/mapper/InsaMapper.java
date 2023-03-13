package com.greedy.insaProject.mapper;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.greedy.insaProject.dto.InsaComDTO;
import com.greedy.insaProject.dto.InsaDTO;

@Mapper
public interface InsaMapper {
	
	// 조회
	List<InsaComDTO> selectCodeList() ;
	
	// 사번 조회 등록
	List<InsaDTO> selectSabun();
	
	// 사번 조회 수정
	InsaDTO selectUser(String sabun);

	// 등록, 사용안함, 업설트로 대체
	//int insertInfo(InsaDTO insaDTO);

	// 등록 + 저장 후 수정
	int updateInfo(InsaDTO insaDTO);

	// 조회
	List<InsaDTO> selectParamSearch(InsaDTO insaDTO);
	// total
	int totalPage(InsaDTO insaDTO);
	
	// 삭제
	int deleteList(String sabun);
	
///////////////////////////////////////////////////////////////////////////////
	
	// 공통코드 추가 과제 셋팅
	List<InsaComDTO> commonSet();

	// 공통코드 저장
	
	//List<InsaComDTO> commonSave();
	
	int commonSave(InsaComDTO insaComDTO);
	
///////////////////////////////////////////////////////////////////////////////
	
}