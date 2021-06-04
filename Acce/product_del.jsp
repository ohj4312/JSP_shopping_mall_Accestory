<%@ page contentType="text/html; charset=euc-kr" %> 
<%@ page language="java" import="java.sql.*,java.util.*,java.text.*" %> 
<% request.setCharacterEncoding("euc-kr"); %>
<%
Connection conn= null;
Statement st = null;  
String id= request.getParameter("id");
int cnt=0;
 
try {
    Class.forName("org.gjt.mm.mysql.Driver");
    } catch (ClassNotFoundException e ) {
      out.println(e);
    }
 
try{
   conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/shop?useUnicode=true&characterEncoding=euckr","root","multi");
   } catch (SQLException e) {
   out.println(e);
   }
 
try {
   st = conn.createStatement();
   String sql = "delete from product where id='"+id+"'";
   cnt = st.executeUpdate(sql); 
   if (cnt >0) 
     out.println("정상적으로 삭제되었습니다.");
    else
     out.println("삭제되지 않았습니다.");
  out.println("</TABLE>");
  st.close();
  conn.close();
 } catch (SQLException e) {
  out.println(e);
 } 
%>
<br>

</BODY>
</HTML>
