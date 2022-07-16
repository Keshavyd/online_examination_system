<%@page import="java.sql.*" %>
<%
         if(session.getAttribute("adminname")==(null))
         {
            response.sendRedirect("login.jsp");
         }
         if(request.getParameter("submit")!=null)
         {
            String ques,op1,op2,op3,op4,ans;
            int catid=0;
            catid=Integer.parseInt(request.getParameter("category"));
            ques=request.getParameter("ques");
            op1=request.getParameter("first");
            op2=request.getParameter("second");
            op3=request.getParameter("third");
            op4=request.getParameter("four");
            ans=request.getParameter("ans");
            try
                {
                    Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
                    Connection con=DriverManager.getConnection("jdbc:odbc:Driver={Microsoft Access Driver (*.mdb)};DBQ=" + "d:/onlineexam_database1.mdb","","");
                    String b="insert into addques(catid,ques,op1,op2,op3,op4,ans) values(?,?,?,?,?,?,?)";
                    PreparedStatement mystatement=con.prepareStatement(b);
                    mystatement.setInt(1, catid);
                    mystatement.setString(2,ques);
                    mystatement.setString(3, op1);
                    mystatement.setString(4, op2);
                    mystatement.setString(5, op3);
                    mystatement.setString(6,op4);
                    mystatement.setString(7,ans);
                    mystatement.executeUpdate();
                    con.close();
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
                <form name="abc" method="post" action="addques.jsp">
                <table border="0" cellspacing="2" cellpadding="5">
                    <thead>
                    <tr>
                    <th colspan="2"><font color="navy"> Add Question</font></th>
                    </tr>
                    </thead>
                    <tr>
                        <td><font color="navy"><b>Select Category</b></font></td>
                        <td><select name="category">
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
                                            out.println("<option value=" + myresult.getInt("catid") + ">" + myresult.getString("catname") + "</option>");
                                        }
                                        con.close();
                                 }
                                 catch(Exception e)
                                 {
                                         out.println("Error occured" + e.getMessage());
                                 }
                          %>    
                    </select></td>
                    </tr>
                    <tr>
                        <td><font color="navy"><b>Add Question</b></font></td>
                        <td><input type="text" name="ques" value="" size="70" /></td>
                    </tr>
                    <tr>
                        <td><font color="navy"><b>Add Options</b></font></td>
                        <td></td>
                    </tr>
                    <tr>
                        <td><font color="navy"><b>1.</b></font></td>
                        <td><input type="text" name="first" value="" size="70" /></td>
                    </tr>
                    <tr>
                        <td><font color="navy"><b>2.</b></font></td>
                        <td><input type="text" name="second" value="" size="70"/></td>
                    </tr>
                    <tr>
                        <td><font color="navy"><b>3.</b></font></td>
                        <td><input type="text" name="third" value="" size="70"/></td>
                    </tr>
                    <tr>
                        <td><font color="navy"><b>4.</b></font></td>
                        <td><input type="text" name="four" value="" size="70"/></td>
                    </tr>
                    <tr>
                        <td><font color="navy"><b>Correct Answer</b></font></td>
                        <td><input type="text" name="ans" value="" size="70"/></td>
                    </tr>
                    <tr>
                        <td></td>
                        <td><input type="submit" value="Submit" name="submit" /></td>
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
            </tbody>
        </table>
    </body>
</html>
