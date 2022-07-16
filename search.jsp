<%@page import="java.sql.*" %>
<%
     if(session.getAttribute("adminname")==(null))
                {
            response.sendRedirect("login.jsp");
            }
   
%>
        <%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Online Examination System :: Project created by Rinky</title>
    </head>
    <body background="images1.jpg">
        <table border="1" width="800" cellspacing="0" cellpadding="5" align="center" >
            <thead>
                <tr>
                    <th colspan="8"><img src="oe_logo.gif" width="153" height="56" alt="oe_logo"/><br><font color="navy" size="7" face="Georgia"><i>Online Examination System</i></font>
                    </th>
                </tr>
            </thead>
            <tbody>
                <tr>
                   <td align="center"><a href="admin.jsp">Admin</a></td>
                    <td align="center"><a href="signout.jsp">Log Out</a></td>
                    <td align="center"><a href="signup.jsp">Sign Up</a></td>
                    <td align="center"><a href="taketest.jsp">Take Exam</a></td>                    
                    <td align="center"><a href="feedback.jsp">Feedback</a></td>
                    <td align="center"><a href="contactus.jsp">Contact us</a></td>
                    
                    
                </tr>
                <tr>
                <td colspan="8">
                <form name="abc" method="post" action="search.jsp">
                <table border="0" cellspacing="2" cellpadding="5">
                    <thead>
                    <tr>
                    <th colspan="2"><font color="navy"> Search Question</font></th>
                    </tr>
                    </thead>
                    <tr>
                        <td><font color="navy"><b>Enter question</b></font></td>
                        <td>
                            <input type="text" name="ques">
                        </td>
                    <tr>
                        <td></td>
                          <td><input type="submit" value="Search" name="search" /></td>
                    </tr>
                         </table>
                        </form>
                   </td>
                 
                    </tr>
                    <tr>
                    <td colspan="7">
                        <form name="abc" method="get" action="http://www.google.com/search">
                            <font color="navy"> <b>Search on Internet </b><input type="text" name="q">
                            <input type="submit" name="submit" value="Search Google">
                            </font>
                        </form>
                    </td>
                </tr>
                <tr>
                    <td>
                        <%
                         if(request.getParameter("search")!=null)
                        {
                            String q=request.getParameter("ques");
                    ResultSet myresult;
            try
                {
                    Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
                    Connection con=DriverManager.getConnection("jdbc:odbc:Driver={Microsoft Access Driver (*.mdb)};DBQ=" + "d:/onlineexam_database1.mdb","","");

                    String b="select * from addques where ques like '%" + q + "%'" + "or ";
                    PreparedStatement mystatement1=con.prepareStatement(b);

                    

                    myresult=mystatement1.executeQuery();
                    while(myresult.next())
                    {
                        out.println(myresult.getString(3) + "<br>");
                        out.println(myresult.getString(4) + "<br>");
                        out.println(myresult.getString(5) + "<br>");
                        out.println(myresult.getString(6) + "<br>");
                        out.println(myresult.getString(7) + "<br>");
                    }

                    con.close();
                }
            catch(Exception e)
                {
                    out.println("Error occured" + e.getMessage());
                }
        }
                        
                        %>

                    </td>

                </tr>
                </table>          
    </body>
</html>
