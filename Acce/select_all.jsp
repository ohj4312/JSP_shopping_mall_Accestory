<%@ page contentType="text/html; charset=EUC-KR" %> 
<%@ page language="java" import="java.sql.*" %> 
<%
 Connection con= null;
 Statement st =null;
 ResultSet rs =null;
 String a=null;

 try {
  Class.forName("org.gjt.mm.mysql.Driver");
 } catch (ClassNotFoundException e ) {
  out.println(e);
 }

 try{
  con = DriverManager.getConnection("jdbc:mysql://localhost:3306/member?useUnicode=true&characterEncoding=euckr","root","multi");
 } catch (SQLException e) {
  out.println(e);
 }

 try {
  st = con.createStatement();
  rs = st.executeQuery("select * from member order by userid");
%>
<html>
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">
<head>
<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">

	<link rel="stylesheet" type="text/css" href="css/mystyle.css">
	<title>Accesstory</title>
</head>
<body>
	
	<ul class="header_0">
	<li><a href="maypage.htm">마이페이지</a></li>
	<li><a href="insert.htm">회원가입</a></li>
	<li><a href="left_Frame.jsp">로그인</a></li>
	</ul>

	<div class="header" >
	<a href="main.htm">
	 <img src="images/logo.jpg" alt="로고" href="admin_main.htm">
	</a>
	</div>

<ul class="menu">
	<li><a href="product_write.htm">상품올리기</a></li>
	<li><a href="product_list.jsp">상품목록</a></li>
	<li><a href="select_all.jsp">회원관리</a></li>
	<li><a href="admin.jsp">관리자 모드</a></li>
	</ul>

<table width="500" border="1" bordercolorlight="#999999" bordercolordark="#FFFFFF" cellpadding="3" cellspacing="0" align="center" class=style2>
 <TH background="image/sky_bar.gif">사용자 ID</TH>
 <TH background="image/sky_bar.gif">이 름</TH>
 <TH background="image/sky_bar.gif">주 소</TH>
 <% if (!(rs.next()))  {%>
 <TR><TD colspan=4>등록된 회원이 없습니다.</TD></TR>
 <%  } else {
   do {
    out.println("<TR>");
    out.println("<TD align='center'>" + rs.getString("userid") + "</TD>");
    out.println("<TD align='center'>" + rs.getString("username") + "</TD>");
    out.println("<TD> " + rs.getString("address1"));
    out.println(rs.getString("address2")+"</TD>");          
    out.println("</TR>");
   }while(rs.next());
  }
  rs.close();
  st.close();
  con.close();
 } catch (SQLException e) {
  System.out.println(e);
 }
%>
</TABLE>
</CENTER> 
</BODY>
</HTML>