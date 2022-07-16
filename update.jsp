<%@page import="java.sql.*" %>
<%
     if(session.getAttribute("adminname")==(null))
                {
            response.sendRedirect("login.jsp");
            }
    
%>
        <%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Online Examination System :: Project created by Rinky</title>
<script type="text/javascript">
function xyz(x)
{
  if(window.XMLHttpRequest)
  {
        //For Firefox, Safari, Opera
    xmlhttp = new XMLHttpRequest();
    }
    else if(window.ActiveXObject)
    {
          xmlhttp = new ActiveXObject("Msxml2.XMLHttp");

    }
    else if(window.ActiveXObject)
    {
       xmlhttp = new ActiveXObject("Microsoft.XMLHttp");
    }
    else
    {
        //Error for an old browser
        alert("Your browser is not IE 5 or higher, or Firefox or Safari or Opera");
    }
    xmlhttp.onreadystatechange=function()
    {
    if (xmlhttp.readyState<4)
    {
     document.getElementById("newbox").innerHTML="<img src=images/preloader.gif>";
    }

  if (xmlhttp.readyState==4 && xmlhttp.status==200)
    {
     document.getElementById("newbox").innerHTML=xmlhttp.responseText;
    
    
    }
  }
    xmlhttp.open("GET","update2.jsp?a="+x,true);
    xmlhttp.send();


}
</script>
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
                <form name="form1" method="post" action="update.jsp">
                <table border="0" cellspacing="2" cellpadding="5">
                    <thead>
                    <tr>
                    <th colspan="2"><font color="navy"> Update Question</font></th>
                    </tr>
                    </thead>
                    <tr>
                        <td><font color="navy"><b>Select Category</b></font></td>
                        <td>
                            <select name="category" onchange="xyz(this.value)">
                                <option>Select Category</option>
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
                            </select>
                        </td>
                    <tr>
                        <td></td>
                          <td><div id="newbox" align="center"></div></td>
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
