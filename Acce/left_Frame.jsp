<%@ page info="left_Frame" errorPage="error.jsp" %>
<%@ page contentType="text/html; charset=euc-kr" %> 
<% request.setCharacterEncoding("euc-kr"); %>
<%
 Object mem_name  = session.getAttribute("member_name"); 
 Object mem_id = session.getAttribute("member_id"); 
 session.setAttribute("member_id",mem_id);
 if(session.getValue("member_id")==null) {   
%>
<link rel="StyleSheet" href="mystyle.css" type="text/css">
 <head>
 	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">

	<link rel="stylesheet" type="text/css" href="css/mystyle.css">
	<title>Accesstory</title>

 </head>	

<ul class="header_0">
	<li><a href="mypage.htm">����������</a></li>
	<li><a href="insert.htm">ȸ������</a></li>
	<li><a href="left_Frame.jsp">�α���</a></li>
	</ul>

	<div class="header" >
	<a href="main.htm">
	 <img src="images/logo.jpg" alt="�ΰ�" href="main.htm">
	</a>
	</div>

	<ul class="menu">
	<li><a href="shop_list.jsp?cat=11">����Ʈ��ǰ</a></li>
	<li><a href="shop_list.jsp?cat=22">�����</a></li>
	<li><a href="shop_list.jsp?cat=33">�Ͱ���</a></li>
	<li><a href="shop_list.jsp?cat=44">����</a></li>
	<li><a href="freeboard_list.jsp">����</a></li>
	<li><a href="Qfreeboard_list.jsp">Q&A</a></li>
<li><a href="admin.jsp">������ ���</a></li>
	</ul>


<script language="JavaScript">
<!-- 
 function login_check() {
  if (!document.login.userid.value) {
   alert("ID�� �Է��ϼ���!");
   document.login.userid.focus();	
   return;
  }  
  if (!document.login.password.value) {
   alert("�н����带 �Է��ϼ���!");
   document.login.password.focus();	
   return;
  }
  document.login.submit();
 }
//-->


</script>
<style type="text/css">
<!--
 .style3 {color: #FF0000}
-->



</style>

<form name ="login" method="post" action="login_process.jsp">    
  <p style="font-size:20px; font-weight:bold; margin-top: 50px; margin-bottom:20px; text-align:center;">�α���</p>
 <div style="text-align:center;">
     <p>ID</p>
   <input type="text" maxlength="12" name="userid" size='30' class="input_style1">
     <p>PASSWORD</p>
     <input type="password" maxlength="12" name="password" size='30' class="input_style1">
</div>

<div style="text-align:center;  margin-top: 35px;">
   <a href="javascript:login_check()" style="background-color: skyblue; padding: 10px;">�α���</a> &nbsp; <a href="insert.htm" target="_top" style="background-color: skyblue; padding: 10px;">ȸ������</a></td>
</div>

	<div class="footer" style="margin-top:250px;">
	<p>
	ȫ��ķ�۽� : 32244 �泲 ȫ���� ȫ���� ���б� 25 TEL.
	041-630-3114 FAX.041-634-8700<br>��õķ�۽� : 22100 ��õ������ ���� ����� 113 TEL. 032-770-8114
	<br>COPYRIGHT(C) 2013 BY  CHUNGWOON UNIVERSITY. ALL RIGHTS RESERVED.
	</p>
	</div>
</form>
<% } 
else if(mem_id.equals("admin")){ 
%>
<link rel="stylesheet" href="style.css" type="text/css">
 <tr> 
  <td height="90" bgcolor='#F5F5F5'> 
   <table width="100%" border="0" cellspacing="0" cellpadding="0">
    <tr align="center"> 
     <td width="4%" class="style2"><%=mem_name%> �� <br>ȯ���մϴ�.</td>
    </tr>
   </table>
   <table width="100%" border="0" cellspacing="0" cellpadding="0">
    <tr> 
     <td height="5"></td>
    </tr>
    
    <tr>
     <td align="center"><font  class="style2"><a href="product_write.htm" target="mainFrame">��ǰ ����ϱ�</a></font></td>
     <td wdth="5">&nbsp;</td>
    </tr>
    <tr> 
     <td align="center"><font  class="style2"><a href="select_all.jsp" target="mainFrame">ȸ�� ��Ϻ���</a></font></td>
     <td wdth="5">&nbsp;</td>
    </tr>
    <tr> 
     <td align="center"><font  class="style2"><a href="product_list.jsp" target="mainFrame">��ǰ ����/����</a></font></td>
     <td wdth="5">&nbsp;</td>
    </tr>
    <tr> 
     <td align="center"><font  class="style2"><a href="order_list.jsp" target="mainFrame">�ֹ� ���� ����</a></font></td>
     <td wdth="5">&nbsp;</td>
    </tr>
    <tr> 
     <td align="center"><font  class="style2"><a href="logout.jsp">�α׾ƿ�</a></font></td>
     <td width="5">&nbsp;</td>
    </tr>
   </table>
<%}
else{ 
%>
 
<div style="text-align:center; margin-top: 50px; margin-bottom: 50px;"> 
<%=mem_name%> �� ���õ� <p style="color: blue; font-weight:bold;">Accesstory</p>�� ã���ּż� �����մϴ�!
</div>

<div style="text-align:center;">
<a href="main.htm" target="mainFrame" style="background-color: skyblue;">�������� ����</a>

<a href="shop_list.jsp" target="mainFrame" style="background-color: skyblue;">�����ϱ�</a>

<a href="sale_list.jsp" target="mainFrame" style="background-color: skyblue;">��ٱ���</a>

<a href="logout.jsp" style="background-color: pink;">�α׾ƿ�</a>
</div>

<%
 }
%>