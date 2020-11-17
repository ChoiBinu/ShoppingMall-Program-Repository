<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
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
		%><br><%
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
				%><br><%
	%>
	</table>
	<br>

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
	%>
	</table>
	<br>
	<%
		%><table border = "1"><%
		int first_Num = 0;
		int second_Num = 1;
		int sum_Num=0;
		int count_Num=1;
		for(;;){
			if(count_Num <= 11){
				for(int i = 1; i<=3; i ++){
				sum_Num = first_Num + second_Num;
				first_Num = second_Num;
				second_Num = sum_Num;
				%>
				<td>
				<%=first_Num%>
				</td>
				<%
				}
				count_Num++;
			}
			else {
				break;
			}
			%></tr><%
		}
		%></table><%
		%><br> <br><%	
	%>
	
	<%
	
try{
    //step1 load the driver class
    Class.forName("oracle.jdbc.driver.OracleDriver");

    //step2 create  the connection object
    Connection con=DriverManager.getConnection(
    "jdbc:oracle:thin:@localhost:1521:xe","SMC_USER","SMC_USER");

    //step3 create the statement object
    Statement stmt=con.createStatement();

    //step4 execute query
    String query = "SELECT " +
    			   "PRODUCT.ID,PRODUCT.CATEGORY_ID,PRODUCT.NAME,PRODUCT.PRICE,PRODUCT.STOCK,PRODUCT.DESCRIPTION,PRODUCT.ORIGIN,CATEGORY.ID,CATEGORY.NAME " +
    			   "FROM " +
    			   "PRODUCT,CATEGORY " +
    			   "WHERE " +
    			   "CATEGORY.ID = PRODUCT.CATEGORY_ID ";
    ResultSet rs=stmt.executeQuery(query);
    %><table border = "1"><%
    %><tr><%
    %><td> PRODUCT_ID</td><%
    %><td> CATEGORY_NAME </td><%
    %><td> PRODUCT_NAME </td><%
    %><td> PRODUCT_PRICE </td><%
    %><td> PRODUCT_STOCK </td><%
    %><td> PRODUCT_DESCRIPTION </td><%
    %><td> PRODUCT_ORIGIN </td><%
    %></tr><%
    while(rs.next()) {
    %><tr><%
    %><td> <%= rs.getInt(1)%> </td><%
   	%><td> <%= rs.getString(9)%> </td><%
   	%><td> <%= rs.getString(3)%> </td><%
   	%><td> <%= rs.getInt(4)%> </td><%
   	%><td> <%= rs.getInt(5)%> </td><%
   	%><td> <%= rs.getString(6)%> </td><%
   	%><td> <%= rs.getString(7)%> </td><%
    %></tr><%
    }
    
    //System.out.println(rs.getInt("ID") 
    		//+ "," + 
    		//rs.getInt("CATEGORY_ID") 
    		//+ "," + 
    		//rs.getString("NAME") 
    		//+ "," + 
    		//rs.getInt("PRICE") 
    		//+ "," + 
    		//rs.getInt("STOCK") 
    		//+ "," + 
    		//rs.getString("DESCRIPTION") 
    		//+ "," + 
    		//rs.getString("ORIGIN"));
    //step5 close the connection object
    %></table><%
    con.close();
    }catch(Exception e){ System.out.println(e);}
%>
</body>
</html>