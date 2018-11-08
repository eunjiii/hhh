<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<%@include file="../includes/header.jsp"%>

<div class="row">
	<div class="col-lg-12">
		<h1 class="page-header">List</h1>
		<h2>
			<a href="/board/register">Register</a>
		</h2>
	</div>
	<!-- /.col-lg-12 -->
</div>

<div class="row">
	<div class="col-lg-12">
		<div class="panel panel-default">
			<div class="panel-heading">Board List</div>
			<!-- /.panel-heading -->
			<div class="panel-body">
				<div class="table-responsive">
					<table class="table table-striped table-bordered table-hover">
						<thead>
							<tr>
								<th>BNO</th>
								<th>TITLE</th>
								<th>WRITER</th>
								<th>REGDATE</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${list}" var="board">
								<tr>
									<td><c:out value="${board.bno}"></c:out></td>
									<td><a href="read?bno=${board.bno}"><c:out
												value="${board.title}"></c:out></a></td>
									<td><c:out value="${board.writer}"></c:out></td>
									<td><fmt:formatDate value="${board.regdate}"
											pattern="MM-dd HH:mm"></fmt:formatDate></td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
				<!-- /.table-responsive -->
			</div>
		<form id="actionForm">
			<input type='hidden' name='page' id='page' value='${pageObj.page}'>
			<input type='hidden' name='type' value='${pageObj.type}'>
			<input type='hidden' name='keyword' value='${pageObj.keyword}'>
		</form>
			<div class="dataTables_paginate paging_simple_numbers"
				id="dataTables-example_paginate">
				<ul class="pagination">
				<c:if test="${pageObj.prev}">
					<li class="paginate_button previous"		
						aria-controls="dataTables-example" tabindex="0"
						id="dataTables-example_previous"><a href="${pageObj.start-1}">Previous</a></li>
						</c:if>
						<c:forEach begin="${pageObj.start}" end="${pageObj.end}" var="page">
					<li class="paginate_button"
						aria-controls="dataTables-example" tabindex="0"><a href="${page}"><c:out value="${page}"></c:out></a></li>
						</c:forEach>
						<c:if test="${pageObj.next}">
					<li class="paginate_button next" aria-controls="dataTables-example"
						tabindex="0" id="dataTables-example_next"><a href="${pageObj.end+1}">Next</a></li>
						</c:if>
				</ul>
			</div>
			<select name="type">
			<option <c:out value="${pageObj.type== null?'selected':'' }"/>>nope</option>
			<option value="t" <c:out value="${pageObj.type== 't'?'selected':'' }"/>>title</option>
			<option value="c" <c:out value="${pageObj.type== 'c'?'selected':'' }"/>>content</option>
			<option value="w" <c:out value="${pageObj.type== 'w'?'selected':'' }"/>>writer</option>
			<option value="tc" <c:out value="${pageObj.type== 'tc'?'selected':'' }"/>>title+content</option>
			<option value="tcw" <c:out value="${pageObj.type== 'tcw'?'selected':'' }"/>>all</option>
			</select>
			<input type='text' id='keyword' value="${pageObj.keyword}">
			<button id="searchBtn">I'll find u</button>
			<!-- /.panel-body -->
		</div>
		<!-- /.panel -->
	</div>
	<!-- /.col-lg-6 -->
	</div>
<%@include file="../includes/footer.jsp"%>

<script>
$(document).ready(function(){
	
	var actionForm = $("#actionForm");
	var pagination = $(".pagination li a");
	pagination.on("click", function (e) {
		e.preventDefault();
		var target = $(this).attr("href");
		actionForm.find("input[name='page']").val(target);
		actionForm.attr("action","/board/list").attr("method","get").submit();	
	});
	$("#searchBtn").on("click",function(e){
		
		var typeValue = $("select[name='type'] option:selected").val();
		var keyWord = $("#keyword").val();
		
		actionForm.attr("action","/board/list");
		actionForm.find("input[name='type']").val(typeValue);
		actionForm.find("input[name='keyword']").val(keyWord);
		$("#page").val(1);
		actionForm.submit();
		
	});
	
	
	
	
});


</script>


	</body>

	</html>