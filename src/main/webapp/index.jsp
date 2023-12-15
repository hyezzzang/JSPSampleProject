<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "db.dao.PersonInfoDAO" %>
<%@ page import = "db.dto.PersonInfoDTO" %>
<%@ page import = "java.util.List" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<%
		PersonInfoDAO personInfoDAO = new PersonInfoDAO();
	
		List<PersonInfoDTO> personList = personInfoDAO.findPersonInfoList();
	%>

	<%@ include file="navigation.jsp" %>  <!-- 네비게이션 안에잇는거 가져온다 -->

	<h1>index.jsp 페이지</h1>
	
	<a href="./addPerson.jsp">신규 인원 추가</a>
	
	<a href="./hobbyList.jsp">취미목록으로 이동</a>
	
	<hr/>
	
	<%
		for(PersonInfoDTO personInfo : personList){
			
	%>		
		<p> <%= personInfo.getId() %> <a href="./personInfo.jsp?id=<%= personInfo.getId() %>"><%=personInfo.getName() %></a> </p>
	<%	
		}
	
	%>
		

	
	

</body>
</html>