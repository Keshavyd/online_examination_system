<%@page import="java.sql.*" %>
<%
if(session.getAttribute("uname")==null)
{
  response.sendRedirect("login.jsp");
}
if(request.getParameter("submit")!=null)
        {
            String username, password;
            username=request.getParameter("username");
            password=request.getParameter("password");
            ResultSet myresult;
            
            try
                {
                    Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
                    Connection con=DriverManager.getConnection("jdbc:odbc:Driver={Microsoft Access Driver (*.mdb)};DBQ=" + "d:/onlineexam_database.mdb","","");
                    String b="select username1 from usertable where username1=? and password1=?";
                    PreparedStatement mystatement=con.prepareStatement(b);
                    mystatement.setString(1,username);
                    mystatement.setString(2,password);
                    myresult=mystatement.executeQuery();
                    while(myresult.next())
                    {

                        session.setAttribute("uname",myresult.getObject(1));
                        response.sendRedirect("welcome.jsp");
                    }
                    out.println("Wrong username/password");
                    con.close();
                }
            catch(Exception e)
                {
                        out.println("Error occured" + e.getMessage());
                }
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
                    <td align="center"><a href="index.jsp">Home</a> </td>
                    <td align="center"><a href="signout.jsp">Log Out</a> </td>
                    <td align="center"><a href="signup.jsp">Sign Up</a></td>
                    <td align="center"><a href="test.jsp">Take Exam</a></td>                    
                    <td align="center"><a href="feedback.jsp">Feedback</a></td>
                    <td align="center"><a href="contactus.jsp">Contact us</a></td>
                    

                </tr>
                <tr>

                    <td colspan="8"><font color="navy">
                            <h3>Welcome <%= session.getAttribute("uname") %><br>
                                You are successfully Login in to Online Examination System
                            </h3>
                        </font>
                    </td>               
                </tr>        
            </tbody>
        </table>
    </body>
</html>
