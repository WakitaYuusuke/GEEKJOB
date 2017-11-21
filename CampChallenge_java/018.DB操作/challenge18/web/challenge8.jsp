<%-- 
    Document   : challenge8
    Created on : 2017/11/20, 16:15:33
    Author     : Yusuke
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <form action = "./challenge8.jsp" method = "post">
            <input type = "text" name = "名前">名前<br>
            <input type="submit" value = "送信する" name="btnSubmit"><br>
        </form>    
        <%
            Connection dbCon = null;
            PreparedStatement dbSt = null;
            ResultSet dbData = null;
            
            try{
                Class.forName("com.mysql.jdbc.Driver").newInstance();  
                dbCon = DriverManager.getConnection("jdbc:mysql://localhost:3306/challengeDB", "root", "");
                dbSt = dbCon.prepareStatement("select * from profiles where name like ?");
                request.setCharacterEncoding("UTF-8");
                dbSt.setString(1, "%"+request.getParameter("名前")+"%");
                dbData = dbSt.executeQuery();
                while(dbData.next()){
                    out.print("profilesID：" + dbData.getString("profilesID") + "<br>");
                    out.print("名前：" + dbData.getString("name") + "<br>");
                    out.print("年齢：" + dbData.getString("age") + "<br>");
                    out.print("電話番号：" + dbData.getString("tel") + "<br>");
                    out.print("誕生日：" + dbData.getString("birthday") + "<br>");
                }
                dbSt.close();
                dbData.close();
                }catch (SQLException e_sql){
                        out.println("接続時にエラーが発生しました:" + e_sql.toString());
                        }catch (Exception e){
                            out.println("接続時にエラーが発生しました:" + e.toString());
                        }finally{
                            if (dbCon != null){
                                try {
                                    dbCon.close();
                                } catch (Exception e_con) {
                                    System.out.println(e_con.getMessage());
                                }
                        }
                }
        %>
    </body>
</html>
