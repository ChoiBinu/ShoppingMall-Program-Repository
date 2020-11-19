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

<table border = "1">
<tr>
    <td>핸드폰번호</td>
    <td>이메일</td>
    <td>이름</td>
    <td>구매금액</td>
    <td>구매 상품 ID</td>
    <td>구매 개수</td>
</tr>
<%
String phone_number = request.getParameter("phone_number");
String email = request.getParameter("email");

try
{
    Class.forName("oracle.jdbc.driver.OracleDriver");
    Connection con=DriverManager.getConnection(
    "jdbc:oracle:thin:@localhost:1521:xe","SMC_USER","SMC_USER");
    Statement stmt=con.createStatement();
    String query = " SELECT "
    			  +" MEMBER.EMAIL,MEMBER.PHONE,MEMBER.NAME,PAYMENT_HISTORY.ORDER_PRICE,PAYMENT_HISTORY.PRODUCT_ID,PAYMENT_HISTORY.ORDER_COUNT "
            	  +" FROM " 
            	  +" MEMBER,PAYMENT_HISTORY "
            	  +" WHERE "
            	  +" MEMBER.ID = PAYMENT_HISTORY.MEMBER_ID ";
    
    if(phone_number != null) {
    	query += " AND MEMBER.PHONE like '%" + phone_number + "'";
    }
   	
    if(email != null) {
    	query += " AND MEMBER.EMAIL like '%" + email + "%'";
    }
    
    %> <%=query%> <%

    ResultSet rs=stmt.executeQuery(query);
    while(rs.next()) {
        %><tr><%
            %><td><%=rs.getString("PHONE")%></td><%
            %><td><%=rs.getString("EMAIL")%></td><%
            %><td><%=rs.getString("NAME")%></td><%
            %><td><%=rs.getInt("ORDER_PRICE")%></td><%
            %><td><%=rs.getInt("PRODUCT_ID")%></td><%
            %><td><%=rs.getInt("ORDER_COUNT")%></td><%
        %><tr><%
    }

    con.commit();
    con.close();

}
catch(Exception e)
{ 
    System.out.println(e);
}
%>
</table>

<p>전화번호 뒷 4자리를 입력하여 주세요</p>
<input type="text" id="phone_number">
<p>찾으실 이메일을 입력하여 주세요</p>
<input type="text" id="email">
<input type="button" onclick="click_search()" VALUE="SEARCH">
<script>
    function click_search() {
        const email = document.getElementById("email").value;
        const phone_number = document.getElementById("phone_number").value;

        redirect_with_get_params(phone_number,email);
    }
    
    function redirect_with_get_params(phone_number, email) {
        window.location.href = 'parameter_queryQ1.jsp?phone_number=' + phone_number + '&email=' + email
    }
</script>
</body>
</html>