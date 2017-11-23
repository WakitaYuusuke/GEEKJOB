<%-- 
    Document   : challlenge10
    Created on : 2017/11/21, 17:26:07
    Author     : Yusuke
--%>

<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
         <form action ="./challlenge10.jsp" method = "post">
            <input type ="text" name = "id">id<br>
            <input type="submit" value = "消去する" name="btnSubmit"><br>
        </form>
        <%
        Connection dbCon = null;
        PreparedStatement dbSt = null;
        
        try{
            Class.forName("com.mysql.jdbc.Driver").newInstance();  
            dbCon = DriverManager.getConnection("jdbc:mysql://localhost:3306/challengeDB", "root", "");
            
            String sql = "DELETE FROM profiles WHERE profilesID = ?";
            dbSt = dbCon.prepareStatement(sql);
            
            request.setCharacterEncoding("UTF-8");
            String id = request.getParameter("id");
            dbSt.setInt(1,Integer.parseInt(id)); 
            
            int num = dbSt.executeUpdate();
            if(num != 0){
                    out.println("削除しました");
                }
            dbSt.close();
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
