<%@ page contentType="text/html; charset=euc-kr" %> 
<%@ page language="java" import="java.sql.*,java.util.*,java.text.*" %> 
<% request.setCharacterEncoding("euc-kr"); %>
<HTML>
<HEAD><TITLE>Accesstory </TITLE>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" type="text/css" href="css/mystyle.css">
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">

</HEAD>
<BODY>
	
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

<FORM method=post name=search action="product_list.jsp">
<TABLE border=0 width=95%>
 <TR>
  <TD align=right>
   <FONT size=-1>��ǰ������ ã��</FONT>
   <INPUT type=text name=pname>
   <INPUT type=submit value="�˻�">
  </TD>
 </TR>
 <TR>
  <TH>
   <FONT size=-1>
<form method="post" name="search" action="product_list.jsp">
<ul class="menu">
	<li><a href="product_write.htm">��ǰ�ø���</a></li>
	<li><a href="product_list.jsp">��ǰ���</a></li>
	<li><a href="select_all.jsp">ȸ������</a></li>
	<li><a href="admin.jsp">������ ���</a></li>
	</ul>
	</ul>
</form>	

   </FONT>
  </TH>
 </TR>
</TABLE>
</FORM>

<CENTER>
<TABLE border=0 width=95% cellpadding=4 cellspacing=4 style="font-size:10pt">
 <TR>
  <TH width=5% bgcolor=#DFEDFF>
   <FONT color=black face=����>
    <NOBR>��ȣ</NOBR>
   </FONT>
  </TH>
  <TH width=25% bgcolor=#DFEDFF>
   <FONT color=black face=����>
    <NOBR>��ǰ��</NOBR>
   </FONT>
  </TH>
  <TH width=10% bgcolor=#DFEDFF>
   <FONT color=black face=����>
    <NOBR>�ڵ��ȣ</NOBR>
   </FONT>
  </TH>
  <TH width=15% bgcolor=#DFEDFF>
   <FONT color=black face=����>
    <NOBR>������</NOBR>
   </FONT>
  </TH>
  <TH width=10% bgcolor=#DFEDFF>
   <FONT color=black face=����>
    <NOBR>�ǸŽ�����</NOBR>
   </FONT>
  </TH>
  <TH width=10% bgcolor=#DFEDFF>
   <FONT color=black face=����>
    <NOBR>�ǸŰ�(��)</NOBR>
   </FONT>
  </TH>
  <TH width=10% bgcolor=#DFEDFF>
   <FONT color=black face=����>
    <NOBR>���</NOBR>
   </FONT>
  </TH>
  <TH width=15% bgcolor=#DFEDFF>
   <FONT color=black face=����>
    <NOBR>�з�</NOBR>
   </FONT>
  </TH>
 </TR>
