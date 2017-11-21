<%-- 
    Document   : challenge9
    Created on : 2017/11/20, 16:49:06
    Author     : Yusuke
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <form action = "./challenge9.jsp" method = "post">
            <input type = "text" name = "id">id<br>
            <input type = "text" name = "名前">名前<br>
            <input type = "text" name = "年齢">年齢<br>
            <input type = "text" name = "電話番号">電話番号<br>
            <input type = "text" name = "誕生日">誕生日<br>
            <input type="submit" value = "送信する" name="btnSubmit"><br>
        </form>
        <%
            Connection dbCon = null;
            PreparedStatement dbSt = null;
            
            try{
                Class.forName("com.mysql.jdbc.Driver").newInstance();  
                dbCon = DriverManager.getConnection("jdbc:mysql://localhost:3306/challengeDB", "root", "");
            
                SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
                request.setCharacterEncoding("UTF-8");
                
                Date birthday = sdf.parse(request.getParameter("誕生日"));
                String name = request.getParameter("名前");
                String tel = request.getParameter("電話番号");
                int age = Integer.parseInt(request.getParameter("年齢"));
                String id = request.getParameter("id");
            
                String sql = "insert into profiles() values(?,?,?,?,?)";
                
                dbSt = dbCon.prepareStatement(sql);
                dbSt.setInt(1,Integer.parseInt(id));            
                dbSt.setString(2,name);
                dbSt.setString(3,tel);
                dbSt.setInt(4,age);
                dbSt.setString(5,sdf.format(birthday));
            
            
                int num = dbSt.executeUpdate();
            
                if(num != 0){
                    out.println("更新しました");
                }
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
