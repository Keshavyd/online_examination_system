<%@page import="java.sql.*" %>
<%
    
    String name,email,like,level,exam,view;
    if(request.getParameter("submit")!=null)
        {            
            name=request.getParameter("name");
            email=request.getParameter("email");
            like=request.getParameter("like");
            level=request.getParameter("level");
            exam=request.getParameter("exam");
            view=request.getParameter("views");
           try
                {
                    Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
                    Connection con=DriverManager.getConnection("jdbc:odbc:Driver={Microsoft Access Driver (*.mdb)};DBQ=" + "d:/onlineexam_database1.mdb","","");
                    String b="insert into feedback values(?,?,?,?,?,?)";
                    PreparedStatement mystatement=con.prepareStatement(b);
                    mystatement.setString(1, name);
                    mystatement.setString(2,email );
                    mystatement.setString(3, like);
                    mystatement.setString(4, level);
                    mystatement.setString(5, exam);
                    mystatement.setString(6,view );
                    mystatement.executeUpdate();
                    con.close();
                    response.sendRedirect("thanks.jsp");    
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
                chosen = ""
                len = document.abc.like.length
                for (i = 0; i <len; i++)
                {
                     if (document.abc.like[i].checked)
                     {
                           chosen = document.abc.like[i].value
                     }
                }
                if (chosen == "")
                {
                      alert("No Location Chosen");
                      return false;
                }

                chosen1 = ""
                len1 = document.abc.level.length
                for (i = 0; i < len1; i++)
                {
                     if (document.abc.level[i].checked)
                     {
                           chosen1 = document.abc.level[i].value
                     }
                }
                if (chosen1 == "")
                {
                      alert("No Location Chosen1");
                      return false;
                }

                chosen2 = ""
                len2 = document.abc.exam.length
                for (i = 0; i < len2; i++)
                {
                     if (document.abc.exam[i].checked)
                     {
                           chosen2 = document.abc.exam[i].value
                     }
                }
                if (chosen2 == "")
                {
                      alert("No Location Chosen2");
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
                        <form id="abc" name="abc" method="post" action="feedback.jsp" onsubmit="return xyz();">
                               <font color="navy"> <b> FeedBack</b><br>
                                    Thanks to join with this Site.<br>
                                    Now please answer some Questions so we can improve our site for future.<br><br><br>
                                    <b>Your Name</b><br>
                                    <input type="text" name="name" value="" /><br><br>
                                    <b>Email Id</b><br>
                                    <input type="text" name="email" value="" /><br><br>
                                    <b>How do you like Online Examination System Site?</b><br>
                                    <input type="radio" name="like" value="Excellent" />Excellent<br>
                                    <input type="radio" name="like" value="Very Good" />Very Good<br>
                                    <input type="radio" name="like" value="Good" />Good<br>
                                    <input type="radio" name="like" value="Poor" />Poor<br><br>
                                    <b>Is the difficulty level up to the mark?</b><br>
                                    <input type="radio" name="level" value="Yes" />Yes<br>
                                    <input type="radio" name="level" value="No" />No<br><br>
                                    <b>Would you like to give the Exam again in future?</b><br>
                                    <input type="radio" name="exam" value="Yes" />Yes<br>
                                    <input type="radio" name="exam" value="No" />No<br><br>
                                    <b>Would you like to share your views with us?</b><br>
                               </font>
                                <textarea name="views" rows="4" cols="30"></textarea><br><br>
                                <input type="submit" name="submit" value="Submit" />
                        </form>
                    </td>               
                </tr>               
            </tbody>
        </table>
    </body>
</html>
