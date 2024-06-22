<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>댓글 페이지</title>
<link rel="stylesheet" type="text/css" href="css/notice.css">
</head>
<body>
		<div class="container">
			<div class="comments-section">
				<h3>
					댓글 <span class="comment-count">(<c:out
							value="${commentCount}" />)
					</span>
				</h3>
				<!-- 댓글 입력 -->
				<div class="comment-form">
					<textarea placeholder="댓글을 작성하세요"></textarea>
					<button class="btn">등록</button>
				</div>
				<hr>
				<!-- 댓글 목록 -->
				<c:forEach var="comment" items="${comments}">
					<div class="comment">
						<div class="comment-info">
							<p>
								<c:out value="${comment.author}" />
							</p>
							<p>
								<c:out value="${comment.content}" />
							</p>
							<div class="actions">
								<p class="date">
									<c:out value="${comment.date}" />
								</p>
								<button class="edit-btn">수정</button>
								<button class="delete-btn">삭제</button>
							</div>
						</div>
					</div>
					<hr>
				</c:forEach>



				<div class="comment">
					<div class="comment-info">
						<p class="author">홍길동</p>
						<p class="comment-content">어렵구마잉어렵구마잉어렵구마잉어렵구마잉어렵구마잉어렵구마잉어렵구마잉어렵구마잉어렵구마잉어렵구마잉어렵구마잉어렵구마잉어렵구마잉어렵구마잉어렵구마잉어렵구마잉어렵구마잉어렵구마잉</p>
						<div class="actions">
							<p class="date">2000-00-00</p>
							<button class="edit-btn">수정</button>
							<button class="delete-btn">삭제</button>
						</div>
					</div>
				</div>
				<hr>
				<div class="comment">
					<div class="comment-info">
						<p class="author">홍길동</p>
						<p class="comment-content">어렵구마잉</p>
						<div class="actions">
							<p class="date">2000-00-00</p>
							<button class="edit-btn">수정</button>
							<button class="delete-btn">삭제</button>
						</div>
					</div>
				</div>
				<hr>


				<jsp:include page="../common/paging.jsp" />
			</div>
		</div>
</body>
</html>
