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
	<%
try{
    //step1 load the driver class
    Class.forName("oracle.jdbc.driver.OracleDriver");

    //step2 create  the connection object
    Connection con=DriverManager.getConnection(
    "jdbc:oracle:thin:@localhost:1521:xe","SMC_USER","SMC_USER");

    //step3 create the statement object
    Statement stmt=con.createStatement();
    Statement stmt2=con.createStatement();

    //step4 execute query
    String query = "SELECT " +
    			   "PAYMENT_HISTORY.ID,PRODUCT.PRICE, PAYMENT_HISTORY.ORDER_COUNT " +
    			   "FROM " +
    			   "PRODUCT,PAYMENT_HISTORY " +
    			   "WHERE " +
    			   "PAYMENT_HISTORY.PRODUCT_ID = PRODUCT.ID ";
    
    ResultSet rs=stmt.executeQuery(query);
    while(rs.next()) {
    	int payment_history_id = rs.getInt(1);
    	int product_price = rs.getInt(2);
    	int order_count = rs.getInt(3);
    	String updatequery = "UPDATE PAYMENT_HISTORY SET " +
    						 "ORDER_PRICE = " + (product_price * order_count) +
    						 " WHERE ID = " + payment_history_id;
    	System.out.println(updatequery);
    	stmt2.executeQuery(updatequery);
    }
    System.out.println(rs.getInt(1));

    //step5 close the connection object
    con.commit();
    con.close();

    }catch(Exception e){ System.out.println(e);}
%>**
</body>
</html>