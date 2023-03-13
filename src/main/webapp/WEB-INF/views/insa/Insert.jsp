<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
	.table td{
	padding: 0.4rem !important;
	vertical-align: inherit !important;
	}
	.filebox label {
	  display: inline-block;
	  padding: .5em .75em;
	  color: #999;
	  font-size: inherit;
	  line-height: normal;
	  vertical-align: middle;
	  background-color: #fdfdfd;
	  cursor: pointer;
	  border: 1px solid #ebebeb;
	  border-bottom-color: #e2e2e2;
	  border-radius: .25em;
	}
	
	.filebox input[type="file"] {  /* 파일 필드 숨기기 */
	  position: absolute;
	  width: 1px;
	  height: 1px;
	  padding: 0;
	  margin: -1px;
	  overflow: hidden;
	  clip:rect(0,0,0,0);
	  border: 0;
	}
	img{
		position : absolut; top:0; left : 0;
		width: 100%;
		height:100%;
	}
	.wrapper {
	  display: flex;
	  justify-content: center;
	  align-items: center;
	  min-height: 86vh;
	}
</style>
<body>
<script src="https://code.jquery.com/jquery-3.5.1.js"></script>	
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
<script>
	
	// 화면 진입 했을 떄 동작하는 이벤트 
	$(document).ready(function() { // 도큐먼트 객체의 준비가 끝나면 = html 문서의 로딩이 다 끝나면
		
		// 한글성명 한글 유효성
		var name = document.querySelector('#name'); // name이라는 id로 반환해주는 메소드
		var onlyKorean = function() { // 함수
		  var pattern = /[^가-힣]/g; // 한글만 작성하게 해주는 정규식
		  this.value = this.value.replace(pattern, ''); // pattern에 담은 정규식을 찾아주고, '' 으로 변경해주는 메소드
		  //alert("한글 입력만 가능합니다.");
		};
		name.addEventListener('keypress', onlyKorean); // 키보드를 누를 때 실행, 계속 누르고 있는 경우에는 계속 실행
	
		// 영문성명 영문 유효성
		var engName = document.querySelector('#engName'); // engName이라는 id로 반환해주는 메소드
		var onlyEng = function() { // 함수
		  var pattern = /[^a-zA-Z]/g; // 영문만 작성하게 해주는 정규식
		  this.value = this.value.replace(pattern, ''); // pattern에 담은 정규식을 찾아주고, '' 으로 변경해주는 메소드
		  if(engName.value == "")
		  {
		  //alert("영문 입력만 가능합니다.");
		  }
		};
		engName.addEventListener('keyup', onlyEng); // 누른 키에서 손을 뗄 때 실행
		
		// 아이디 영문 + 숫자 유효성
		var id = document.querySelector('#id'); // id이라는 id로 반환해주는 메소드
		var onlyEngNumber1 = function() { // 함수
		  var pattern = /[^a-zA-Z | 0-9]/g; // 영문이랑 숫자만 작성하게 해주는 정규식
		  this.value = this.value.replace(pattern, ''); // pattern에 담은 정규식을 찾아주고, '' 으로 변경해주는 메소드
		  if(id.value == "")
		  {
		  //alert("영문 + 숫자 입력만 가능합니다.");
		  }
		};
		id.addEventListener('keyup', onlyEngNumber1);
		
		// 이메일 영문 + 숫자 유효성
		var email = document.querySelector('#email'); // email이라는 id로 반환해주는 메소드
		var onlyEngNumber2 = function() { // 함수
		  var pattern = /[^a-zA-Z | 0-9 | !?@#$%^&*():;+-=~{}<>\_\[\]\|\\\"\'\,\.\/\`\₩]/g;
		  this.value = this.value.replace(pattern, ''); // pattern에 담은 정규식을 찾아주고, '' 으로 변경해주는 메소드
		  if(email.value == "")
		  {
		  //alert("영문 + 숫자 입력만 가능합니다.");
		  }
		};
		email.addEventListener('keyup', onlyEngNumber2); // 누른 키에서 손을 뗄 때 실행
		
		// 전화번호 숫자 유효성
		var phone = document.querySelector('#phone'); // phone이라는 id로 반환해주는 메소드
		var onlyNumber1 = function() { // 함수
		  var pattern = /[^0-9]/g;
		  this.value = this.value.replace(pattern, ''); // pattern에 담은 정규식을 찾아주고, '' 으로 변경해주는 메소드
		  this.value = this.value.replace(/^(\d{2})(\d{4})(\d{4})$/, `$1-$2-$3`); // 숫자만 작성하게 해주는 정규식
		  if(phone.value == "")
		  {
		  //alert("숫자 입력만 가능합니다.");
		  }
		};
		phone.addEventListener('keyup', onlyNumber1); // 누른 키에서 손을 뗄 때 실행
		
		// 휴대폰번호 숫자 유효성
		var hp = document.querySelector('#hp'); // hp이라는 id로 반환해주는 메소드
		var onlyNumber2 = function() { // 함수
		  var pattern = /[^0-9]/g; // 숫자만 작성하게 해주는 정규식
		  this.value = this.value.replace(pattern, ''); // pattern에 담은 정규식을 찾아주고, '' 으로 변경해주는 메소드
		  this.value = this.value.replace(/^(\d{3})(\d{4})(\d{4})$/, `$1-$2-$3`); // 앞3, 중간4, 뒤4 휴대폰 번호 형식에 맞게 하이픈 생성
		  if(hp.value == "")
		  {
		  //alert("숫자 입력만 가능합니다.");
		  }
		};
		hp.addEventListener('keyup', onlyNumber2); // 누른 키에서 손을 뗄 때 실행
		
		// 널 값 체크하는 함수 
		function checkNull (str){
			if(typeof str == "undefined" || str == null || str == ""){
				return true;
			}
			else{
				return false;
			}
		}
		
		// 주민번호 뒷자리 마스킹 할 수 있게끔 셋팅
		function rrn(str){
			let originStr = str;
			let rrnStr;
			let maskingStr;
			let strLength;
			
			if(checkNull(originStr) == true){
				return originStr;
			}
			
			rrnStr = originStr.match(/(?:[0-9]{2}(?:0[1-9]|1[0-2])(?:0[1-9]|[1,2][0-9]|3[0,1]))-[1-4]{1}[0-9]{6}\b/gi);
			if(checkNull(rrnStr) == false){
				strLength = rrnStr.toString().split('-').length;
				maskingStr = originStr.toString().replace(rrnStr,rrnStr.toString().replace(/(-?)([1-4]{1})([0-9]{6})\b/gi,"$1$2******"));
			}else {
				rrnStr = originStr.match(/\d{13}/gi);
				if(checkNull(rrnStr) == false){
					strLength = rrnStr.toString().split('-').length;
					maskingStr = originStr.toString().replace(rrnStr,rrnStr.toString().replace(/([0-9]{6})$/gi,"******"));
				}else{
					return originStr;
				}
			}
			return maskingStr;
		}
		
		// 주민번호 뒷자리 마스킹 갯수 다르게 연습(뒷자리 마스킹 3개만) - 함수는 만들어 놓고 언제든지 필요할 때 사용하기
		/* function rrns(str){
			let originStr = str;
			let rrnStr;
			let maskingStr;
			let strLength;
			
			if(checkNull(originStr) == true){
				return originStr;
			}
			
			rrnStr = originStr.match(/(?:[0-9]{2}(?:0[1-9]|1[0-2])(?:0[1-9]|[1,2][0-9]|3[0,1]))-[1-4]{1}[0-9]{6}\b/gi);
			if(checkNull(rrnStr) == false){
				strLength = rrnStr.toString().split('-').length;
				maskingStr = originStr.toString().replace(rrnStr,rrnStr.toString().replace(/(-?)([1-4]{1})([0-9]{3})\b/gi,"$1$2***"));
			}else {
				rrnStr = originStr.match(/\d{13}/gi);
				if(checkNull(rrnStr) == false){
					strLength = rrnStr.toString().split('-').length;
					maskingStr = originStr.toString().replace(rrnStr,rrnStr.toString().replace(/([0-9]{6})$/gi,"******"));
				}else{
					return originStr;
				}
			}
			return maskingStr;
		} */
		
		// 주민번호 숫자 유효성
		var regNo = document.querySelector('#regNo'); // hp이라는 id로 반환해주는 메소드
		var onlyNumber3 = function() { // 함수
		  var pattern = /[^0-9]/g; // 숫자만 작성하게 해주는 정규식
		  this.value = this.value.replace(pattern, ''); // pattern에 담은 정규식을 찾아주고, '' 으로 변경해주는 메소드
		  this.value = this.value.replace(/^(\d{6})(\d{7})$/, `$1-$2`); // 앞6, 뒤7 주민번호 형식에 맞게 하이픈 생성
		// 히든으로 숨긴 진짜 값을 넘기기
		  $("#reg").val(this.value);
		  this.value = rrn(this.value);
		};
		regNo.addEventListener('keyup', onlyNumber3);
		
		// 연령 숫자 유효성
		var years = document.querySelector('#years'); // hp이라는 id로 반환해주는 메소드
		var onlyNumber4 = function() { // 함수
		  var pattern = /[^0-9]/g; // 숫자만 작성하게 해주는 정규식
		  this.value = this.value.replace(pattern, ''); // pattern에 담은 정규식을 찾아주고, '' 으로 변경해주는 메소드
		  if(years.value == "")
 		  {
		  //alert("숫자 입력만 가능합니다.");
		  }
		};
		years.addEventListener('keyup', onlyNumber4);
		
		// 연봉 숫자 유효성
		var salary = document.querySelector('#salary'); // hp이라는 id로 반환해주는 메소드
		var onlyNumber5 = function() { // 함수
		  var pattern = /[^0-9]/g; // 숫자만 작성하게 해주는 정규식
		  this.value = this.value.replace(pattern, ''); // pattern에 담은 정규식을 찾아주고, '' 으로 변경해주는 메소드
		  this.value = this.value.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ','); // 3자리로 콤마 생성
		  if(salary.value == "")
		  {
		  //alert("숫자 입력만 가능합니다.");
		  }
		};
		salary.addEventListener('keyup', onlyNumber5);
		
		// 사업자번호 숫자 유효성
		var cmpRegNo = document.querySelector('#cmpRegNo'); // hp이라는 id로 반환해주는 메소드
		var onlyNumber6 = function() { // 함수
		  var pattern = /[^0-9]/g; // 숫자만 작성하게 해주는 정규식
		  this.value = this.value.replace(pattern, ''); // pattern에 담은 정규식을 찾아주고, '' 으로 변경해주는 메소드
		  this.value = this.value.replace(/^(\d{3})(\d{2})(\d{5})$/, `$1-$2-$3`); // 앞3, 중간2, 뒤5으로 사업자 번호 형식에 맞게 하이픈 생성
		  if(cmpRegNo.value == "")
		  {
		  //alert("숫자 입력만 가능합니다.");
		  }
		};
		cmpRegNo.addEventListener('keyup', onlyNumber6);
		
		// 입력 공통 코드 셋팅
	    $.ajax({
	        type: 'POST', 
	        url: '/insa/codeSet',
	        dataType: "json",
	        success: function(list) {
	        	 console.log("jsp 화면진입 성공!");
	        	 console.log(list);
				
	        	 for(var i=0; i<list.length; i++){ // leagth 속성을 사용하여 문자열의 길이(수)를 체크 및 반환
	        		 var option = "<option value='"+list[i].code+"'>"+list[i].name+"</option>"; // 공통코드에 있는 code와 name으로 셋팅.
	        		 console.log(list[i].gubun);
	        		 
	        		 if(list[i].gubun == "A05"){
	        		 	$('#joinGbnCode').append(option); // append 메소드로 선택된 요소 내부의 끝 부분에 삽입
	        		 	
	        		 }else if(list[i].gubun == "A03"){
		        		$('#posGbnCode').append(option); // append 메소드로 선택된 요소 내부의 끝 부분에 삽입
	        		 	
	        		 }else if(list[i].gubun == "A04"){
	        			$('#deptCode').append(option); // append 메소드로 선택된 요소 내부의 끝 부분에 삽입
	        			
	        		 }else if(list[i].gubun == "A06"){
	        			$('#joinType').append(option); // append 메소드로 선택된 요소 내부의 끝 부분에 삽입
	        			
	        		 }else if(list[i].gubun == "A07"){
	        			$('#gartLevel').append(option); // append 메소드로 선택된 요소 내부의 끝 부분에 삽입
	        			
	        		 }else if(list[i].gubun == "A01"){
	        			$('#milType').append(option); // append 메소드로 선택된 요소 내부의 끝 부분에 삽입
	        			
	        		 }else if(list[i].gubun == "A02"){
	        			$('#milLevel').append(option); // append 메소드로 선택된 요소 내부의 끝 부분에 삽입
	        			
	        		 }else /* if(list[i].gubun == "A08") */{
	        			$('#kosaClassCode').append(option); // append 메소드로 선택된 요소 내부의 끝 부분에 삽입
	        			//console.log("jsp 화면 셋팅 성공!");
	        		 }
	        		 /* 여기서 값을 안찍어주면 select 안에 가장 첫번째 옵션을 기본으로 보여주게 하는데
					 ** 여기서 val 로 찍어줄때 select 안에 옵션이 있는걸로 찍어주면 값이 바뀌고 없는걸로 찍어주면
					 ** 공백으로 보이게 처리한다.
					 */
	        		 /* $('#joinGbnCode').val("");
					 $('#posGbnCode').val("");
					 $('#deptCode').val("");
					 $('#joinType').val("");
					 $('#gartLevel').val("");
					 $('#milType').val("");
					 $('#milLevel').val("");
					 $('#kosaClassCode').val(""); */
	        	 }
	        }
	    });
	    
	    // 등록 + 수정 셋팅 
	    const urlParams = new URL(location.href).searchParams; // 새로운 인스턴스를 생성

		const sabun = urlParams.get('searchSabun'); // 생성한 인스턴스에 조회된 사번을 적용
		if(sabun == null){
			$(".new").show();
			$(".edit").hide();
			
			// 사번
	 		$.ajax({
	 	    	type: 'POST',
	 	    	url: '/insa/sabun',
	 	    	dataType: "json",
	 	    	success: function(list){
	 	    		console.log(list);
	 	    		var sabunList = list[0].sabun;
	 	    		console.log("jsp 사번진입 성공!");
	 	    		console.log(sabunList);
	 	    		$("#sabun").val(sabunList)
	 	    	}
	 	    });
		}
		// 입력 때는 저장, 상세 조회 때는 수정으로 보이게끔 하기
		else{
			$(".new").hide(); // html에 class에 미리 지정 
			$(".edit").show(); // html에 class에 미리 지정 
			$.ajax({
				type: 'POST',
				url: '/insa/user',
				data:{searchSabun : sabun},
				dataType: "json",
				success: function(list) {
					console.log(list);
					
					var optionNameData = "<option value='"+list.code+"'>"+list.name+"</option>"; // leagth 속성을 사용하여 문자열의 길이(수)를 체크 및 반환

					// 상세 조회 시 불러올 값들 셋팅
					$("#sabun").val(list.sabun);
					$("#name").val(list.name);
					$("#engName").val(list.engName);
					//pwdCheck
					$("#pwd").val(list.pwd);
					console.log("비밀번호 확인");
					console.log(list.pwd);
					$("#id").val(list.id);
					$("#phone").val(list.phone);
					$("#hp").val(list.hp);
					$("#regNo").val(rrn(list.regNo));
					$("#years").val(list.years);
					$("#email2").val(list.email);
					$("#email1").val(list.email2);
					$("#email").val(list.email1);
 					$("#joinGbnCode").val(list.joinGbnCode);
 					$("#sex").val(list.sex);
 					$("#zip").val(list.zip);
					$("#addr1").val(list.addr1);
					$("#addr2").val(list.addr2);
					$("#posGbnCode").val(list.posGbnCode);
					$("#deptCode").val(list.deptCode);
					//$("#salary").val(list.salary.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ','));
					$("#salary").val(list.salary);
					$("#joinType").val(list.joinType);
					$("#gartLevel").val(list.gartLevel);
					$("#putYn").val(list.putYn);
					$("#milYn").val(list.milYn);
					$("#milType").val(list.milType);
					$("#milLevel").val(list.milLevel);
					$("#milStartdate").val(list.milStartdate);
					$("#milEnddate").val(list.milEnddate);
					$("#kosaRegYn").val(list.kosaRegYn);
					$("#kosaClassCode").val(list.kosaClassCode);
					$("#joinDay").val(list.joinDay);
					$("#retireDay").val(list.retireDay);
					$("#cmpRegNo").val(list.cmpRegNo);
					$("#crmName").val(list.crmName);
					//$("#profileImage").val(list.profileImage);
					//$("#cmpRegImage").val(list.cmpRegImage);
					//$("#carrierImage").val(list.carrierImage);
					$("#selfIntro").val(list.selfIntro);
					$("#carrier").val(list.carrier);
					$("#regNo").keyup();
					// rrn(this.value);
					
					// 저장한 이미지 값 셋팅
					console.log("사진 값 : " + list.profileImage);
					if(list.profileImage != null){
		                  var img = document.createElement("img");
		                  img.setAttribute("src", '\\'+list.profileImage);
		                  document.querySelector("div#image_container").appendChild(img);
		                  $("#profileImage").val(list.profileImage);
		               }
		               if(list.cmpRegImage != null){
		                  var img2 = document.createElement("img");
		                  img2.setAttribute("src", '\\'+list.cmpRegImage);
		                  document.querySelector("div#crm_container").appendChild(img2);
		                  $("#cmpRegImage").val(list.cmpRegImage);
		               }
		               if(list.carrierImage != null){
		                  var img3 = document.createElement("img");
		                  img3.setAttribute("src", '\\'+list.carrierImage);
		                  document.querySelector("div#carrier_container").appendChild(img3);
		                  $("#carrierImage").val(list.carrierImage);
		               }
				}
			});
		}
		
	    // 주민번호 입력 시 성별, 연령 자동 셋팅
	    // blur는 다른 곳으로 옮기면 발생되는 이벤트
	    $("#regNo").blur(function()	
				{
					//alert("주민번호로 연령, 성별 셋팅!");
					// 날짜 변수 선언
					Now = new Date(); 
					// 위에서 받아온 전체 날짜를 받아서 NowYear라고 년도를 뽑아서 선언한 것
					NowYear = Now.getFullYear(); 
					
					// 인풋태그 아이디가 알이지넘버에 값을 j1이라는 변수로 선언
					var j1=$("#regNo").val(); 
					console.log(j1);
					// 방금 선언한 j1변수에 0번째에서 두자리를 잘라낸 n1을 선언
					var n1=j1.substring(0,2); 
					console.log(n1);
					// 동일하게 j1변수에서 7번째, 8번째를 잘라낸 n2를 선언
					var n2=j1.substring(7,8); 
					console.log(n2);

					// 1990년대
					if((n2==1)||(n2==2)){
						$("#years").val((NowYear-(1900 + Number(n1))));
					}
					// 2000년대
					if((n2==3)||(n2==4)){
						$("#years").val((NowYear-(2000 + Number(n1))));
					}
					// 남자
					if ((n2==1)||(n2==3)){
						document.form.sex.value="1";
					}
					// 여자
					if ((n2==2)||(n2==4)){
						document.form.sex.value="2";
					}
				});
	    
	    // 군필 여부 선택 시 이벤트
	    $("#milYn").blur(function() { // 다른 곳으로 옮기면 발생되는 이벤트
	    	//alert("군필 여부에 따른 실행!")
	    	if(document.form.milYn.value=='N'){
	    		console.log("N");
	    		//alert("군대 관련 작성 불가!")
	    		$('#milType').prop('disabled', true);
	    		$('#milLevel').prop('disabled', true);
	    		$('#milStartdate').prop('disabled', true);
	    		$('#milEnddate').prop('disabled', true);
				}
	    	else{
	    		// 군필이냐, 미필이냐에 따라서 true, false로 disabled 처리
	    		$('#milType').prop('disabled', false);
	    		$('#milLevel').prop('disabled', false);
	    		$('#milStartdate').prop('disabled', false);
	    		$('#milEnddate').prop('disabled', false);
	    	}
	    });
	    
	    // 저장 click
	    $(".save").click(function(){
			//console.log(list[i].gubun);
			console.log("jsp 저장 진입 성공!");
			
				// 값이 유효한지, 타당한지 확인하는 밸리데이션을 위한 변수 적용
				var id = document.getElementById("id");
				var pwd = document.getElementById("pwd");
				var pwdCheck = document.getElementById("pwdCheck");
				var name = document.getElementById("name");
				var hp = document.getElementById("hp");
				var joinDay = document.getElementById("joinDay");
				var email = document.getElementById("email");
				//var emailRegExp = /^[A-Za-z0-9_]+[A-Za-z0-9]*[@]{1}[A-Za-z0-9]+[A-Za-z0-9]*[.]{1}[A-Za-z]{1,3}$/;
				
				// 연봉 콤마 제거 (다른 방법 자바스크립트 or 쿼리)
				/* function fnReplace(val) {
					var ret = 0;
					if(typeof val != "undefined" && val != null && val != ""){
						ret = Number(val.replace(/,/gi,''));
					}
					return ret;		
				}
				$("#salary").val(fnReplace($("#salary").val())); */
				
				// 필수 값 체크
				if(name.value == "") {
					alert("한글성명을 입력하세요")
					name.focus(); // 폼 요소에 포커스를 놓았을 때 발생하는 이벤트
					return false;
				}
				
				if(id.value == "") {
					alert("아이디를 입력하세요")
					id.focus(); // 폼 요소에 포커스를 놓았을 때 발생하는 이벤트
					return false;
				}
				
				if(pwd.value == "") {
					alert("패스워드를 입력하세요")
					pwd.focus(); // 폼 요소에 포커스를 놓았을 때 발생하는 이벤트
					return false;
				}
				
				if(pwd.value !== pwdCheck.value) {
					alert("비밀번호가 일치하지 않습니다")
					pwdCheck.focus(); // 폼 요소에 포커스를 놓았을 때 발생하는 이벤트
					return false;
				}
				
				if(hp.value == "") {
					alert("핸드폰번호를 입력하세요")
					hp.focus(); // 폼 요소에 포커스를 놓았을 때 발생하는 이벤트
					return false;
				}
				
				if(email.value == "") {
					alert("이메일을 입력하세요")
					email.focus(); // 폼 요소에 포커스를 놓았을 때 발생하는 이벤트
					return false;
				}
				
				/* if (!emailRegExp.test(email)) {
					alert("이메일 형식이 올바르지 않습니다")				
					email.focus();
					
					return false;
				} */
				
				if(joinDay.value == "") {
					alert("입사일을 입력하세요")
					joinDay.focus(); // 폼 요소에 포커스를 놓았을 때 발생하는 이벤트
					return false;
				}
				alert("저장 성공, 이어서 수정도 가능!");
			
			var Formdata = $("#form").serialize();
			//Formdata += $("#salary").val();
			console.log("Formdata",Formdata);
			
			//return;
			console.log("dd");
			console.log(Formdata);
			
			// 저장 및 수정
			$.ajax({
				type: 'POST',
				url: '/insa/upsert',
				data: Formdata,
				dataType: "json",
				success: function(list) {
					console.log("저장 성공");
					alert("저장 성공, 이어서 수정도 가능!");
					}
			});// 저장끝
	    });
	});
	
	// 상세 조회 후 이전 버튼 클릭 시 데이터 보존
	function back(){
		const urlParams = new URL(location.href).searchParams;
		const sabun = urlParams.get('sabun'); // 사번
		const name = urlParams.get('name'); // 이름
		const joinType = urlParams.get('joinType'); //입사구분
		const putYn = urlParams.get('putYn'); // 투입여부
		const posGbnCode = urlParams.get('posGbnCode'); //직위
		const joinDay = urlParams.get('joinDay'); // 입사일
		const retireDay = urlParams.get('retireDay'); // 퇴사일
		const joinGbnCode = urlParams.get('joinGbnCode'); //직종
		const page = urlParams.get('page'); //직종
		
		// 돌아온 상태의 url 주소와 매칭되어야 함.
		location.href="/insa/select?sabun="+sabun + "&name=" + name + "&joinType=" + joinType +
				"&putYn=" + putYn + "&posGbnCode=" + posGbnCode + "&joinDay=" + joinDay + 
				"&retireDay=" + retireDay + "&joinGbnCode=" + joinGbnCode + "&searchSabun" + "&page="+ page;
	}
	
	// 미리보기 모달창을 위한 함수
	function alignModal(){
	    var modalDialog = $(this).find(".modal-dialog");
	    // Applying the top margin on modal dialog to align it vertically center
	    modalDialog.css("margin-top", Math.max(0, ($(window).height() - modalDialog.height()) / 2));
	}
	// Align modal when it is displayed
	$(".modal").on("shown.bs.modal", alignModal);

	// Align modal when user resize the window
	$(window).on("resize", function(){
	    $(".modal:visible").each(alignModal);
	}); 
