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
	<li><a href="mypage.htm">마이페이지</a></li>
	<li><a href="insert.htm">회원가입</a></li>
	<li><a href="left_Frame.jsp">로그인</a></li>
	</ul>

	<div class="header" >
	<a href="main.htm">
	 <img src="images/logo.jpg" alt="로고" href="main.htm">
	</a>
	</div>

	<ul class="menu">
	<li><a href="shop_list.jsp?cat=11">베스트상품</a></li>
	<li><a href="shop_list.jsp?cat=22">목걸이</a></li>
	<li><a href="shop_list.jsp?cat=33">귀걸이</a></li>
	<li><a href="shop_list.jsp?cat=44">팔찌</a></li>
	<li><a href="freeboard_list.jsp">리뷰</a></li>
	<li><a href="Qfreeboard_list.jsp">Q&A</a></li>
<li><a href="admin.jsp">관리자 모드</a></li>
	</ul>


<script language="JavaScript">
<!-- 
 function login_check() {
  if (!document.login.userid.value) {
   alert("ID를 입력하세요!");
   document.login.userid.focus();	
   return;
  }  
  if (!document.login.password.value) {
   alert("패스워드를 입력하세요!");
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
  <p style="font-size:20px; font-weight:bold; margin-top: 50px; margin-bottom:20px; text-align:center;">로그인</p>
 <div style="text-align:center;">
     <p>ID</p>
   <input type="text" maxlength="12" name="userid" size='30' class="input_style1">
     <p>PASSWORD</p>
     <input type="password" maxlength="12" name="password" size='30' class="input_style1">
</div>

<div style="text-align:center;  margin-top: 35px;">
   <a href="javascript:login_check()" style="background-color: skyblue; padding: 10px;">로그인</a> &nbsp; <a href="insert.htm" target="_top" style="background-color: skyblue; padding: 10px;">회원가입</a></td>
</div>

	<div class="footer" style="margin-top:250px;">
	<p>
	홍성캠퍼스 : 32244 충남 홍성군 홍성읍 대학길 25 TEL.
	041-630-3114 FAX.041-634-8700<br>인천캠퍼스 : 22100 인천광역시 남구 숙골로 113 TEL. 032-770-8114
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
     <td width="4%" class="style2"><%=mem_name%> 님 <br>환영합니다.</td>
    </tr>
   </table>
   <table width="100%" border="0" cellspacing="0" cellpadding="0">
    <tr> 
     <td height="5"></td>
    </tr>
    
    <tr>
     <td align="center"><font  class="style2"><a href="product_write.htm" target="mainFrame">상품 등록하기</a></font></td>
     <td wdth="5">&nbsp;</td>
    </tr>
    <tr> 
     <td align="center"><font  class="style2"><a href="select_all.jsp" target="mainFrame">회원 목록보기</a></font></td>
     <td wdth="5">&nbsp;</td>
    </tr>
    <tr> 
     <td align="center"><font  class="style2"><a href="product_list.jsp" target="mainFrame">상품 보기/삭제</a></font></td>
     <td wdth="5">&nbsp;</td>
    </tr>
    <tr> 
     <td align="center"><font  class="style2"><a href="order_list.jsp" target="mainFrame">주문 내역 보기</a></font></td>
     <td wdth="5">&nbsp;</td>
    </tr>
    <tr> 
     <td align="center"><font  class="style2"><a href="logout.jsp">로그아웃</a></font></td>
     <td width="5">&nbsp;</td>
    </tr>
   </table>
<%}
else{ 
%>
 
<div style="text-align:center; margin-top: 50px; margin-bottom: 50px;"> 
<%=mem_name%> 님 오늘도 <p style="color: blue; font-weight:bold;">Accesstory</p>를 찾아주셔서 감사합니다!
</div>

<div style="text-align:center;">
<a href="main.htm" target="mainFrame" style="background-color: skyblue;">메인으로 가기</a>

<a href="shop_list.jsp" target="mainFrame" style="background-color: skyblue;">쇼핑하기</a>

<a href="sale_list.jsp" target="mainFrame" style="background-color: skyblue;">장바구니</a>

<a href="logout.jsp" style="background-color: pink;">로그아웃</a>
</div>

<%
 }
%>