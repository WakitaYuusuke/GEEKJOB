<%-- 
    Document   : challenge13_2
    Created on : 2017/11/24, 4:36:46
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
        <a href = "./challenge13_1.jsp" title = "ログアウト">ログアウト</a>
        <form action = "./challenge13_2.jsp" method = "post">
            <input type = "text" name = "name">名前<br>
            <input type = "text" name = "price">値段<br>
            <button type = "submit" name = "btnSubmit" value = "regi">登録</button><br>
            <button type = "submit" name = "btnSubmit" value = "show">商品一覧</button><br>
        </form>
        <%  Connection dbCon = null;
            PreparedStatement dbSt = null;
            try{
                Class.forName("com.mysql.jdbc.Driver").newInstance();  
                dbCon = DriverManager.getConnection("jdbc:mysql://localhost:3306/challengeDB", "root", "");
                request.setCharacterEncoding("UTF-8");
                String sql = null;
                
                if(request.getParameter("btnSubmit").equals("regi")){
                    sql = "INSERT INTO ProductData() VALUES(?,?);";
                    dbSt = dbCon.prepareStatement(sql);
                    String name = request.getParameter("name");
                    int price = Integer.parseInt(request.getParameter("price"));
                    dbSt.setString(1,name);
                    dbSt.setInt(2,price);
                    int num = dbSt.executeUpdate();
                    if(num != 0){
                        out.println("登録しました");
                    }
                }else if(request.getParameter("btnSubmit").equals("show")){
                    sql = "SELECT * FROM ProductData";
                    dbSt = dbCon.prepareStatement(sql);
                    ResultSet dbData = dbSt.executeQuery();
                    while(dbData.next()){
                        out.println(dbData.getString("Name")+" ");
                        out.println(dbData.getString("Price")+"円<br>");
                    }
                 dbData.close();
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
                }
        %>
    </body>
</html>