<% 
 String cond="";
 String ca="";
 String pn="";
 
 if (request.getParameter("cat") != null) {
  if( !(request.getParameter("cat").equals("")) ) {
   ca=request.getParameter("cat");
   cond= " where category = '"+ ca+"'";
  }
 }
 
 if (request.getParameter("pname") != null) {
  if ( !(request.getParameter("pname").equals("")) ) {
   pn=request.getParameter("pname");
   cond= " where pname like '%"+ pn+"%'";
  }
 }
 
 Vector pname=new Vector();
 Vector sname=new Vector();
 Vector keyid=new Vector();
 Vector cat=new Vector();
 Vector dprice=new Vector();
 Vector inputdate=new Vector();
 Vector stock=new Vector();
 String category=null;
 
 long id=0;
 
 NumberFormat nf = NumberFormat.getInstance();
 String downprice=null; 
 
 int where=1;
 int totalgroup=0;
 int maxpages=2;
 int startpage=1;
 int endpage=startpage+maxpages-1;
 int wheregroup=1;
 if (request.getParameter("go") != null) {
  where = Integer.parseInt(request.getParameter("go"));
  wheregroup = (where-1)/maxpages + 1;
  startpage=(wheregroup-1) * maxpages+1;  
  endpage=startpage+maxpages-1; 
 } else if (request.getParameter("gogroup") != null) {
  wheregroup = Integer.parseInt(request.getParameter("gogroup"));
  startpage=(wheregroup-1) * maxpages+1;  
  where = startpage ; 
  endpage=startpage+maxpages-1; 
 }
 int nextgroup=wheregroup+1;
 int priorgroup= wheregroup-1;
 
 int startrow=0;
 int endrow=0;
 int maxrows=5;
 int totalrows=0;
 int totalpages=0;
 Connection con= null;
 Statement st =null;
 ResultSet rs =null;
 
 try {
  Class.forName("org.gjt.mm.mysql.Driver");
 } catch (ClassNotFoundException e ) {
  out.println(e);
 }
 
 try{
  con = DriverManager.getConnection("jdbc:mysql://localhost:3306/shop?useUnicode=true&characterEncoding=euckr","root","multi");
 } catch (SQLException e) {
  out.println(e);
 }
 
 try {
  st = con.createStatement();
  String sql = "select * from product";
  sql = sql+ cond+  " order by id";
  rs = st.executeQuery(sql);
  if (!(rs.next()))  {
   out.println("��ǰ�� �����ϴ�");
  } else {
   do {
    keyid.addElement(new Long(rs.getLong("id")));
    cat.addElement(rs.getString("category"));
    pname.addElement(rs.getString("pname"));
    sname.addElement(rs.getString("sname"));
    dprice.addElement(new Integer(rs.getInt("downprice")));
    String idate = rs.getString("inputdate");
    idate = idate.substring(0,8);
    inputdate.addElement(idate);
    stock.addElement(new Integer(rs.getInt("stock")));
   }while(rs.next());

   totalrows = pname.size();
   totalpages = (totalrows-1)/maxrows +1;
   startrow = (where-1) * maxrows;
   endrow = startrow+maxrows-1  ;
   if (endrow >= totalrows)
    endrow=totalrows-1;
   totalgroup = (totalpages-1)/maxpages +1;
   if (endpage > totalpages) 
    endpage=totalpages;
   for(int j=startrow;j<=endrow;j++) {
    id= ( (Long)keyid.elementAt(j) ).longValue();
    downprice=nf.format( ((Integer)dprice.elementAt(j)).intValue() ); 
    switch ( Integer.parseInt((String)cat.elementAt(j)) ) {
     case 11:  
      category="��ǰ�ø���";
      break;
     case 22:  
      category="��ǰ���";
      break;
     case 33:  
      category="ȸ������";
      break;
     case 44:  
      category="������ ���";
      break;

     default:
      break;
    }
    
    out.println("<TR>");
    out.println("<TH width=5%  bgcolor=#eeeeee>");
    out.println(j+1+"</TH>");
    out.println("<TD width=25% bgcolor=#eeeeee>");
    out.print("<A href=\"product_read.jsp?id="+id + "&go=" + where);
    out.print("&cat="+ca+"&pname="+pn+"\">"+pname.elementAt(j));  
    out.println("</A></TD>");
    out.println("<TD  width=10% bgcolor=#eeeeee>");
    out.println(id + "</TD>");
    out.println("<TD width=15% bgcolor=#eeeeee>");
    out.println(sname.elementAt(j) + "</TD>");
    out.println("<TD width=10% bgcolor=#eeeeee>");
    out.println(inputdate.elementAt(j)+ "</TD>");
    out.println("<TD width=10% bgcolor=#eeeeee align=right>");
    out.println(downprice+ "</TD>");
    out.println("<TD width=10% bgcolor=#eeeeee align=right>");
    out.println(stock.elementAt(j) + "</TD>");
    out.println("<TD width=15% bgcolor=#eeeeee>");
    out.println(category + "</TD>");
    out.println("</TR>"); 
   }
   rs.close();    
  }
  out.println("</TABLE>");
  st.close();
  con.close();
 } catch (SQLException e) {
  out.println(e);
 } 

 if (wheregroup > 1) {
  out.print("[<A href=\"product_list.jsp?gogroup=1"); 
  out.print("&cat="+ca+"&pname="+pn+"\">ó��</A>]");
  out.print("[<A href=\"product_list.jsp?gogroup="+priorgroup);
  out.print("&cat="+ca+"&pname="+pn+ "\">����</A>]");
 } else {
  out.println("[ó��]") ;
  out.println("[����]") ;
 }
 
 if (totalrows !=0) {  
  for(int jj=startpage; jj<=endpage; jj++) {
   if (jj==where) 
    out.println("["+jj+"]") ;
   else {
    out.print("[<A href=\"product_list.jsp?go="+jj) ;
    out.print("&cat="+ca+"&pname="+pn+"\">"+jj + "</A>]") ;
   }
  } 
 }
 if (wheregroup < totalgroup) {
  out.print("[<A href=\"product_list.jsp?gogroup="+ nextgroup);
  out.print("&cat="+ca+"&pname="+pn+"\">����</A>]");
  out.print("[<A href=\"product_list.jsp?gogroup="+ totalgroup);
  out.print("&cat="+ca+"&pname="+pn+"\">������</A>]");
 } else {
  out.println("[����]");
  out.println("[������]");
 }
 out.println ("��ü��ǰ�� :"+totalrows); 
%>
</BODY>
</HTML>