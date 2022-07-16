<%@page import="java.sql.*" %>
<%
    if(request.getParameter("submit")!=null)
        {
        String name,email,msg;
        name=request.getParameter("name");
        email=request.getParameter("email");
        msg=request.getParameter("query");
        try
        {
        Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
        Connection con=DriverManager.getConnection("jdbc:odbc:Driver={Microsoft Access Driver (*.mdb)};DBQ=" + "d:/onlineexam_database1.mdb","","");
        String b="insert into queries values(?,?,?)";
        PreparedStatement mystatement=con.prepareStatement(b);
        mystatement.setString(1, name);
        mystatement.setString(2,email );
        mystatement.setString(3,msg );
        mystatement.executeUpdate();
        con.close();
        response.sendRedirect("thanx.jsp");
        }
        catch(Exception e)
        {
        out.println("Error occured " + e.getMessage());
        }
      }    
%>
<html>
    <head>        
        <title>Online Examination System :: Project created by Rinky</title>
        <script type="text/javascript">
            function xyz()
            {
                if(document.abc.name.value.length < 1)
                    {
                        alert("Enter Your name");
                        return false;
                    }
                if(document.abc.email.value.length < 1)
                    {
                        alert("Enter Your Email id");
                        return false;
                    }
                if(document.abc.query.value.length < 1)
                    {
                        alert("Enter Your Query");
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
                    <td align="center"><a href="login.jsp">Log In</a> </td>
                    <td align="center"><a href="signup.jsp">Sign Up</a></td>
                    <td align="center"><a href="test.jsp">Take Exam</a></td>                    
                    <td align="center"><a href="feedback.jsp">Feedback</a></td>
                    <td align="center"><a href="contactus.jsp">Contact us</a></td>
                </tr>
                <tr>
                    <td colspan="7">
                        <form name="abc" method="post" action="contactus.jsp" onsubmit="return xyz();">
            <table border="0" cellspacing="2" cellpadding="5">
                <thead>
                    <tr>
                <th colspan="2"><font color="navy"> Contact Us</font></th>
                </tr>
                </thead>
                    <tr>
                        <td><font color="navy"><b>Name</b></font></td>
                        <td><input type="text" name="name" value="" /></td>
                    </tr>
                    <tr>
                        <td><font color="navy"><b>Email id</b></font></td>
                        <td><input type="text" name="email" value="" /></td>
                    </tr>
                    <tr>
                        <td><font color="navy"><b>Your Query</b></font></td>

                        <td><textarea name="query" rows="5" cols="16"></textarea></td>
                    </tr>
                    <tr>
                        <td></td>
                        <td><input type="submit" value="Submit" name="submit" /></td>
                    </tr>
                    <tr>
                        <td></td>
                        <td></td>
                    </tr>
              </table></form>
                    </td>               
                </tr>                
            </tbody>
        </table>
    </body>
</html>
