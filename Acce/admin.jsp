<%@ page contentType="text/html; charset=EUC-KR" %> 
<%@ page language="java" import="java.sql.*" %> 
<%
 String admPwd = "1234";
 String password = request.getParameter("password");
 if (admPwd.equals(password))
  response.sendRedirect(response.encodeRedirectURL("admin_main.htm"));
 else {
%>
<script>alert("�����ڸ� ������ ���� �մϴ�."); 
</script>
<html>
<head>
<title>�츮 ȸ�� ��������</title>
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">
<link rel="StyleSheet" href="style.css" type="text/css">
</head>
<body>
 <table width="500" border="1" bordercolorlight="#999999" bordercolordark="#FFFFFF" cellpadding="3" cellspacing="0" align="center" class="style2">
  <TH background="image/sky_bar.gif">������ ����</TH>
  <tr>
   <td align="center">
    <FORM  name=form1 method=post action="admin.jsp"> 
     <BR> ������ PASSWORD   : 
     <INPUT type=password name=password>  
     <p>
     <INPUT type=submit  name=change value="Ȯ��" > &nbsp;
     <INPUT type="button" value="��   ��"  onClick="javascript:history.go(-1);">
    </FORM>
   </td>
  </tr>
 </table>
</body>
</html> 
<% }%>