</script>

<script>
	
	// 날짜 기능을 도와주는 데이트피커 함수
$(function() {
	   $(".datepicker").datepicker();
    $.datepicker.setDefaults({
        dateFormat: 'yy-mm-dd', // 달력 날짜 형태
        showOtherMonths: true, // 빈 공간에 현재월의 앞뒤월의 날짜를 표시
        showMonthAfterYear:true, // 월- 년 순서가아닌 년도 - 월 순서
        changeYear: true, // option값 년 선택 가능
        changeMonth: true, // option값  월 선택 가능
        yearSuffix: "년", // 달력의 년도 부분 뒤 텍스트
        prevText: '이전 달',
        nextText: '다음 달',
        monthNames: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
        monthNamesShort: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
        dayNames: ['일', '월', '화', '수', '목', '금', '토'],
        dayNamesShort: ['일', '월', '화', '수', '목', '금', '토'],
        dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'],
        showMonthAfterYear: true,
        yearSuffix: '년',
       	minDate: "-100Y", // 최소 선택일자(-1D:하루전, -1M:한달전, -1Y:일년전)
        maxDate: "+100y" // 최대 선택일자(+1D:하루후, -1M:한달후, -1Y:일년후)
      });
    
 	// 입사일을 체크한 날짜 전으로는 체크할 수 없게끔 막는다.
    $('#milEnddate').datepicker("option", "onClose", function (selectedDate) {
    	if(selectedDate.length==10)
        $("#milStartdate").datepicker("option", "maxDate", selectedDate);
    	else
    		$("#milStartdate").datepicker("option", "maxDate", max);
    });
    $('#milStartdate').datepicker("option", "onClose", function (selectedDate) {
    	if(selectedDate.length==10)
            $("#milEnddate").datepicker("option", "minDate", selectedDate);
        else
            $("#milEnddate").datepicker("option", "minDate", min);
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

   /* $(function() {
       //input을 datepicker로 선언
       $("#joinDay").datepicker({
           dateFormat: 'yy-mm-dd' //달력 날짜 형태
           ,showOtherMonths: true //빈 공간에 현재월의 앞뒤월의 날짜를 표시
           ,showMonthAfterYear:true // 월- 년 순서가아닌 년도 - 월 순서
           ,changeYear: true //option값 년 선택 가능
           ,changeMonth: true //option값  월 선택 가능                
           ,showOn: "both" //button:버튼을 표시하고,버튼을 눌러야만 달력 표시 ^ both:버튼을 표시하고,버튼을 누르거나 input을 클릭하면 달력 표시  
//            ,buttonImage: "http://jqueryui.com/resources/demos/datepicker/images/calendar.gif" //버튼 이미지 경로
           ,buttonImageOnly: false //버튼 이미지만 깔끔하게 보이게함
           ,buttonText: "선택" //버튼 호버 텍스트              
           ,yearSuffix: "년" //달력의 년도 부분 뒤 텍스트
           ,monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'] //달력의 월 부분 텍스트
           ,monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'] //달력의 월 부분 Tooltip
           ,dayNamesMin: ['일','월','화','수','목','금','토'] //달력의 요일 텍스트
           ,dayNames: ['일요일','월요일','화요일','수요일','목요일','금요일','토요일'] //달력의 요일 Tooltip
           ,minDate: "-100Y" //최소 선택일자(-1D:하루전, -1M:한달전, -1Y:일년전)
           ,maxDate: "+100y" //최대 선택일자(+1D:하루후, -1M:한달후, -1Y:일년후)  
       });                    
       // 초기 값은 오늘 날짜로 적용되게끔 한다.
       //$('#joinDay').datepicker('setDate', 'today'); //(-1D:하루전, -1M:한달전, -1Y:일년전), (+1D:하루후, -1M:한달후, -1Y:일년후)            
   }); */
</script>

<script>
   /* $(function() {
       //input을 datepicker로 선언
       $("#retireDay").datepicker({
           dateFormat: 'yy-mm-dd' //달력 날짜 형태
           ,showOtherMonths: true //빈 공간에 현재월의 앞뒤월의 날짜를 표시
           ,showMonthAfterYear:true // 월- 년 순서가아닌 년도 - 월 순서
           ,changeYear: true //option값 년 선택 가능
           ,changeMonth: true //option값  월 선택 가능                
           ,showOn: "both" //button:버튼을 표시하고,버튼을 눌러야만 달력 표시 ^ both:버튼을 표시하고,버튼을 누르거나 input을 클릭하면 달력 표시  
//            ,buttonImage: "http://jqueryui.com/resources/demos/datepicker/images/calendar.gif" //버튼 이미지 경로
           ,buttonImageOnly: true //버튼 이미지만 깔끔하게 보이게함
           ,buttonText: "선택" //버튼 호버 텍스트              
           ,yearSuffix: "년" //달력의 년도 부분 뒤 텍스트
           ,monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'] //달력의 월 부분 텍스트
           ,monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'] //달력의 월 부분 Tooltip
           ,dayNamesMin: ['일','월','화','수','목','금','토'] //달력의 요일 텍스트
           ,dayNames: ['일요일','월요일','화요일','수요일','목요일','금요일','토요일'] //달력의 요일 Tooltip
           ,minDate: "-100Y" //최소 선택일자(-1D:하루전, -1M:한달전, -1Y:일년전)
           ,maxDate: "+100y" //최대 선택일자(+1D:하루후, -1M:한달후, -1Y:일년후)  
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
   }); */
</script>

<script>
   /* $(function() {
       //input을 datepicker로 선언
       $("#milStartdate").datepicker({
           dateFormat: 'yy-mm-dd' //달력 날짜 형태
           ,showOtherMonths: true //빈 공간에 현재월의 앞뒤월의 날짜를 표시
           ,showMonthAfterYear:true // 월- 년 순서가아닌 년도 - 월 순서
           ,changeYear: true //option값 년 선택 가능
           ,changeMonth: true //option값  월 선택 가능                
           ,showOn: "both" //button:버튼을 표시하고,버튼을 눌러야만 달력 표시 ^ both:버튼을 표시하고,버튼을 누르거나 input을 클릭하면 달력 표시  
//            ,buttonImage: "http://jqueryui.com/resources/demos/datepicker/images/calendar.gif" //버튼 이미지 경로
           ,buttonImageOnly: true //버튼 이미지만 깔끔하게 보이게함
           ,buttonText: "선택" //버튼 호버 텍스트              
           ,yearSuffix: "년" //달력의 년도 부분 뒤 텍스트
           ,monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'] //달력의 월 부분 텍스트
           ,monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'] //달력의 월 부분 Tooltip
           ,dayNamesMin: ['일','월','화','수','목','금','토'] //달력의 요일 텍스트
           ,dayNames: ['일요일','월요일','화요일','수요일','목요일','금요일','토요일'] //달력의 요일 Tooltip
           ,minDate: "-100Y" //최소 선택일자(-1D:하루전, -1M:한달전, -1Y:일년전)
           ,maxDate: "+100y" //최대 선택일자(+1D:하루후, -1M:한달후, -1Y:일년후)  
       });                    
       
       // 초기 값은 오늘 날짜로 적용되게끔 한다.
       //$('#milStartdate').datepicker('setDate', 'today'); //(-1D:하루전, -1M:한달전, -1Y:일년전), (+1D:하루후, -1M:한달후, -1Y:일년후)            
   }); */
</script>

<script>
   /* $(function() {
       //input을 datepicker로 선언
       $("#milEnddate").datepicker({
           dateFormat: 'yy-mm-dd' //달력 날짜 형태
           ,showOtherMonths: true //빈 공간에 현재월의 앞뒤월의 날짜를 표시
           ,showMonthAfterYear:true // 월- 년 순서가아닌 년도 - 월 순서
           ,changeYear: true //option값 년 선택 가능
           ,changeMonth: true //option값  월 선택 가능                
           ,showOn: "both" //button:버튼을 표시하고,버튼을 눌러야만 달력 표시 ^ both:버튼을 표시하고,버튼을 누르거나 input을 클릭하면 달력 표시  
//            ,buttonImage: "http://jqueryui.com/resources/demos/datepicker/images/calendar.gif" //버튼 이미지 경로
           ,buttonImageOnly: true //버튼 이미지만 깔끔하게 보이게함
           ,buttonText: "선택" //버튼 호버 텍스트              
           ,yearSuffix: "년" //달력의 년도 부분 뒤 텍스트
           ,monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'] //달력의 월 부분 텍스트
           ,monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'] //달력의 월 부분 Tooltip
           ,dayNamesMin: ['일','월','화','수','목','금','토'] //달력의 요일 텍스트
           ,dayNames: ['일요일','월요일','화요일','수요일','목요일','금요일','토요일'] //달력의 요일 Tooltip
           ,minDate: "-100Y" //최소 선택일자(-1D:하루전, -1M:한달전, -1Y:일년전)
           ,maxDate: "+100y" //최대 선택일자(+1D:하루후, -1M:한달후, -1Y:일년후)  
       });                    
       
    	// 입영일자를 체크한 날짜 전으로는 체크할 수 없게끔 막는다.
       $('#milEnddate').datepicker("option", "onClose", function (selectedDate) {
       	if(selectedDate.length==10)
           $("#milStartdate").datepicker("option", "maxDate", selectedDate);
       	else
       		$("#milStartdate").datepicker("option", "maxDate", max);
       });
       $('#milStartdate').datepicker("option", "onClose", function (selectedDate) {
       	if(selectedDate.length==10)
               $("#milEnddate").datepicker("option", "minDate", selectedDate);
           else
               $("#milEnddate").datepicker("option", "minDate", min);
       });          
   }); */
</script>

<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script>
	// 주소 기능을 위한 카카오 지도의 API
	window.onload = function(){
	    document.getElementById("searchZip").addEventListener("click", function(){ //주소입력칸을 클릭하면
	        //카카오 지도 발생
	        new daum.Postcode({
	            oncomplete: function(list) { //선택시 입력값 세팅
	            	
	            	var addr = '';
	            
	            if(list.userSelectedType === 'R') {
	            	addr = list.roadAddress;
	            } else {
	            	addr = list.jibunAddress;
	            }
	                document.getElementById("zip").value = list.zonecode; // 주소 넣기
	                document.getElementById("addr1").value = addr; // 주소 넣기
	                document.getElementById("addr2").focus();
	                document.getElementById('zip').readOnly = true;
	    			document.getElementById('addr1').readOnly = true;
	            }
	        }).open();
	    });
	}
</script>

	<jsp:include page="../common/header.jsp"/>
	
	<h1>직원 상세 정보</h1>
	
	<!-- 입력하려는 경로 때 보여지는 버튼 -->
	<div align="right" class="new">
		<button type="button" class="btn-regist save" id="save">저장</button> 
		<button type="button" class="btn-regist" onClick="location.href='/insa/insert'">신규</button> 
		<button type="button" class="btn-regist" onClick="location.href='/insa/main'">이전</button> 
	</div>
	
	<!-- 조회 후 상세조회 때 보여지는 버튼 -->
	<div align="right" class="edit">
		<button type="button" class="btn-regist save" id="update">수정</button>		
		<button type="button" class="btn-regist delete" id="delete">삭제</button> 
		<button type="button" class="btn-regist" onClick="back()">이전</button> 
	</div>
	
	<form id="form" name="form">
	
		<div class="form-group">
			<div id="image_container" style="width: 30%; border: 1px solid; height: 300px; margin: auto;">
			</div>
			
			<div style="margin-top: 3%;">
					<center><label for="PRO" class='btn btn-outline-dark'>사진 올리기</label></center>
				</div>
			<input class="form-control form-control-user" type="file" name="PRO" id="PRO" title="파일첨부" multiple="multiple" onchange="setThumbnail(event);" style="display:none;">
			<input type="hidden" name="profileImage" id="profileImage">
			
			
		</div>
	
		<label for="sabun">*사번</label>
		<input type="text" style="text-align:right;" id="sabun" name="sabun"/>
		
		<label for="name">*한글성명</label>
		<input type="text" id="name" name="name"/>
		
		<label for="engName">영문성명</label>
		<input type="text" id="engName" name="engName"/>
		
		<br/><br/>
		
		<label for="id">*아이디</label>
		<input type="text" id="id" name="id"/>
		
		<label for="pwd">*패스워드</label>
		<input type="password" id="pwd" name="pwd"/>
		
		<label for="pwdCheck">*패스워드 확인</label>
		<input type="password" id="pwdCheck" name="pwdCheck"/>
		
		<br/><br/>
		
		<label for="phone">전화번호</label>
		<input type="tel" style="text-align:right;" id="phone" name="phone"/>
		
		<label for="hp">*핸드폰번호</label>
		<input type="tel" style="text-align:right;" id="hp" name="hp"/>
		
		<label for="regNo">주민번호</label>
		<input type="text" style="text-align:right;" id="regNo" name="regNo" />
		<input type="hidden" id="reg" name="reg">
		<br/><br/>
		
		<label for="years">연령</label>
		<input type="text" style="text-align:right;" id="years" name="years"/>
		
		<label for="email">*이메일</label>
		<input type="text" id="email" name="email"/>
		<!-- <label>@</label> -->
		<input type="hidden" id="email2" name="email2"/>
		<select id="email1" name="email1">
			<option value>직접입력</option>
			<option value="@naver.com">@naver.com</option>
			<option value="@nate.com">@nate.com</option>
			<option value="@google.com">@google.com</option>
			<option value="@daum.com">@daum.com</option>
		</select>
		
		<label for="joinGbnCode">직종체크</label>
		<select name="joinGbnCode" id="joinGbnCode">
			<option value>선택</option>
		</select>
		
		<label for="sex">성별</label>
		<select name="sex" id="sex">
			<option value>선택</option>
			<option value="1">남성</option>
			<option value="2">여성</option>
		</select>
		
		<br/><br/>
		
		<label for="zip">주소</label>
		<input type="number" id="zip" name="zip" placeholder="우편 번호"/>
		<button type="button" id="searchZip">주소 검색</button>
		<input type="text" id="addr1" name="addr1" placeholder="주소"/>
		<input type="text" id="addr2" name="addr2" placeholder="세부 주소"/>
		
		<br/><br/>
		
        <label for="posGbnCode">직위</label>
		<select name="posGbnCode" id="posGbnCode">
			<option value>선택</option>
	    </select>
		
		<label for="deptCode">부서</label>
		<select name="deptCode" id="deptCode">
			<option value>선택</option>
		</select>
		
		<label for="salary">연봉</label>
		<input type="text" style="text-align:right;" id="salary" name="salary"/>
			
	<br/>
	
	<div class="div">
		<div>	
			<label for="joinType">입사구분</label>
			<select name="joinType" id="joinType">
				<option value>선택</option>
			</select>		
			
			<label for="gartLevel">등급</label>
			<select name="gartLevel" id="gartLevel">
				<option value>선택</option>	
			</select>	
			
			<label for="putYn">투입여부</label>
			<select name="putYn" id="putYn">
				<option value>선택</option>
			</select>	
			
			<label for="milYn">군필여부</label>				
			<select name="milYn" id="milYn">
				<option value>선택</option>
				<option value='Y'>군필</option>
				<option value='N'>미필</option>
			</select>					
		</div>
		
		<br/>
		
		<div>
			<label for="milType">군별</label>
			<select name="milType" id="milType">
				<option value>선택</option>
			</select>
			
			<label for="milLevel">계급</label>
			<select name="milLevel" id="milLevel">
				<option value>선택</option>
			</select>
			
			<label for="milStartdate">입영일자</label>
			<input type="text" id="milStartdate" class="datepicker" name="milStartdate" readonly ="readonly">
				
			<label for="milEnddate">전역일자</label>
			<input type="text" id="milEnddate" class="datepicker" name="milEnddate" readonly ="readonly">			
		</div>
		
		<br/>
		
		<div>
			<label for="kosaRegYn">KOSA등록</label>
			<select name="kosaRegYn" id="kosaRegYn">
				<option value>선택</option>
				<option value="N">미등록</option>
				<option value="Y">등록</option>					
			</select>
		
			<label for="kosaClassCode">KOSA등급</label>
			<select name="kosaClassCode" id="kosaClassCode">
				<option value>선택</option>
			</select>
			 
			<label for="joinDay">*입사일</label>
			<input type="text" id="joinDay" class="datepicker" name="joinDay" readonly ="readonly">
				
			<label for="retireDay">퇴사일</label>
			<input type="text" id="retireDay" class="datepicker" name="retireDay" readonly ="readonly">
		</div>
		
		<div>
			<label for="selfIntro">자기소개</label>
			<textarea name="selfIntro" id="selfIntro"></textarea>
		</div>
		
		<div>
			<label for="cmpRegNo">사업자번호</label>
			<input type="text" name="cmpRegNo" id="cmpRegNo" maxlength="10" oninput="this.value = this.value.replace(/^(\d{3})(\d{2})(\d{5})$/, `$1-$2-$3`)">
			<label for="crmName">업체명</label>
			<input type="text" name="crmName" id="crmName">
			
			<br/>
			
			<label for="cmpRegImage">사업자등록증</label>
			<input type="text" name="cmpRegImage" ID="cmpRegImage">
			<a href="#myModal" class="btn btn-outline-dark" data-toggle="modal">미리보기</a>
			<label for="CRM_UPLOAD" class='btn btn-outline-dark' style="margin-bottom:0 !important">등록</label>
			<input class="btn btn-outline-dark" type="file" id="CRM_UPLOAD" style="display:none;" onchange="setCRM(event);">
		
			<br/>
			
			<label for="carrierImage">이력서</label>
			<input type="text" name="carrierImage" ID="carrierImage">
			<a href="#myModal1" class="btn btn-outline-dark" data-toggle="modal">미리보기</a>
			<label for="CARRIER_UPLOAD" class='btn btn-outline-dark' style="margin-bottom:0 !important">등록</label>
			<input class="btn btn-outline-dark" type="file" id="CARRIER_UPLOAD" style="display:none;" onchange="setCARRIER(event);">
		</div>
	</div>
	</form>
	
	<jsp:include page="CRM_MODAL.jsp"/>
	<jsp:include page="CARRIER_MODAL.jsp"/>
	<jsp:include page="../common/footer.jsp"/>
	
</body>
<script>

// 프로필 사진 저장을 위한 함수
function setThumbnail(event){
	var reader = new FileReader();
	
	reader.onload = function(event){
		var img = document.createElement("img");
		img.setAttribute("src", event.target.result);
		$("#image_container").empty();
		document.querySelector("div#image_container").appendChild(img);
	};
	// 테스트중
	// $("#engName").val(event.target.files[0]);
	
	$("#profileImage").val(event.target.files[0].name);
	reader.readAsDataURL(event.target.files[0]);
}

// 사업자 등록증 사진 저장을 위한 함수
function setCRM(event){
	var reader = new FileReader();
	
	reader.onload = function(event){
		var img = document.createElement("img");
		img.setAttribute("src", event.target.result);
		$("#crm_container").empty();
		document.querySelector("div#crm_container").appendChild(img);
	};
	
	reader.readAsDataURL(event.target.files[0]);
	$("#cmpRegImage").val(event.target.files[0].name);
}

// 이력서 사진 저장을 위한 함수
function setCARRIER(event){
	var reader = new FileReader();
	
	reader.onload = function(event){
		var img = document.createElement("img");
		img.setAttribute("src", event.target.result);
		$("#carrier_container").empty();
		document.querySelector("div#carrier_container").appendChild(img);
	};
	
	reader.readAsDataURL(event.target.files[0]);
	$("#carrierImage").val(event.target.files[0].name);
}

// 이메일 값 이동
$("#email2").on("change", function(){
   	$("#email").val($("#email2").val());
});

// 삭제
$(".delete").click(function() {
	
	var insaSabun = $("#sabun").val();
	var yn = confirm("삭제하시겠습니까?");
	
	if(yn){
	$.ajax({
		type: 'POST',
		url: '/insa/delete',
		dataType: "json",
		data: {sabun : insaSabun}, // 사번 값으로 적용하여 처리
		success: function(data) {
		
			console.log(data);
			alert("삭제가 완료 되었습니다!");
			location.reload();
			//location.href= "/insa/insert";
			}
		});
	}
});


</script>
</html>