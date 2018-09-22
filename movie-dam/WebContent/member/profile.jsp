<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="moviedam.member.MemberDBBean" %>
<%@ page import="moviedam.member.MemberDataBean" %>

<%
	request.setCharacterEncoding("utf-8");
	String mem_userid = request.getParameter("mem_userid");
	
	try{
		MemberDBBean mem_db = MemberDBBean.getInstance(); 
		MemberDataBean profile =  mem_db.getProfile(mem_userid);

		String title = profile.getMem_nickname()+"님의 프로필";
%>

<jsp:include page="/module/header.jsp" flush="false">
	<jsp:param name="title" value="<%=title%>" />
</jsp:include>

<jsp:include page="/module/nav.jsp" flush="false" />

<div class="container">
	<div class="row">
		<div class="card bg-secondary mb-3" style="max-width: 20rem;">
  			<h3 class="card-header"><%=profile.getMem_nickname() %></h3>
    		<img style="height: 200px; width: 100%; display: block;" src="/movie-dam/assets/images/user_profile.png" alt="Card image cap">
  			<div class="card-body">
	    		<h4 class="card-title"></h4>
	    		<a href="./profile_follower.jsp?mem_userid=${sessionScope.userid }" class="card-link">팔로워 xx명</a>
    			<a href="./profile_following.jsp?mem_userid=${sessionScope.userid }" class="card-link">팔로잉 xx명</a>
	    		<a href="#" class="btn btn-info">팔로우</a>
			</div>
			<div class="card-footer text-muted">
    			최근 접속 시간 : 
  			</div>
			<div class="list-group list-group-flush">
				<a href="./profile.jsp?mem_userid=${sessionScope.userid }" class="list-group-item list-group-item-action active">기본 정보</a>
				<a href="#" class="list-group-item list-group-item-action">활동</a>
				<a href="./message_received.jsp?mem_userid=${sessionScope.userid }" class="list-group-item list-group-item-action">메시지</a>
				<a href="./profile_setting.jsp?mem_userid=${sessionScope.userid }" class="list-group-item list-group-item-action">설정</a>
			</div>
		</div>
  		<div class="col-lg-8">
  			<h3>
				기본 정보
				<small class="text-muted">Profile</small>
			</h3>
			<table class="table table-bordered">
				<tr>
					<th>아이디</th>
					<td><%=profile.getMem_userid() %></td>
    			</tr>
				<tr>
					<th>이메일</th>
					<td><%=profile.getMem_email() %></td>
    			</tr>
				<tr>
					<th>이름</th>
					<td><%=profile.getMem_name() %></td>
    			</tr>
				<tr>
					<th>생년월일</th>
					<td><%=profile.getMem_birth() %></td>
    			</tr>
				<tr>
					<th>성별</th>
					<td><%=profile.getMem_gender() %></td>
    			</tr>
				<tr>
					<th>닉네임</th>
					<td><%=profile.getMem_nickname() %></td>
    			</tr>
				<tr>
					<th>주소</th>
					<td><%=profile.getMem_address() %></td>
    			</tr>
				<tr>
					<th>가입일</th>
					<td><%=profile.getJoin_date() %></td>
    			</tr>
			</table>
  		</div>
	</div>
</div>

<%
	} catch(Exception e){
%>
	<script>
		alert('잘못된 접근입니다!');
		history.go(-1);
	</script>		
<%
	}
%>

<jsp:include page="/module/footer.jsp" flush="false" />

</body>
</html>