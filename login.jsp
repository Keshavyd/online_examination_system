<%@page import="java.sql.*" %>
<%
     String msg="";
     String username="", password;
    if(request.getParameter("submit")!=null)
        {
            
            username=request.getParameter("username");
            password=request.getParameter("password");
            ResultSet myresult;
            try
                {
                    Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
                    Connection con=DriverManager.getConnection("jdbc:odbc:Driver={Microsoft Access Driver (*.mdb)};DBQ=" + "d:/onlineexam_database1.mdb","","");

                    String b="select username from admin_table where username=? and password=?";
                    PreparedStatement mystatement1=con.prepareStatement(b);
                    mystatement1.setString(1,username);
                    mystatement1.setString(2,password);
                    myresult=mystatement1.executeQuery();
                    while(myresult.next())
                    {
                        session.setAttribute("adminname",myresult.getObject(1));
                        response.sendRedirect("admin.jsp");
                    }
                    String b1="select username from usertable where username=? and password=?";
                    PreparedStatement mystatement2=con.prepareStatement(b1);
                    mystatement2.setString(1,username);
                    mystatement2.setString(2,password);
                    myresult=mystatement2.executeQuery();
                    while(myresult.next())
                    {
                        session.setAttribute("uname",myresult.getObject(1));
                        response.sendRedirect("welcome.jsp");
                    }
                    boolean x;
                    x=myresult.next();
                    if(x==false)
                        {
                    msg="Wrong username/password";
                    }
                    con.close();
                }
            catch(Exception e)
                {
                    out.println("Error occured" + e.getMessage());
                }
        }
 %>    

<html>
    <head>        
        <title>Login to Online Examination System :: Project created by Rinky</title>
        <script type="text/javascript">
            function xyz()
            {
                if(document.abc.username.value.length < 1)
                    {
                        alert("Enter Username");
                        return false;
                    }
                 if(document.abc.password.value.length < 3)
                    {
                          alert("Password should be greater than 3 characters");
                          return false;
                    }
            }
            </script>
    </head>
    <body background="images1.jpg">
        <table border="1" width="800" cellspacing="0" cellpadding="5" align="center" >
            <thead>
                <tr>
                    <th colspan="7"><img src="oe_logo.gif" width="153" height="56" alt="oe_logo"/><br><font color="navy" size="7" face="Georgia"><i>Online Examination System</i></font>
                    </th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td align="center"><a href="index.jsp">Home</a> </td>
                    <td align="center"><a href="login.jsp">Login</a> </td>
                    <td align="center"><a href="signup.jsp">Sign Up</a></td>
                    <td align="center"><a href="taketest.jsp">Take Exam</a></td>                    
                    <td align="center"><a href="feedback.jsp">Feedback</a></td>
                    <td align="center"><a href="contactus.jsp">Contact us</a></td>
                </tr>
                <tr>
                    <td colspan="7">
                        <form name="abc" method="post" action="login.jsp" onsubmit="return xyz();">
            <table border="0" cellspacing="2" cellpadding="5">
                <thead>
                    <tr>
                <th colspan="2"><font color="navy"> Login</font></th>
                </tr>
                </thead>
                    <tr>
                        <td><font color="navy">Username</font></td>
                        <td><input type="text" name="username" value="" /></td>
                    </tr>
                    <tr>
                        <td><font color="navy">Password</font></td>
                        <td><input type="password" name="password" value="" /></td>
                    </tr>
                    <tr>
                        <td></td>
                        <td><input type="submit" value="Login" name="submit" /></td>
                        <%
                            if(request.getParameter("submit")!=null)
                                {
                                     out.println(msg);
                                }
                        %>
                    </tr>
                    </table>
                            </form>
                    </td>           
            </tbody>
        </table>
    </body>
</html>
