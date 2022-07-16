<%@page import="java.sql.*" %>
<%
            String ques,op1,op2,op3,op4,ans;
            Object srno=0;
            ques=request.getParameter("ques");
            op1=request.getParameter("first");
            op2=request.getParameter("second");
            op3=request.getParameter("third");
            op4=request.getParameter("four");
            ans=request.getParameter("ans");
            srno=session.getAttribute("srno1");
            try
                {
                    Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
                    Connection con=DriverManager.getConnection("jdbc:odbc:Driver={Microsoft Access Driver (*.mdb)};DBQ=" + "d:/onlineexam_database1.mdb","","");
                    String b="update addques set ques=?,op1=?,op2=?,op3=?,op4=?,ans=? where srno=?";
                    PreparedStatement mystatement=con.prepareStatement(b);
                    mystatement.setString(1,ques);
                    mystatement.setString(2, op1);
                    mystatement.setString(3, op2);
                    mystatement.setString(4, op3);
                    mystatement.setString(5,op4);
                    mystatement.setString(6,ans);
                    mystatement.setObject(7, srno);
                    mystatement.executeUpdate();                   
                    con.close();
                }
            catch(Exception e)
                {
                    out.println("Error occured " + e.getMessage());
                }



%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Welcome to Online Examination System :: Project created by Rinky</title>
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
                        <font color="navy">
                         <h1>Record updated successfully</h1>
                        </font>
                        <img src="exam1.jpg" align="right" width="200" height="250">
                    </td>
                </tr>
                <tr>
                    <td colspan="8">
                        <form name="abc" method="get" action="http://www.google.com/search">
                            Enter search terms <input type="text" name="q">
                            <input type="submit" type="submit" value="Search Google">
                        </form>
                    </td>
                </tr>
            </tbody>
        </table>
    </body>
</html>
