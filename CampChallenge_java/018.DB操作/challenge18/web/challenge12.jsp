<%-- 
    Document   : challenge12
    Created on : 2017/11/22, 16:35:20
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
        <form action ="./challenge12.jsp" method = "post">
            <input type = "text" name = "名前">名前<br>
            <input type = "text" name = "年齢">年齢<br>
            <input type = "text" name = "誕生日">誕生日<br>
            <input type="submit" value = "検索する" name="btnSubmit"><br>
        </form>
        <%  Connection dbCon = null;
            PreparedStatement dbSt = null;
            ResultSet dbData = null;
            
            try{
                Class.forName("com.mysql.jdbc.Driver").newInstance();  
                dbCon = DriverManager.getConnection("jdbc:mysql://localhost:3306/challengeDB", "root", "");
                
                request.setCharacterEncoding("UTF-8");
                
                String name = request.getParameter("名前");
                int age = Integer.parseInt(request.getParameter("年齢"));
                SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
                Date birthday = sdf.parse(request.getParameter("誕生日"));
                
                
                String sql = "SELECT * FROM profiles WHERE name = ? or age = ? or birthday = ?;";
                
                dbSt = dbCon.prepareStatement(sql);
                dbSt.setString(1,name);
                dbSt.setInt(2,age);
                dbSt.setString(3,sdf.format(birthday));
                
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
