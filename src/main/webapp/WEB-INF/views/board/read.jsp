<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@include file="../includes/header.jsp"%>

<div class="row">
	<div class="col-lg-12">
		<h1 class="page-header">Read</h1>
	</div>
	<!-- /.col-lg-12 -->
</div>

<div class="row">
	<div class="col-lg-12">
		<div class="panel panel-default">
			<div class="panel-heading">Board Read</div>
			<!-- /.panel-heading -->
			<div class="panel-body">

				
					<div class="form-group">
						<label>Title</label> <input class="form-control" name='title' value='<c:out value="${board.title}"></c:out>' readonly="readonly">
						<p class="help-block">Example block-level help text here.</p>
					</div>
					<div class="form-group">
						<label>Writer</label> <input class="form-control" name='writer' value='<c:out value="${board.writer}"></c:out>' readonly="readonly">
						<p class="help-block">Example block-level help text here.</p>
					</div>

					<div class="form-group">
						<label>Text area</label>
						<textarea class="form-control" name='content' rows="3" readonly="readonly"><c:out value="${board.content}" ></c:out></textarea>
					</div>

					<form role="form" action="/board/list" method="get">
						<input type='hidden' name='page' value="">
						<button type="submit" class="btn btn-default">go list</button>
					</form>
					<form role="form" action="/board/modify" method="get">
						<input type='hidden' name='page' value="">
						<input type='hidden' name='bno' value="${board.bno}">
						<button type="submit" class="btn btn-default">Modify</button>
					</form>
				

			</div>
			<!-- /.panel-body -->
		</div>
		<!-- /.panel -->
	</div>
	<!-- /.col-lg-6 -->




<%@include file="../includes/footer.jsp"%>



</body>

</html>







