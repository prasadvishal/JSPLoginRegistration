<%-- 
    Document   : login.jsp
    Created on : Aug 2, 2017, 11:08:01 AM
    Author     : Vishal Prasad
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page session="true" %>
<%
    String userName = request.getParameter("login_username");
    String password = request.getParameter("login_password");
    Connection con = null;
    try {
        Class.forName("com.mysql.jdbc.Driver");
        con = DriverManager.getConnection("jdbc:mysql://localhost:3306/testdata", "root", "mindfire");
        ResultSet rs = con.createStatement().executeQuery("select * from users where email='" + userName + "' OR mobile_no='" + userName + "';");
        if (rs != null) {
            while (rs.next()) {
                if (rs.getBoolean("account_status") == false) {
                    out.print("Sorry, This Account is Currently Deactivated !!!");
                } else {
                    if (rs.getBoolean("admin_type")) {

                        if ((password.equals(rs.getString("p_word")))) {
                            session.setAttribute("userid", rs.getString("userid"));
                            session.setAttribute("token", session.getId());
                            session.setAttribute("account_type", "admin");
                            session.setAttribute("error_msg", "");
                            response.sendRedirect("adminhome.jsp");
                        } else {
                            session.setAttribute("error_msg", "Incorrect Password");
                            response.sendRedirect("index.jsp");
                        }
                    } else {
                        if ((password.equals(rs.getString("p_word")))) {
                            session.setAttribute("userid", rs.getString("userid"));
                            session.setAttribute("token", session.getId());
                            session.setAttribute("account_type", "user");
                            session.setAttribute("error_msg", "");
                            response.sendRedirect("userhome.jsp");
                        } else {
                            session.setAttribute("error_msg", "Incorrect Password");
                            response.sendRedirect("index.jsp");
                        }
                    }

                }
            }
        } else {
            session.setAttribute("error_msg", "Incorrect Username");
            response.sendRedirect("index.jsp");
        }
    } catch (SQLException sqle) {
        out.print("Oops...Something went wrong. SQL Exception: " + sqle);
    } finally {
        if (con != null) {
            con.close();
        }
    }
%>