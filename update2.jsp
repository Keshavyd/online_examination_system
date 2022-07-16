<%@page import="java.sql.*" %>


                            <%
                            if(request.getParameter("a")!=null)
                                {
                                    Integer s=Integer.parseInt(request.getParameter("a"));
                                    session.setAttribute("catid", s);
                                    Thread.sleep(1000);
                                    try
                                    {
                                        ResultSet myresult;
                                        Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
                                        Connection con=DriverManager.getConnection("jdbc:odbc:Driver={Microsoft Access Driver (*.mdb)};DBQ=" + "d:/onlineexam_database1.mdb","","");
                                        String b="select * from addques where catid=?";
                                        PreparedStatement mystatement=con.prepareStatement(b);
                                        mystatement.setInt(1,s);
                                        myresult=mystatement.executeQuery();
                                        out.println("<table width=600px cellpadding=5 cellspacing=5>");
                                        int k=1;
                                        while(myresult.next())
                                        {
                                            out.println("<tr>");
                                            out.println("<td>");
                                            out.println(k);
                                            out.println("</td>");
                                            out.println("<td>");
                                            out.println(myresult.getString("ques"));
                                            out.println("</td>");
                                            out.println("<td>");
                                            out.println("<a href=update1.jsp?id=" + myresult.getInt("srno") + ">Update</a>" + "<br>");
                                            out.println("</td>");
                                            k++;
                                        }
                                        out.println("</table>");
                                        mystatement.close();
                                       con.close();
                                    }
                                    catch(Exception e)
                                    {
                                        out.println("Error occured" + e.getMessage());
                                    }
                                }
                    %>
                       