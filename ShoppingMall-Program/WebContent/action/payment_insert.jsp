<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>

<%
String date = request.getParameter("date");
String status = request.getParameter("status");
int count = Integer.parseInt(request.getParameter("count"));
int product_id = Integer.parseInt(request.getParameter("product_id"));
int member_id = Integer.parseInt(request.getParameter("member_id"));
String address = request.getParameter("address");
int price = Integer.parseInt(request.getParameter("price"));

String insert_query = "INSERT INTO PAYMENT_HISTORY(date, status, count, price, product_id, member_id, address) " +
			   		   "VALUES(SEQ_PAYMENT_HISTORY.NEXTVAL, '%s', '%s', %d, %d, %d, %d, '%s')";
String select_query = "SELECT PRICE FROM PRODUCT WHERE ID = " + product_id;
try
{  
	Class.forName("oracle.jdbc.driver.OracleDriver");  
	Connection con=DriverManager.getConnection(  
	"jdbc:oracle:thin:@localhost:1521:xe","SMC_USER","SMC_USER");  
	Statement stmt=con.createStatement();
	
	ResultSet rs = stmt.executeQuery(select_query);
	rs.next();
	int product_price = rs.getInt("PRICE");

	stmt.executeQuery(String.format(insert_query,date, status, count, count*price, product_id, member_id, address));

	con.commit();
	con.close();
}
catch(Exception e)
{ 
	System.out.println(e);
}  
%>