<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="db.dao.HobbyDAO"%>
<%@ page import="db.dto.HobbyDTO"%>
<%@ page import="java.util.List"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@ include file="navigation.jsp" %>
	<%

	HobbyDAO hobbyDAO = new HobbyDAO();
	List<HobbyDTO> hobbyList = hobbyDAO.findThobbyList();
	
	
	%>

	<h1>취미 목록</h1>

	<a href="./index.jsp">메인페이지로</a>
	
	
	<table>
			<tr>
			<th>아이디</th>
			<th>순번</th>
			<th>취미</th>
			<th>선호도</th>
			</tr>
	
	<%	
		if(hobbyList != null){ 
		for(HobbyDTO hobby : hobbyList){
			
	%>		
			<tr>
			<td><%=hobby.getId() %></td>
			<td><%=hobby.getNo() %></td>
			<td><%=hobby.getHobby() %></td>
			<td><%=hobby.getPrefer() %></td>
			</tr>
	<%	
		}
	 }
	%>
	
</table>


</body>
</html>