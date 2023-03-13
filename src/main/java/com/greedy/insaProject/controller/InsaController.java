package com.greedy.insaProject.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.greedy.insaProject.dto.InsaComDTO;
import com.greedy.insaProject.dto.InsaDTO;
import com.greedy.insaProject.service.InsaService;

@Controller
@RequestMapping("/insa")
public class InsaController {
	
	@Autowired
	InsaService insaService;
	
	
	public InsaController(InsaService insaService) {
		this.insaService = insaService;

		System.out.println("InsaController 생성!");
	
	}
	
	// 메인
	@GetMapping("/main")
	public String main() {

		System.out.println("Insa main 진입 성공!"); // 로직확인용
		
		return "Main";
	}

	// 등록
	@GetMapping("/insert")
	public String insa() {
		System.out.println("Insa insert 진입 성공!"); // 로직확인용
		return "Insert";
	}
	
	// 조회
	@GetMapping("/select")
	public String select() {
		System.out.println("Insa select 진입 성공!"); // 로직확인용
		return "Select";
	}
	
	// 등록 셋팅
	@PostMapping("/codeSet") // 이 주소로 접속하면 이 메소드를 호출한다.(매핑한다.)
	@ResponseBody
	public List<InsaComDTO> selectInsaList() throws Exception {
		
		System.out.println("Insa code controller 진입!"); // 로직확인용

		List<InsaComDTO> list = insaService.selectCodeList(); // 코드 조회

		//System.out.println(list); // 로직확인용

		return list;
	}
	
	// 사번호출 저장 
	@ResponseBody
	@RequestMapping(value="/sabun", method=RequestMethod.POST)
	public Object selectSabun() throws Exception {
		
		System.out.println("Insa 사번호출 진입 성공!"); // 로직확인용		
		
		List<InsaDTO> sabun = insaService.selectSabun();

		return sabun;
	}
	
	// 사번호출 수정
	@ResponseBody
	@RequestMapping(value="/user", method=RequestMethod.POST)
	public InsaDTO selectUser(String searchSabun) throws Exception {
		
		System.out.println("조회 검색 데이터 확인 컨트롤러"); // 로직확인용
		//System.out.println(insaService.selectUser(searchSabun)); // 로직확인용
		
		return insaService.selectUser(searchSabun);
	}

	// 등록, 사용 안함, 업설트로 대체
//	@PostMapping("/insert")
//	@ResponseBody
//	public String insertInfo(@ModelAttribute InsaDTO insaDTO, Locale locale) throws Exception{
//		
//		insaService.insertInfo(insaDTO);
//		
//		System.out.println("insert 성공!"); // 로직확인용
//		
//		return "result";
//	}
	
	// 등록 및 수정
	@PostMapping("/upsert")
	@ResponseBody
	public String updateInfo(
			/* HttpServletRequest request, */ @ModelAttribute InsaDTO insaDTO, Locale locale) throws Exception{
		System.out.println("insert 문 : " + insaDTO);
		insaService.updateInfo(insaDTO);
		
		System.out.println("insert 성공!"); // 로직확인용
		
//		Part filePart = request.getPart("uploadFile");
//
//	      String fileName = filePart.getSubmittedFileName();
//
//	      if (!fileName.equals("")) {
//	         // 실제 서블릿이 동작하는 서버 경로 (Not 개발 서버)
//	         String realPath = request.getServletContext().getRealPath("/img");
//
//	         // 요청된 파트의 전송된 파일 이름
//
//	         // 입력 스트림
//	         InputStream fis = filePart.getInputStream();
//
//	         // 실제 업로드 될 경로 + 파일명
//	         String filePath = realPath + File.separator + fileName;
//
//	         // 파일 출력 스트림 (저장)
//	         FileOutputStream fos = new FileOutputStream(filePath);
//
//	         // 1024byte 씩 버퍼에 담아 읽어오는 과정
//	         // write(buffer, offset, length); 를 통해 읽어온 만큼만 쓰는 방법
//	         byte[] buf = new byte[1024];
//	         int size = 0;
//	         while ((size = fis.read(buf)) != -1)
//	            fos.write(buf, 0, size);
//	         fos.close();
//	         fis.close();
//
//	      } else {
//	         String PROFILE_IMAGE = request.getParameter("PROFILE_IMAGE");
//	         if(PROFILE_IMAGE == null)
//	         {
//	            PROFILE_IMAGE = "";
//	         }
//	      }
	      
		return "result";
	}
	
