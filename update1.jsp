<%@page import="java.sql.*" %>
<%
           if(session.getAttribute("adminname")==(null))
            {
                response.sendRedirect("login.jsp");
            }
            String ques="",op1="",op2="",op3="",op4="",ans="";
            int srno=0;
            srno=Integer.parseInt(request.getParameter("id"));
            session.setAttribute("srno1", srno);
            try
            {
                    ResultSet myresult;

                    Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
                    Connection con=DriverManager.getConnection("jdbc:odbc:Driver={Microsoft Access Driver (*.mdb)};DBQ=" + "d:/onlineexam_database1.mdb","","");
                    String b="select * from addques where srno=?";
                    PreparedStatement mystatement=con.prepareStatement(b);
                    mystatement.setInt(1, srno);
                    myresult=mystatement.executeQuery();
                    while(myresult.next())
                        {
                            ques=myresult.getString("ques");
                            op1=myresult.getString("op1");
                            op2=myresult.getString("op2");
                            op3=myresult.getString("op3");
                            op4=myresult.getString("op4");
                            ans=myresult.getString("ans");

                        }

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
        <title>Online Examination System :: Project created by Rinky</title>
    </head>
    <body background="images.jpg">
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
                <form name="abc" method="post" action="update3.jsp">
                <table border="0" cellspacing="2" cellpadding="5">
                    <thead>
                    <tr>
                    <th colspan="2"><font color="navy"> Update Question</font></th>
                    </tr>
                    </thead>                                      
                    <tr>
                        <td><font color="navy"><b>Question</b></font></td>
                        <td><input type="text" name="ques"  size="70" value="<%=ques%>"></td>
                    </tr>
                    <tr>
                        <td><font color="navy"><b>Options</b></font></td>
                        <td></td>
                    </tr>
                    <tr>
                        <td><font color="navy"><b>1.</b></font></td>
                        <td><input type="text" name="first" value="<%=op1%>" size="70" /></td>
                    </tr>
                    <tr>
                        <td><font color="navy"><b>2.</b></font></td>
                        <td><input type="text" name="second" value="<%=op2%>" size="70"/></td>
                    </tr>
                    <tr>
                        <td><font color="navy"><b>3.</b></font></td>
                        <td><input type="text" name="third" value="<%=op3%>" size="70"/></td>
                    </tr>
                    <tr>
                        <td><font color="navy"><b>4.</b></font></td>
                        <td><input type="text" name="four" value="<%=op4%>" size="70"/></td>
                    </tr>
                    <tr>
                        <td><font color="navy"><b>Correct Answer</b></font></td>
                        <td><input type="text" name="ans" value="<%=ans%>" size="70"/></td>
                    </tr>
                    <tr>
                        <td></td>
                        <td><input type="submit" value="Update" name="submit" /></td>
                    </tr>
                </table>
                </form>
                </td>               
                </tr>        
            </tbody>
        </table>
    </body>
</html>
