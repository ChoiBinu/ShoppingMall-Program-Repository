<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<% String a = "저는 스트링이라고 하는 변수입니다"; %>
	<a> A 는 무슨 글자일까요?? 정답은 : <%=a %></a>
	<br>
	<%
		for(int i=0;i<4;i++){
			for(int j=0;j<3-i;j++){
				%>&nbsp;&nbsp;<% 
			}
			for(int j=0;j<2*i+1;j++){
				%>*<% 
			}
			%><br><%
		}
		%><br><%
	%>
	
	<% 
		int A = 1;
		int B = 1;
		int TEMP=0;
		%><%= A%><% 
		%>&nbsp;<%
		for(;;){
			if(TEMP <= 100){
				TEMP = A + B;
				A = B;
				B = TEMP;
				%><%=A%><%
				%>&nbsp;<%
			}
			else {
				break;
			}
		}
		%><br> <br><%
	%>
	
	<table border="1">
	<%
		for(int i= 1 ; i < 10 ; i++){
			%><tr><%
				for(int j = 1 ; j < 10 ; j++){
					%><td>
						<%=j %>*<%=i %>=<%=i*j %> 
					</td><%
				}
		}
		%></tr><%
		%> <br> <%
	%>
	</table>
	
	<table border="1">
	<%
		for(int i = 1 ; i <= 5 ; i++) {
			%><tr><%
				for(int j = 1 ; j <= 5 ; j++) {
					%><td><%
						if(i >= j)  
							%>*<%
					%></td><%
				}
		}
				%></tr><%
				%> <br> <%
	%>
	</table>

	<table border="1">
	<%
		int count = 5;
		for(int i = 1 ; i <= 5 ; i++) {
			%><tr><%
				for(int j = 1 ; j <= 5 ; j++) {
					%><td><%
						if(j >= count)  
							%>*<%
					%></td><%
				} 
			count--;
		}
				%></tr><%
				%> <br> <%
	%>
	</table>
	
</body>
</html>