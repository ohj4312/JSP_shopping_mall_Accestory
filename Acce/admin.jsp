<%@ page contentType="text/html; charset=EUC-KR" %> 
<%@ page language="java" import="java.sql.*" %> 
<%
 String admPwd = "1234";
 String password = request.getParameter("password");
 if (admPwd.equals(password))
  response.sendRedirect(response.encodeRedirectURL("admin_main.htm"));
 else {
%>
<script>alert("관리자만 접근이 가능 합니다."); 
</script>
<html>
<head>
<title>우리 회원 정보관리</title>
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">
<link rel="StyleSheet" href="style.css" type="text/css">
</head>
<body>
 <table width="500" border="1" bordercolorlight="#999999" bordercolordark="#FFFFFF" cellpadding="3" cellspacing="0" align="center" class="style2">
  <TH background="image/sky_bar.gif">관리자 승인</TH>
  <tr>
   <td align="center">
    <FORM  name=form1 method=post action="admin.jsp"> 
     <BR> 관리자 PASSWORD   : 
     <INPUT type=password name=password>  
     <p>
     <INPUT type=submit  name=change value="확인" > &nbsp;
     <INPUT type="button" value="취   소"  onClick="javascript:history.go(-1);">
    </FORM>
   </td>
  </tr>
 </table>
</body>
</html> 
<% }%>