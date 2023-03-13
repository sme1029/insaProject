<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Select title here</title>
</head>
<body>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
<link rel="stylesheet" href="http://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script>

// 전역변수로 상단에 지정하여 어느 함수로든 호출함.
const urlParams = new URL(location.href).searchParams;
const sabun = urlParams.get('sabun');
const name = urlParams.get('name');
const joinType = urlParams.get('joinType');
const putYn = urlParams.get('putYn');
const posGbnCode = urlParams.get('posGbnCode');
const joinDay = urlParams.get('joinDay');
const retireDay = urlParams.get('retireDay');
const joinGbnCode = urlParams.get('joinGbnCode');
const getPage = urlParams.get("page");
var ParamPage = "";

// 조회 공통 코드 셋팅
$(function(){
	$.ajax({
		type: 'POST',
		url: '/insa/codeSet',
		dataType: "json",
		async : false,
		success: function(list) {
 			console.log(list);
 			
			// 체크 변수 선언
			var check = false;
			
			for(var i=0; i<list.length; i++){
       		 	var option = "<option value='"+list[i].code+"'>"+list[i].name+"</option>"; // 옵션을 만든 것
        		 	console.log(list[i].gubun);
       		 	if(list[i].gubun == "A06"){ // 그 옵션 안에 구분 값을 걸러낸 것
       		 		$('#joinType').append(option); // 그것을 넣은 것
	       		 	if(joinType != null && joinType !=""){ // 그 옵션에 아무 값도 없지 않거나, 다른 값도 없다면
	       				$("#joinType").val(joinType); // 그것을 불러와라
	       				check = true; // 체크가 있다면
	       			}
       		 	
       		 	}else if(list[i].gubun == "A03"){ // 그 옵션 안에 구분 값을 걸러낸 것
       				$('#posGbnCode').append(option); // 그것을 넣은 것
       				if(posGbnCode != null && posGbnCode !=""){ // 그 옵션에 아무 값도 없지 않거나, 다른 값도 없다면
       					$("#posGbnCode").val(posGbnCode); // 그것을 불러와라
       					check = true; // 체크가 있다면
       				}
       			
       		 	}else if(list[i].gubun == "A05"){ // 그 옵션 안에 구분 값을 걸러낸 것
       				$('#joinGbnCode').append(option); // 그것을 넣은 것
       				if(joinGbnCode != null && joinGbnCode !=""){ // 그 옵션에 아무 값도 없지 않거나, 다른 값도 없다면
       					$("#joinGbnCode").val(joinGbnCode); // 그것을 불러와라
       					check = true; // 체크가 있다면
       				}
       			
       		 	}
//        		$('#joinType').val(option);
// 				$('#posGbnCode').val(option);
// 		 		$('#joinGbnCode').val(option);
       	 	}
			// 체크가 있다면 + 자동으로 검색 되라 = 상세 조회 후 이전으로 돌아갈 시, 해당 페이지가 그대로 남아있게끔
			if(check){
				select(getPage);
			}
// 			console.log("내가 가져갈 코드",$('#joinGbnCode').val());
		}		
	});
})

// 조회 셋팅
$(document).ready(function() {
	
	// 검색 후 불러올 값
	if(check()){
		select(getPage);
	};
	
	// 검색 버튼 누를 시
	$("#getSearch").click(function() {
		 alert("검색 완료!");
		select();
	});
	
	// 체크를 위한 함수 생성
	function check(){
			
		var ck = false;
		
		// 상단에 작성한 전역변수에 값 유무 확인 후 데이터 있을 경우에만 검색 동작 실시
		if(sabun != null && sabun !=""){
			$("#sabun").val(sabun);
			ck = true;
		}
		if(name != null && name !=""){
			$("#name").val(name);
			ck = true;
		}
		if(joinType != null && joinType !=""){
			$("#joinType").val(joinType);
			ck = true;
		}
		if(putYn != null && putYn !=""){
			$("#putYn").val(putYn);
			ck = true;
		}
		if(posGbnCode != null && posGbnCode !=""){
			$("#posGbnCode").val(posGbnCode);
			ck = true;
		}
		if(joinDay != null && joinDay !=""){
			$("#joinDay").val(joinDay);
			ck = true;
		}
		if(retireDay != null && retireDay !=""){
			$("#retireDay").val(retireDay);
			ck = true;
		}
		if(joinGbnCode != null && joinGbnCode !=""){
			$("#joinGbnCode").val(joinGbnCode);
			ck = true;
		}
		
		// searchsabun의 파라미터 존재 유무 확인 후 검색 동작 실시
		if(urlParams.has('searchSabun')){
			ck = true;
		}
		return ck;
	}
	$("#boardTable").on('click','.aaaa',function(){
		var tr = $(this),
		    td = $(this).children();
		var Formdata = $("form").serialize(); // 내가 작성한 값들 ..
 	 	console.log(Formdata);
 	 	console.log("되돌아오기!");
		location.href= "/insa/insert?searchSabun=" + td[0].innerText + "&"+ Formdata+"&page=" + ParamPage;
	})
});

