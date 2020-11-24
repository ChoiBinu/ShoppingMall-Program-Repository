<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<h3>카테고리별 판매 목록</h3>

<table border = "1">

	<tr>
		<td> 카테고리명 </td>
		<td> 판매액수 </td>
		<td> 판매개수 </td>
	</tr>
<%
    try
    {
        Class.forName("oracle.jdbc.driver.OracleDriver");
        Connection con=DriverManager.getConnection(
        "jdbc:oracle:thin:@localhost:1521:xe","SMC_USER","SMC_USER");
        Statement stmt=con.createStatement();

        String query = " SELECT " +
        			   " CATEGORY.NAME,SUM(PAYMENT_HISTORY.ORDER_PRICE),SUM(PAYMENT_HISTORY.ORDER_COUNT) " +
        			   " FROM " +
        			   " CATEGORY,PAYMENT_HISTORY " +
        			   " WHERE " +
        			   " PAYMENT_HISTORY.ID = CATEGORY.ID " +
        			   " GROUP BY " +
        			   " CATEGORY.NAME ";

        ResultSet rs=stmt.executeQuery(query);
        while(rs.next()) {
        	%>
        		<tr>
        			<td> <%=rs.getString(1) %> </td>
        			<td> <%=rs.getInt(2) %> </td>
        			<td> <%=rs.getInt(3) %> </td>
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