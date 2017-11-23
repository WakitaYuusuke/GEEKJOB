<%-- 
    Document   : challenge11
    Created on : 2017/11/21, 18:34:30
    Author     : Yusuke
--%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.sql.*"%>
<%@page import="java.util.Date"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <form action ="./challenge11.jsp" method = "post">
            <input type ="text" name = "id">指定id<br>
            <input type = "text" name = "名前">名前<br>
            <input type = "text" name = "年齢">年齢<br>
            <input type = "text" name = "電話番号">電話番号<br>
            <input type = "text" name = "誕生日">誕生日<br>
            <input type="submit" value = "更新する" name="btnSubmit"><br>
        </form>
        <%
            Connection dbCon =null;
            PreparedStatement dbSt = null;
            
            try{
                Class.forName("com.mysql.jdbc.Driver").newInstance();  
                dbCon = DriverManager.getConnection("jdbc:mysql://localhost:3306/challengeDB", "root", "");
                
                String sql = "UPDATE profiles SET name = ?,tel = ?,age = ?, birthday = ? WHERE profilesID = ?";
                
                request.setCharacterEncoding("UTF-8");
                
                
                SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
                String id = request.getParameter("id");
                Date birthday = sdf.parse(request.getParameter("誕生日"));
                String name = request.getParameter("名前");
                String tel = request.getParameter("電話番号");
                int age = Integer.parseInt(request.getParameter("年齢"));
                
                dbSt = dbCon.prepareStatement(sql);          
                dbSt.setString(1,name);
                dbSt.setString(2,tel);
                dbSt.setInt(3,age);
                dbSt.setString(4,sdf.format(birthday));
                dbSt.setInt(5,Integer.parseInt(id)); 
            
                int num = dbSt.executeUpdate();
                if(num != 0){
                    out.println("更新しました");
                }
                dbSt.close();
                }
            catch (SQLException e_sql){
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