//널 값 체크하는 함수
function isEmpty(value) {
    if (value === "" || value === undefined || value === null) {
        return false;
    }

    return true;
}

// 페이지 처리를 위한 함수
function select(pageNum){
	
	var Formdata = $("form").serialize();
	if(!isEmpty(pageNum)){
		 pageNum = 1;
	 }
	ParamPage = pageNum;
	Formdata+="&page="+pageNum;
	console.log("페이지 수", pageNum);
	
	// 조회 페이지에서 검색 후 불러올 데이터 통신
	$.ajax({
		type: 'POST',
		url : "/insa/paramSearch",
		data: Formdata,
		async: false,
		dataType: "json",
		success: function(list) {
		    //var search_var = list.insaList; // data로 받아온 List를 변수에 담기
 			console.log("검색 후 search_var >>>>>", list);
			
		    // html 테이블에서 지정한 id 값과 매칭 
		    $("#tbody").empty();
			 for(i=0; i<list.insaList.length; i++) {
				var a = "<tr class='aaaa' style='cursor:pointer'>" +
				//var a = "<tr><td><a href='/insa/insert?sabun="+list[i].sabun+ "'>" +
				//list[i].sabun + "</td>"
				//+ "<td>" +  list[i].name +
				"<td style='text-align:right;'>"+ list.insaList[i].sabun + "</td>" +
				"<td>"+ list.insaList[i].name + "</td>" +
				"<td>"+ list.insaList[i].regNo + "</td>" +
				"<td>"+ list.insaList[i].hp + "</td>" +
				"<td>"+ list.insaList[i].posGbnCode + "</td>" +
				"<td>"+ list.insaList[i].joinDay + "</td>" +
				"<td>"+ list.insaList[i].retireDay + "</td>" +
				"<td>"+ list.insaList[i].putYn + "</td>" +
				"<td style='text-align:right;'>"+ list.insaList[i].salary.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',') + "</td>"+"</tr>";
				//"<td>"+ list.insaList[i].joinYn + "</td>" +
				//"<td>"+ list.insaList[i].salary + "</td>"+"</tr>";
				$("#tbody").append(a);
			}
			 
			// 페이지 버튼을 위한 변수
		 	var aa = '';
            var page = list.page;
            var startpage = list.startpage;
            var endpage = list.endpage;
            
            console.log("page",page);
            console.log("endpage",endpage);
            
            // 삭제 시 페이지 변화에 맞게 셋팅
            if(pageNum > endpage){
            	select(page);
            }
            
            if(pageNum == 1){
            	aa += '<li class="page-item disabled"><button class= "page-link" onclick="select(1);">Previous</button></li>';
			}
            else{
            	aa += '<li class="page-item"><button class= "page-link" onclick="select(' + (pageNum - 1) + ');">Previous</button></li>';
            }
            for (var num=startpage; num<=endpage; num++) {
                 if (num == page) {
                      aa += '<li class="page-item active"><button type="button" class="page-link" onclick="select(' + num + ');" class="page-btn">' + num + '</button></li>';
                 } else {
                      aa += '<li class="page-item"><button type="button" class="page-link" onclick="select(' + num + ');" class="page-btn">' + num + '</button></li>';
                 }
              }

            	aa += '<li class="page-item"><button class= "page-link" onclick="select(' + ( Number(pageNum) + 1) + ');">Next</button></li>';

            $('.pagination').empty();
   			$('.pagination').append(aa);
 		 	console.log("jsp 검색 진입 성공!");
 			console.log("넘어갈 데이터 ->");
 			console.log(Formdata);
		 },
		 error : function(xhr, status, error) {
			    // 응답을 받지 못하거나 정상적인 응답이지만 데이터 형식을 확인할 수 없는 경우
			    alert("검색 실패!");
			  }
		});
}
</script>
<script>

	// 날짜 기능을 도와주는 데이터피커 함수
   $(function() {
	   $(".datepicker").datepicker();
       $.datepicker.setDefaults({
           dateFormat: 'yy-mm-dd', // 달력 날짜 형태
           showOtherMonths: true, // 빈 공간에 현재월의 앞뒤월의 날짜를 표시
           showMonthAfterYear:true, // 월- 년 순서가아닌 년도 - 월 순서
           changeYear: true, // option값 년 선택 가능
           changeMonth: true, // option값  월 선택 가능
           yearSuffix: "년", //달력의 년도 부분 뒤 텍스트
           prevText: '이전 달',
           nextText: '다음 달',
           monthNames: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
           monthNamesShort: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
           dayNames: ['일', '월', '화', '수', '목', '금', '토'],
           dayNamesShort: ['일', '월', '화', '수', '목', '금', '토'],
           dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'],
           showMonthAfterYear: true,
           yearSuffix: '년',
           minDate: "-100Y", //최소 선택일자(-1D:하루전, -1M:한달전, -1Y:일년전)
           maxDate: "+100y" //최대 선택일자(+1D:하루후, -1M:한달후, -1Y:일년후)
         });
       
       // 입사일을 체크한 날짜 전으로는 체크할 수 없게끔 막는다.
       $('#retireDay').datepicker("option", "onClose", function (selectedDate) {
       	if(selectedDate.length==10)
           $("#joinDay").datepicker("option", "maxDate", selectedDate);
       	else
       		$("#joinDay").datepicker("option", "maxDate", max);
       });
       $('#joinDay').datepicker("option", "onClose", function (selectedDate) {
       	if(selectedDate.length==10)
               $("#retireDay").datepicker("option", "minDate", selectedDate);
           else
               $("#retireDay").datepicker("option", "minDate", min);
       });
   });
