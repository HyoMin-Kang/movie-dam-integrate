<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	String title = "로그인";
%>
<%
	Cookie[] cookies = request.getCookies();
	String userid = "";
	if (cookies != null) { //쿠키가 존재하면
		for (int i=0; i<cookies.length; i++) {
			if ( cookies[i].getName().equals("userid")) {
				userid = cookies[i].getValue(); //찾은 쿠키값 가져오기
			}
		}
	}
%>

<jsp:include page="/module/header.jsp" flush="false">
	<jsp:param name="title" value="<%=title %>"/>
</jsp:include>

<jsp:include page="/module/nav.jsp" flush="false"/>

<div class="container">
	<h3>
		<%=title %>
		<small class="text-muted">Log In</small>
	</h3>
	
	<div class="row">
		<form name="loginForm" method="post" action="login_pro.jsp">
			<div class="form-group col">
				<label for="inputUserId">아이디</label>
				<input type="text" class="form-control" id="inputUserId" name="mem_userid" placeholder="User id" required="required" value="<%=userid %>">
			</div>
			<div class="form-group col">
      			<label for="inputPassword">비밀번호</label>
				<input type="password" class="form-control" id="inputPassword" name="mem_pwd" placeholder="Password" required="required">
   			</div>
   			<div class="custom-control custom-checkbox">
		      	<input type="checkbox" class="custom-control-input" id="idCheck" name="saveId"<% if(userid.isEmpty()==false) out.print(" checked=\"checked\"");%>>
		      	<label class="custom-control-label" for="idCheck">아이디 기억하기</label>
		    </div>
			<div class="form-group col">
				<button type="submit" class="btn btn-dark btn-block">로그인</button>
				<button type="button" class="btn btn-outline-dark btn-block" onclick="history.go(-1);">이전 화면으로 돌아가기</button>
			</div>
			<a href="signup_form.jsp" target="_blank">회원 가입하기</a>
		</form>
	</div>
	
</div>

<jsp:include page="/module/footer.jsp" flush="false"/>

</body>
</html>