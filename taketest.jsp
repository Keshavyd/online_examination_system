<%@page import="java.sql.*" %>
<%
         if(session.getAttribute("uname")==(null))
         {
            response.sendRedirect("login.jsp");
         }
        String to;
        Object catidmain=0;
        double total=0.0;
        int current=1;
        Object t;
        Connection con=null;

        if (request.getParameter("hidden") != null)
        {
            current = Integer.parseInt(request.getParameter("hidden"));
        }
        if(session.getAttribute("score") != null)
        {
            t=session.getAttribute("score");
            to=t.toString();
            total=Double.parseDouble(to);
        }
        String cat="",ques="",op1="",op2="",op3="",op4="",ans="",srno="";

         if(session.getAttribute("catidfinal")!=null)
         {
            catidmain=session.getAttribute("catidfinal");
            try
            {
             Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
             con=DriverManager.getConnection("jdbc:odbc:Driver={Microsoft Access Driver (*.mdb)};DBQ=" + "d:/onlineexam_database1.mdb","","");
             
             String sql1="select * from addques where catid=? order by rnd(srno)";
             PreparedStatement pstmt1=con.prepareStatement(sql1);
             pstmt1.setObject(1, catidmain);
             ResultSet rec1=pstmt1.executeQuery();
             if(rec1.next())
             {
             srno=rec1.getString(1);
             cat=rec1.getString(2);
             ques=rec1.getString(3);
             op1=rec1.getString(4);
             op2=rec1.getString(5);
             op3=rec1.getString(6);
             op4=rec1.getString(7);
             ans=rec1.getString(8);              
             }
             }
             catch(Exception e)
             {
             out.println("Error in Connection " + e.getMessage());
             }       
         }
        if(request.getParameter("next") !=null)
        {
            String org_ans="";
            if(request.getParameter("hidden") != null)
            {
                org_ans=request.getParameter("org_ans");
            }
            String useranswer="";
            useranswer=request.getParameter("ans1");
            if(useranswer.equalsIgnoreCase(org_ans))
            {
                total=total+5.0;
            }
            else
            {
                total=total-2;
            }
            session.setAttribute("score",total);
            if(session.getAttribute("over") != null)
            {
                if(session.getAttribute("over").equals("true"))
                {
                    con.close();
                    session.setAttribute("finalscore",total);
                    response.sendRedirect("results.jsp");
                }
            }
            if(session.getAttribute("catidfinal")!=null)
            {
                 Integer s=Integer.parseInt((String)session.getAttribute("catidfinal"));               
                 try
                 {
                 Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
                 con=DriverManager.getConnection("jdbc:odbc:Driver={Microsoft Access Driver (*.mdb)};DBQ=" + "d:/onlineexam_database1.mdb","","");
                 String sql1="select * from addques where catid=? order by srno";
                 PreparedStatement pstmt1=con.prepareStatement(sql1);
                 pstmt1.setInt(1,s);
                 ResultSet rec1=pstmt1.executeQuery();
                 for (int i = 0; i < current; i++)
                 {
                    rec1.next();
                 }
                 srno=rec1.getString(1);
                 cat=rec1.getString(2);
                 ques=rec1.getString(3);
                 op1=rec1.getString(4);
                 op2=rec1.getString(5);
                 op3=rec1.getString(6);
                 op4=rec1.getString(7);
                 ans=rec1.getString(8);            
                 if (!rec1.next())
                 {
                    session.setAttribute("over","true");
                 }
                 }
                 catch(Exception e)
                 {
                  out.println("Error in Connection 2" + e.getMessage());
             	 }                 
                 finally
                 {
                 con.close();
                 }
            }
         }
%>
<html>
    <head>        
        <title>Online Examination System :: Project created by Rinky</title>
         <script type="text/javascript">
             function xyz()
            {
                chosen = ""
                len = document.abc.ans1.length
                for (i = 0; i < len; i++)
                {
                     if (document.abc.ans1[i].checked)
                     {
                           chosen = document.abc.ans1[i].value
                     }
                }
                if (chosen == "")
                {
                      alert("No Location Chosen1");
                      return false;
                }
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
                    <td align="center"><a href="index.jsp">Home</a> </td>
                    <td align="center"><a href="signout.jsp">Log Out</a></td>
                    <td align="center"><a href="signup.jsp">Sign Up</a></td>
                    <td align="center"><a href="taketest.jsp">Take Exam</a></td>                    
                    <td align="center"><a href="feedback.jsp">Feedback</a></td>
                    <td align="center"><a href="contactus.jsp">Contact us</a></td>                    
                </tr>
                <tr>
                    <td colspan="8"><font color="navy">
                 <h1 align="left">Answer the following questions:</h1></font>
                <form name="abc" action="taketest.jsp" method="POST" onsubmit="return xyz();">
                   <font color="navy">
                    Question:<br><b><%=ques%></b><br>
                    Options:<br>
                    (A)<input type="radio" name="ans1" value="<%=op1%>" /><b><%=op1%></b><br>
                    (B)<input type="radio" name="ans1" value="<%=op2%>" /><b><%=op2%></b><br>
                    (C)<input type="radio" name="ans1" value="<%=op3%>" /><b><%=op3%></b><br>
                    (D)<input type="radio" name="ans1" value="<%=op4%>" /><b><%=op4%></b><br></font>
                   <input type="hidden" name="org_ans" value="<%=ans%>">                    
                    <INPUT TYPE="hidden" NAME="hidden" VALUE="<%=current + 1%>"><br><br><br>
                     <input type="submit" value="NEXT QUESTION" name="next" />
                </form>
                </td>               
                </tr>        
            </tbody>
        </table>
    </body>
</html>
