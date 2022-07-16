<%
            if(session.getAttribute("adminname")==(null))
                {
            response.sendRedirect("login.jsp");
            }
%>
<html>
    <head>
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
                        Welcome Administrator<br>
                        <a href="addcategory.jsp">Add Category</a><br>
                         <a href="delcategory.jsp">Delete Category</a><br>
                        <a href="addques.jsp">Add Questions</a><br>
                        <a href="delques.jsp">Delete Questions</a><br>
                        <a href="update.jsp">Update Questions</a><br>
                        <a href="search.jsp">Search Question</a><br>
                        </font>
                        <img src="exam1.jpg" align="right" width="200" height="250">
                    </td>
                </tr>
                <tr>
                    <td colspan="7">
                        <form name="abc" method="get" action="http://www.google.com/search">
                            <font color="navy"> <b>Search on Internet </b><input type="text" name="q">
                            <input type="submit" type="submit" value="Search Google">
                            </font>
                        </form>
                    </td>
                </tr>
            </tbody>
        </table>
    </body>
</html>
