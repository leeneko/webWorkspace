<%@page import="com.FileDTO"%>
<%@page import="com.FileDAO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<style>
   table{
      width:800px;
      height:1000px;
      text-align: center;
   
   }

</style>
</head>
<body>
   <%
      String num = request.getParameter("num");
      int cnum = Integer.parseInt(num);
      
      FileDAO dao = new FileDAO();
      FileDTO dto = dao.select(cnum);
   
   %>
   <table border="1px solid black" align="center">
      <tr>
         <td>����</td>
         <td><%=dto.getTitle() %></td>
         <td>�ۼ���</td>
         <td><%=dto.getWritter() %></td>      
      </tr>
      <tr>
         <td>����</td>
         <td colspan="3"><%=dto.getContent() %></td>
      </tr>
      <tr>
         <td colspan="4"><img alt="������ �����ϴ�." src="file/<%=dto.getFileName() %>"></td>
      
      </tr>
   </table>
</body>
</html>