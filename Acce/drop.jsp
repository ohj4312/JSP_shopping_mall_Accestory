<%@ page contentType="text/html; charset=euc-kr" %> 
<%@ page language="java" import="java.sql.*" %> 
<%
String id = request.getParameter("id");
Connection con=null;
Statement st=null;    
String sql=null;

// jdbc-odbc driver 등록
try {
   Class.forName("org.gjt.mm.mysql.Driver");
   } catch (ClassNotFoundException e){
     out.println(e.getMessage());
   }
// db와의 연결
try {
   con = DriverManager.getConnection("jdbc:mysql://localhost:3306/shop?useUnicode=true&characterEncoding=euckr","root","multi");
    
   // Statement 객체 생성
   st = con.createStatement();
   sql = "delete from product where id= '" + id + "'";
   st.executeUpdate(sql);

   con.close();
   st.close();  
   } catch (SQLException e) {
   }
 %>
<jsp:forward page="product_list.jsp" />