<%@page import="java.sql.*" %>
<%
    if(session.getAttribute("adminname")==(null))
    {
        response.sendRedirect("login.jsp");
    }
    
%>
<html>
    <head>        
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
                <form name="abc" method="post" action="delques.jsp">
                <table border="0" cellspacing="2" cellpadding="5">
                    <thead>
                    <tr>
                    <th colspan="2"><font color="navy"> Delete Category</font></th>
                    </tr>
                    </thead>
                    <tr>
                        <td><font color="navy">
                                                   
                        <%
                              String c;
                              ResultSet myresult;
                              try
                                {
                                        Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
                                        Connection con=DriverManager.getConnection("jdbc:odbc:Driver={Microsoft Access Driver (*.mdb)};DBQ=" + "d:/onlineexam_database1.mdb","","");
                                        String b="select * from category";
                                        PreparedStatement mystatement=con.prepareStatement(b);
                                        mystatement.executeQuery();
                                        myresult =mystatement.getResultSet();
                                        while(myresult.next())
                                        {
                                            out.println("->");
                                             out.println(myresult.getString("catname"));
                                             out.println("<a href=delcat.jsp?id=" + myresult.getInt("catid")+ ">Delete</a>" + "<br>");                                            
                                        }
                                        con.close();
                                 }
                                 catch(Exception e)
                                 {
                                         out.println("Error occured" + e.getMessage());
                                 }

                          %>
                             </font></td>                        
                        <tr>
                        <td></td>                       
                        </tr>
                      </table>
                      </form>
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
                </table>
    </body>
</html>
