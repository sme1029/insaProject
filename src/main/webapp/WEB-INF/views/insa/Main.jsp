<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insa Project</title>
</head>

<body>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
	<!-- header.jsp를 따로 만들어서 불러옴. -->
	<jsp:include page="../common/header.jsp"/>
	
	<!-- 메인 제목 -->
	<h1 align="center">인사 관리 시스템</h1>
	<!-- 입력과 조회 버튼을 만들고 페이지를 이동할 로케이션 값을 지정함. -->
	<h3 align="center">인사 정보를 입력하겠습니다. <button onclick="location.href='/insa/insert'">입력</button></h3>
	<h3 align="center">인사 정보를 조회하겠습니다. <button onclick="location.href='/insa/select'">조회</button></h3>
	
	<!-- footer.jsp를 따로 만들어서 불러옴. -->
	<jsp:include page="../common/footer.jsp"/>
</body>
</html>