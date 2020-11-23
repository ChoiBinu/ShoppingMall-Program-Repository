<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>

<h3>상품 등록</h3>
<form action="action/product_insert.jsp">
<table border = "1">
<tr>
   <td>
   <p> 카테고리 </p>
   </td>
   <td>
	<select name="category_id">
		<p>카테고리</p>
		<%
		try
		{  
			Class.forName("oracle.jdbc.driver.OracleDriver");
			Connection con=DriverManager.getConnection(  
			"jdbc:oracle:thin:@localhost:1521:xe","SMC_USER","SMC_USER");
			Statement stmt=con.createStatement();  
			
			String query = "SELECT ID, NAME FROM CATEGORY";
			
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
	<td><p>이름</p></td> 
	<td><input type="text" name="name"></td>
	</tr>
	
	<tr>
	<td><p>가격</p></td>
	<td><input type="number" name="price"></td>
	</tr>
	
	<tr>
	<td><p>재고</p></td> 
	<td><input type="number" name="stock"></td>
	</tr>
	
	<tr>
	<td><p>설명</p></td> 
	<td><input type="text" name="description"></td>
	</tr>
	
	<tr>
	<td><p>원산지</p></td> 
	<td><input type="text" name="origin"></td>
	</tr>
	
	<tr>
	<td>
	<input type="submit" value="제출">
	<input type="button" value="다시쓰기">
	</td>
	</tr>
	</table>
</form>