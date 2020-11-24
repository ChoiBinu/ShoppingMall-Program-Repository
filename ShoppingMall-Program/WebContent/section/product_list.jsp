<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<h3>상품 목록</h3>
<table border="1">
<tr>
	<td> ID </td>
	<td> 카테고리 </td>
	<td> 제품명 </td>
	<td> 제품가격 </td>
	<td> 제품재고 </td>
	<td> 제품설명 </td>
	<td> 제품원산지 </td>
</tr>
<%
    try
    {
        Class.forName("oracle.jdbc.driver.OracleDriver");
        Connection con=DriverManager.getConnection(
        "jdbc:oracle:thin:@localhost:1521:xe","SMC_USER","SMC_USER");
        Statement stmt=con.createStatement();

        String query = " SELECT " +
        			   " PRODUCT.ID,CATEGORY.NAME,PRODUCT.NAME,PRODUCT.PRICE,PRODUCT.STOCK,PRODUCT.DESCRIPTION,PRODUCT.ORIGIN " +
        			   " FROM " +
        			   " PRODUCT,CATEGORY " +
        			   " WHERE " +
        			   " CATEGORY.ID = PRODUCT.CATEGORY_ID ";

        ResultSet rs=stmt.executeQuery(query);
        while(rs.next()) {
            %>
            	<tr>
            		<td> <%=rs.getInt(1) %> </td>
            		<td> <%=rs.getString(2) %> </td>
            		<td> <%=rs.getString(3) %> </td>
            		<td> <%=rs.getInt(4) %> </td>
            		<td> <%=rs.getInt(5) %> </td>
            		<td> <%=rs.getString(6) %> </td>
            		<td> <%=rs.getString(7) %> </td>
            	</tr>
            <%
        }
        con.close();
    }
    catch(Exception e)
    { 
        System.out.println(e);
    }
%>
</table>