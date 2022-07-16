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
                     <td align="center"><a href="index.jsp">Home</a> </td>
                    <td align="center"><a href="signout.jsp">Log Out</a> </td>
                    <td align="center"><a href="signup.jsp">Sign Up</a></td>
                    <td align="center"><a href="test.jsp">Take Exam</a></td>                   
                    <td align="center"><a href="feedback.jsp">Feedback</a></td>
                    <td align="center"><a href="contactus.jsp">Contact us</a></td>                    
                </tr>
                <tr>
                    <td colspan="8">
                        <font color="navy">
                        <%
                            String a=(String)session.getAttribute("uname");
                            Object x=session.getAttribute("finalscore");
                            out.println("<h1>" + a +"</h1>");
                            out.println("<h3>Your Total Score is: " + x +"/50</h3>" );
                            double u=Double.parseDouble(x.toString());
                            double per=(u/30)*100;
                            if(per>=50)
                                {
                                    out.println("<h3>Cogratulation you have Passed the test</h3>");
                                }
                             else
                                 {
                                out.println("Fail <br> Try Again Later");
                                }
                        %>
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