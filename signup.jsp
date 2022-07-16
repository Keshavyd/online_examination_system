<%@page import="java.sql.*" %>
<%

    if(request.getParameter("submit")!=null)
        {
            String username, password, address, email,qualification,city;
            int phone;
            username=request.getParameter("username");
            password=request.getParameter("password");
            address=request.getParameter("address");
            email=request.getParameter("email");
            phone=Integer.parseInt(request.getParameter("phone"));
            qualification=request.getParameter("qualification");
            city=request.getParameter("city");           

            try
                {
                    Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
                    Connection con=DriverManager.getConnection("jdbc:odbc:Driver={Microsoft Access Driver (*.mdb)};DBQ=" + "d:/onlineexam_database1.mdb","","");
                    String b="insert into usertable values(?,?,?,?,?,?,?)";
                    PreparedStatement mystatement=con.prepareStatement(b);
                    mystatement.setString(1, username);
                    mystatement.setString(2,password );
                    mystatement.setString(3, address);
                    mystatement.setString(4, email);
                    mystatement.setInt(5, phone);
                    mystatement.setString(6,qualification );
                    mystatement.setString(7,city );
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
        <title>Sign up to Online Examination System :: Project created by Rinky</title>
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
                    if(document.abc.address.value.length < 1)
                    {
                          alert("You should mention your Address");
                          return false;
                    }
                    if(document.abc.email.value.length < 1)
                    {
                          alert("Please enter your E-mail id");
                          return false;
                    }
                    if(document.abc.phone.value.length < 1)
                    {
                          alert("Please Enter your Phone no.");
                          return false;
                    }
                    if(document.abc.qualification.value.length < 1)
                    {
                          alert("Please Enter your Qualification");
                          return false;
                    }
                     if(document.abc.city.value.length < 1)
                    {
                          alert("Please Enter your City");
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
                        <form name="abc" method="post" action="signup.jsp" onsubmit="return xyz();">
                        <table border="0" cellspacing="2" cellpadding="5">
                            <thead>
                                <tr>
                                    <th colspan="2"><font color="navy">Sign Up</font> </th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td><font color="navy">Username</font></td>
                                    <td><input type="text" name="username" value="" /></td>
                                </tr>
                                <tr>
                                    <td><font color="navy">Password</font></td>
                                    <td><input type="password" name="password" value="" /></td>
                                </tr>
                                <tr>
                                    <td><font color="navy">Address</font></td>
                                    <td><input type="text" name="address" value="" /></td>
                                </tr>
                                <tr>
                                    <td><font color="navy">Email id</font></td>
                                    <td><input type="text" name="email" value="" /></td>
                                </tr>
                                <tr>
                                    <td><font color="navy">Phone no.</font></td>
                                    <td><input type="text" name="phone" value="" /></td>
                                </tr>
                                <tr>
                                    <td><font color="navy">Qualification</font></td>
                                    <td><input type="text" name="qualification" value="" /></td>
                                </tr>
                                <tr>
                                    <td><font color="navy">City</font></td>
                                    <td><input type="text" name="city" value="" /></td>
                                </tr>
                                <tr>
                                    <td></td>
                                    <td><input type="submit" value="Sign Up" name="submit" /></td>
                                </tr>                                
                            </tbody>
                        </table>
                            </form>
                    </td>                  
                </tr>                
            </tbody>            
        </table>
    </body>
</html>
