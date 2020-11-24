<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<h3>판매 등록</h3>

<form action="action/payment_insert.jsp">
<table border = "1">

	<%
		try
		{  
			Class.forName("oracle.jdbc.driver.OracleDriver");
			Connection con=DriverManager.getConnection(  
			"jdbc:oracle:thin:@localhost:1521:xe","SMC_USER","SMC_USER");
			Statement stmt=con.createStatement();  
			
			String price = " SELECT " +
						   " PRICE " +
						   " FROM " +
						   " PRODUCT "
						   ;
			
			ResultSet rs=stmt.executeQuery(price);
			con.close();  
		}
		
		catch(Exception e)
		{ 
			System.out.println(e);
		}  
		%>
		
	<tr>
	<td><p>주문날짜</p></td>
	<td><input type="text" name="date"></td>
	</tr>
	
	<tr>
	<td><p>주문상태</p></td> 
	<td><input type="text" name="status"></td>
	</tr>
	
	<tr>
	<td><p>주문개수</p></td> 
	<td><input type="number" name="count"></td>
	</tr>
	
	<tr>
	<td> <p> 상품명 </p> </td>
	<td>
	<select name="product_id">
	<%
		try
		{  
			Class.forName("oracle.jdbc.driver.OracleDriver");
			Connection con=DriverManager.getConnection(  
			"jdbc:oracle:thin:@localhost:1521:xe","SMC_USER","SMC_USER");
			Statement stmt=con.createStatement();  
			
			String query = " SELECT ID, NAME FROM PRODUCT ";
			
			ResultSet rs=stmt.executeQuery(query);
			while(rs.next()) {
				%><option value="<%=rs.getInt(1) %>"><%=rs.getString(2) %></option><%
			}

			con.close();  
		}
		
		catch(Exception e)
		{ 
			System.out.println(e);
		}  
		%>
	</select>
	</td>
	</tr>
	
	<tr>
	<td> <p> 유저명 </p> </td>
	<td>
	<select name = "member_id">
	<%
		try
		{  
			Class.forName("oracle.jdbc.driver.OracleDriver");
			Connection con=DriverManager.getConnection(  
			"jdbc:oracle:thin:@localhost:1521:xe","SMC_USER","SMC_USER");
			Statement stmt=con.createStatement();  
			
			String query = " SELECT ID, NAME FROM MEMBER ";
			
			ResultSet rs=stmt.executeQuery(query);
			while(rs.next()) {
				%><option value="<%=rs.getInt(1) %>"><%=rs.getString(2) %></option><%
			}

			con.close();  
		}
		
		catch(Exception e)
		{ 
			System.out.println(e);
		}  
		%>
	</select>
	</td>
	</tr>
	
	<tr>
	<td><p>주문지</p></td> 
	<td><input type="text" name="address"></td>
	</tr>
	
	<tr>
	<td>
	<input type="submit" value="제출">
	<input type="button" value="다시쓰기">
	</td>
	</tr>
	</table>
</form>