	// 조회 검색
//	@PostMapping("/paramSearch") // ajax - 서버 url 
//	@ResponseBody
//	public List<InsaDTO> selectParamSearch(@ModelAttribute InsaDTO insaDTO,
//			HttpServletRequest request , PagingCriteria cri, Model model) throws Exception {
//
//		// 토탈
////		int total = insaService.selectInsaTotal(insaDTO);
////		int totalPage = (int) Math.ceil((double)total/10);
//		
//		List<InsaDTO> insaList = insaService.selectParamSearch(insaDTO);
//		
////		System.out.println("insaList : " + insaList);
////		
////		model.addAttribute("total", total);
////		model.addAttribute("totalPage", totalPage);
////		model.addAttribute("resultList", insaList);
//		
//		// List 
//		//List<InsaDTO> boardList = insaService.getBoardList(cri);
//		// Total
//		int total = insaService.totalCnt();
//		
//		System.out.println("리턴값");
//		System.out.println(insaList);
//		System.out.println("total");
//		System.out.println(total);
//		
//		// Model 정보 저장
//		model.addAttribute("total", total);
//		model.addAttribute("insaList",insaList); // list 
//		model.addAttribute("paging",new PageMaker(cri,total)); // Total 화면에 받아와함 
//		
//		return insaList;
//	}
	
	
	@PostMapping("/paramSearch") // ajax - 서버 url 
	@ResponseBody
	public Map<String,Object> selectParamSearch(@ModelAttribute InsaDTO insaDTO,
			HttpServletRequest request, @RequestParam(value = "page", defaultValue = "1", required = false) int page) throws Exception {
		
		Map<String,Object> rs = new HashMap<String, Object>();
		// 토탈
		int listcount = insaService.totalPage(insaDTO);
		int limit = 5;
		int maxpage = (listcount + limit - 1) / limit; // (13 + 9) / 10
        // 시작 페이지수
        int startpage = ((page - 1) / 10) * 10 + 1;
        int endpage = startpage + 10 - 1;

        // 최대 페이지, 최소 페이지
	    if (endpage > maxpage)
	       endpage = maxpage;
	    
	    int startrow = ((page-1) * limit) + 1;
        int endrow = page * limit;
	    
        // 현재 페이지가 최대 페이지보다 클 경우 다시 현재 페이지 최대 페이지로 셋팅
        if(page > maxpage) {
        	page = maxpage;
        }
		
        // 현상님?
		insaDTO.setLimit(limit);
		insaDTO.setPage(page);
		insaDTO.setStartpage(startpage);
		insaDTO.setEndpage(endpage);
		insaDTO.setMaxpage(maxpage);
		insaDTO.setStartrow(startrow);
		insaDTO.setEndrow(endrow);
		
		List<InsaDTO> insaList = insaService.selectParamSearch(insaDTO);
		
		// 정보 저장
		rs.put("insaList", insaList);
		rs.put("page",  page);
		rs.put("startpage",  startpage);
		rs.put("endpage",  endpage);
		rs.put("maxpage",  maxpage);
		
		return rs;
	}

	// 삭제
	@PostMapping("/delete")
	@ResponseBody
	public int deleteList(String sabun) {
		System.out.println("삭제 컨트롤러 진입!");
//		insaService.deleteList(sabun);
		System.out.println("삭제 컨트롤러 진입 성공!");
		return insaService.deleteList(sabun);
	}
	
///////////////////////////////////////////////////////////////////////////////
	
	// 공통코드 추가 과제 셋팅
	@PostMapping("/commonSet")
	@ResponseBody
	public List<InsaComDTO> commonSetList(@ModelAttribute InsaComDTO insaComDTO
			) throws Exception {
		
		System.out.println("공통코드 컨트롤러 진입!");
		
		List<InsaComDTO> commonSet = insaService.commonList();
		
		System.out.println("셋팅 끝!");

		return commonSet;
	}
	
	// 공통코드 저장
	
//	@PostMapping("/commonSave")
//	@ResponseBody
//	public Map<String, Object> commonUpsertList(@RequestParam String insaComDTO) {
//		
//		System.out.println("저장 컨트롤러 진입 : " + insaComDTO);
//		
//		Map<String, Object> result = new HashMap<>();
//		
//		try {
//			List<Map<String, Object>> info = new ArrayList<Map<String, Object>>();
//			//info = JSONArray.fromObject(insaComDTO);
//			insaService.commonUpsert();
//			
//			for (Map<String, Object> memberInfo : info) {
//				System.out.println(memberInfo.get("memberNo") + " : " + memberInfo.get("name"));
//			}
//			result.put("result", true);
//		} catch (Exception e) {
//			result.put("result", false);
//		}
//		return result;
//	}
	
	@PostMapping("/commonSave")
	@ResponseBody
	public String commonUpsertList(@ModelAttribute InsaComDTO insaComDTO,
			Locale locale)  throws Exception{
		
		System.out.println("저장 컨트롤러 진입 : " + insaComDTO);
		
		insaService.commonUpsert(insaComDTO);
		
		System.out.println("저장 끝!");
		
		return "result";
	}
}
	
///////////////////////////////////////////////////////////////////////////////
	
	// 페이지
//	@RequestMapping(value="/insaList")
//    public String insaList(Criteria cri, Model model) throws Exception {
// 
//        // 전체 글 개수
//        int insaListCnt = insaService.insaListCnt();
//        
//        // 페이징 객체
//        Paging paging = new Paging();
//        paging.setCri(cri);
//        paging.setTotalCount(insaListCnt);    
//        
//        List<Map<String, Object>> list = insaService.insaList(cri);
//        
//        model.addAttribute("list", list);    
//        model.addAttribute("paging", paging);    
//                
//        return "insaList";
//    }
