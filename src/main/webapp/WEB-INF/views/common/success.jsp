<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<script>
		(function(){
			const successCode = "${ requestScope.successCode }";
			
			let successMessage = "";
			let movePath = "";
			
			switch(successCode){
				case "insertMember" : 
					successMessage = "회원 가입에 성공하셨습니다!";
					movePath = "${ pageContext.servletContext.contextPath }";
					break;
				case "updateMember" : 
					successMessage = "회원정보 변경에 성공하셨습니다!";
					movePath = "${ pageContext.servletContext.contextPath }/member/update";
					break;
				case "deleteMember" : 
					successMessage = "회원 탈퇴에 성공하셨습니다!";
					movePath = "${ pageContext.servletContext.contextPath }/index.jsp";
					break;
				case "insertNotice" : 
					successMessage = "알림장 등록에 성공하셨습니다!";
					movePath = "${ pageContext.servletContext.contextPath }/notice";
					break;
				case "insertBoard" : 
					successMessage = "자유게시판 등록에 성공하셨습니다!";
					movePath = "${ pageContext.servletContext.contextPath }/board/list";
					break;
				case "insertThumbnail" : 
					successMessage = "사진게시판 등록에 성공하셨습니다!";
					movePath = "${ pageContext.servletContext.contextPath }/thumbnail/list";
					break;
				case "insertDog" : 
					successMessage = "강아지 정보 등록에 성공하셨습니다!";
					movePath = "${ pageContext.servletContext.contextPath }/dog/insert";
					break;
				case "updateDog" : 
					successMessage = "강아지 정보 수정에 성공하셨습니다!";
					movePath = "${ pageContext.servletContext.contextPath }/dog/select";
					break;
				case "deleteDog" : 
					successMessage = "강아지 정보 삭제 하였습니다.";
					movePath = "${ pageContext.servletContext.contextPath }/dog/select";
					break;
			}

			alert(successMessage);
			
			location.replace(movePath);
		})();
	
	</script>
</body>
</html>
