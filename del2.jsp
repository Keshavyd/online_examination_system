<%@page import="java.sql.*" %>
<%
     Integer s=Integer.parseInt(request.getParameter("id"));
     try
     {
         Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
         Connection con=DriverManager.getConnection("jdbc:odbc:Driver={Microsoft Access Driver (*.mdb)};DBQ=" + "d:/onlineexam_database1.mdb","","");
         String b="delete from addques where srno=?";
         PreparedStatement mystatement=con.prepareStatement(b);
         mystatement.setInt(1,s);
         mystatement.execute();
         mystatement.close();
         con.close();
         Object x=session.getAttribute("catid");
         response.sendRedirect("del.jsp?category=" + x);
     }
     catch(Exception e)
     {
        out.println("Error occured" + e.getMessage());
     }
%>