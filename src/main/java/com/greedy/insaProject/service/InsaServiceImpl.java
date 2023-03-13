package com.greedy.insaProject.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.greedy.insaProject.dto.InsaComDTO;
import com.greedy.insaProject.dto.InsaDTO;
import com.greedy.insaProject.mapper.InsaMapper;

@Service("insaService")
@Transactional
public class InsaServiceImpl implements InsaService {
	
	@Autowired
	InsaMapper insaMapper;
	
	// 조회
	@Override
	public List<InsaComDTO> selectCodeList() throws Exception {
		
		System.out.println("insa 서비스 진입 !"); // 로직확인용
		
		return insaMapper.selectCodeList();
	}
	
	// 사번조회 등록
	@Override
	public List<InsaDTO> selectSabun() throws Exception {
		
		System.out.println("사번 서비스 진입 !"); // 로직확인용

		// 인사디티오 데이터를 리스트 형식으로 가져오기.
		List<InsaDTO> insaList = insaMapper.selectSabun();
		
		if(insaList == null) {
			throw new Exception("인사 리스트 조회 실패");
		}
		System.out.println("사번 서비스 성공 !"); // 로직확인용
		return insaList;
	}
	
	// 상세 조회
	@Override
	public InsaDTO selectUser(String sabun) throws Exception {
		
		System.out.println("사번" + sabun);
		
		// 인사디티오의 사번을 기준으로 상세조회 불러오기
		InsaDTO insaDTO = insaMapper.selectUser(sabun);
		
		if(insaDTO != null) {
			// 골뱅이를 기준 점으로 나누기.
			String[] em = insaDTO.getEmail().split("@");
			//insaDTO.setEmail1(em[0]);
			insaDTO.setEmail(em[1]);
		}
		
		return insaDTO;
	}
	
	// 등록, 사용안함, 업설트로 대체
//	@Override
//	public int insertInfo(InsaDTO insaDTO) throws Exception{
//		
//		int result = insaMapper.insertInfo(insaDTO);
//		
//		if(result <= 0) {
//			throw new Exception("등록 실패!");
//		}
//		
//		System.out.println("insert 서비스 진입 성공!"); // 로직확인용
//		return result;
//	}
	
	// 등록 + 저장 후 수정
	@Override
	public int updateInfo(InsaDTO insaDTO) throws Exception{
		
		// 각각 이메일 값을 합쳐서 저장하기.
		String em = insaDTO.getEmail()+insaDTO.getEmail1();
		insaDTO.setEmail(em);
		int result = insaMapper.updateInfo(insaDTO);
		
		if(result <= 0) {
			throw new Exception("등록 실패!");
		}
		
		System.out.println("insert 서비스 진입 성공!"); // 로직확인용
		return result;
	}
	
	// 조회 검색	
	@Override
	public List<InsaDTO> selectParamSearch(InsaDTO insaDTO) throws Exception {
		
		// 인사디티오 데이터를 리스트 형식으로 가져오기.
		List<InsaDTO> insaList = insaMapper.selectParamSearch(insaDTO);
		
		System.out.println("select 서비스 진입 성공!"); // 로직확인용
		
		if(insaList == null) {
			throw new Exception("조회 실패!");
		}
		return insaList;
	}
	// total 
	@Override
	public int totalPage(InsaDTO insaDTO){
		
		// 페이지 토탈 값
		return insaMapper.totalPage(insaDTO);
	}
	
	// 삭제
	@Override
	public int deleteList(String sabun){
		
		// 사번 기준으로 삭제
		return insaMapper.deleteList(sabun);
	}
	
///////////////////////////////////////////////////////////////////////////////
	
	// 공통코드 추가 과제 셋팅
	@Override
	public List<InsaComDTO> commonList() throws Exception{
		
		System.out.println("공통코드 서비스 진입!");
		
		return insaMapper.commonSet();
	}
	
	// 공통코드 저장
	@Override
	
//	public List<InsaComDTO> commonUpsert() throws Exception{
//		
//		List<InsaComDTO> result = insaMapper.commonSave();
//		
//		System.out.println("저장 서비스 진입 성공!");
//		
//		return result;
//	}
	
	public int commonUpsert(InsaComDTO insaComDTO) throws Exception{
		
		int result = insaMapper.commonSave(insaComDTO);
		
		System.out.println("저장 서비스 진입 성공!");
		
		return result;
	}
	
///////////////////////////////////////////////////////////////////////////////
	
}
