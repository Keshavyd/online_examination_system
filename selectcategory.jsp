<%@page import="java.sql.*" %>
<%
     String c;
     
            ResultSet myresult;
            try
                {
                    Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
                    Connection con=DriverManager.getConnection("jdbc:odbc:Driver={Microsoft Access Driver (*.mdb)};DBQ=" + "d:/onlineexam_database.mdb","","");
                    String b="select catname from category";
                    PreparedStatement mystatement=con.prepareStatement(b);
                    mystatement.executeQuery();
                    myresult =mystatement.getResultSet();
                    while(myresult.next())
                    {
                        c=(String)myresult.getObject("catname");
                        System.out.println(c);
                    }
                    con.close();
                }
            catch(Exception e)
                {
                    out.println("Error occured" + e.getMessage());
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
                    <td align="center"><a href="result.jsp">Results</a></td>
                    <td align="center"><a href="feedback.jsp">Feedback</a></td>
                    <td align="center"><a href="contactus.jsp">Contact us</a></td>

                </tr>
                <tr>

                    <td colspan="7">
                        <form name="abc" method="post" action="selectcategory.jsp">
            <table border="0" cellspacing="2" cellpadding="5">
                <thead>
                    <tr>
                <th colspan="2"><font color="navy"> Select Category</font></th>
                </tr>
                </thead>
                    <tr>
                        <td><font color="navy"><b>Select Category</b></font></td>
                        <td><select name="category">
                                <option></option>
                                <option></option>
                                <option></option>
                                <option></option>
                                <option></option>
                                <option></option>
                                <option></option>
                                <option></option>
                                <option></option>
                                <option></option>
                            </select></td>
                    </tr>
                    <tr>
                        <td></td>
                        <td><input type="submit" value="Submit" name="submit" /></td>
                    </tr>
                    <tr>
                        <td></td>
                        <td></td>
                    </tr>

            </table>
                            </form>
                    </td>               
                </tr>        
            </tbody>
        </table>
    </body>
</html>
