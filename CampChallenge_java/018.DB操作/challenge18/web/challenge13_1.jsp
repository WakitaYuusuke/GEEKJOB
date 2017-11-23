<%-- 
    Document   : challenge13_1
    Created on : 2017/11/24, 2:28:44
    Author     : Yusuke
--%>
<%@page import = "java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <form action = "./challenge13_1.jsp" method = "post">
            <input type = "text" name = "UserID">UserID<br>
            <input type = "text" name= "UserPass">UserPass<br>
            <input type = "submit" value = "ログインする"　name = "btnSubmit"><br>
        </formm>
        <%
            Connection dbCon = null;
            PreparedStatement dbSt = null;
            
            try{
                Class.forName("com.mysql.jdbc.Driver").newInstance();  
                dbCon = DriverManager.getConnection("jdbc:mysql://localhost:3306/challengeDB", "root", "");
                
                String sql = "SELECT * FROM UserData WHERE UserID = ?";
                dbSt = dbCon.prepareStatement(sql);
                
                request.setCharacterEncoding("UTF-8");
                dbSt.setString(1,request.getParameter("UserID"));
                ResultSet dbData = dbSt.executeQuery();
                
                while(dbData.next()){
                    if(request.getParameter("UserID").equals(dbData.getString("UserID")) && request.getParameter("UserPass").equals(dbData.getString("UserPass"))){
                    out.println("ログインに成功しました");
                    response.sendRedirect("./challenge13_2.jsp");
                    }else {
                        out.println("ログインに失敗しました");
                    }
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
                }%>
    </body>
</html>