</script>

	<jsp:include page="../common/header.jsp"/>
	
	<h1>직원 상세 정보</h1>
	
	<div align=right>	
		<!-- <button type="button" id="testbtn">test</button> -->
		<button type="button" id="getSearch" name="getSearch" class="btn btn-outline-primary mr-2">검색</button>
		<button type="button" class="btn btn-outline-primary mr-2" onClick="location.href='/insa/select'">초기화</button> 
		<button type="button" class="btn btn-outline-primary mr-2" onClick="location.href='/insa/main'">이전</button> 
	</div>
	
	<form id="form" name="form" method="post">
	
	<table border="1" class="selectTable table" id="selectTable" style="margin-bottom: 2%;">
		<tr>
			<td>
				<label for="sabun">사번</label>
			</td>
			<td>
				<input type="text" style="text-align:right;" id="sabun" name="sabun" class="form-control">
			</td>
			<td>
				<label for="name">성명</label>
			</td>
			<td>
				<input type="text" id="name" name="name" class="form-control">
			</td>
			<td>
				<label for="joinType" >입사구분</label>
			</td>
			<td>
				<select name="joinType" id="joinType" class="form-control">
					<option value="" selected>(선택)</option>
				</select>
			</td>
			<td>
				<label for="putYn">투입여부</label>
			</td>
			<td>
				<select name="putYn" id="putYn" class="form-control">
					<option value="" selected>(선택)</option>
					<option value='Y'>Y</option>
					<option value='N'>N</option>
				</select>
			</td>
		</tr>
		<tr>
		<td>
		<label for="posGbnCode">직위</label>
		</td>
		<td>
		<select name="posGbnCode" id="posGbnCode" class="form-control">
			<option value="" selected>(선택)</option>
		</select>
		</td>
		<td>
		<label for="joinDay">입사일</label>
		</td>
		<td>
		<input type="text" id="joinDay" name="joinDay" class="form-control datepicker" readonly ="readonly">
		</td>
		<td>
		<label for="retireDay">퇴사일</label>
		</td>
		<td>
		<input type="text" id="retireDay" name="retireDay" class="form-control datepicker" readonly ="readonly">
		</td>
		<td>
		<label for="joinGbnCode">직종체크</label>
		</td>
		<td>
		<select name="joinGbnCode" id="joinGbnCode" class="form-control">
			<option value="" selected>(선택)</option>
		</select>
		</td>
		</tr>
	</table>
	
	<div>

	<table class="boardTable table" id="boardTable">
		
		<thead>
		<tr>
		<th>사번</th>
		<th>성명</th>
		<th>주민번호</th>
		<th>핸드폰번호</th>
		<th>직위</th>
		<th>입사일자</th>
		<th>퇴사일자</th>
		<th>투입여부</th>
		<th>연봉</th>
		</tr>
		</thead>
		<tbody id="tbody">
		</tbody>
		</table>
		</div>
		
	</form>
		
	<div id="div_paginate"></div> 
	
	  <nav aria-label="Page navigation example">
      <ul class="pagination justify-content-center">
      </ul>
  	 </nav>
	
	<jsp:include page="../common/footer.jsp"/>
	
</body>
</html>