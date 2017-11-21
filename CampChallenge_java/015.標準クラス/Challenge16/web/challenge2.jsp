<%-- 
    Document   : challenge2
    Created on : 2017/11/15, 12:46:06
    Author     : Yusuke
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <form action = "./challenge2.jsp" method = "post">
            <input type = "text" name = "名前"><br>
            <input type = "radio" value = "男性" name = "性別">男性<br>
            <input type = "radio" value = "女性" name = "性別">女性<br>
            <textarea name = "趣味"></textarea><br>
            <input type="submit" value = "送信する" name="btnSubmit"><br>
        </form>
        <%
            request.setCharacterEncoding("UTF-8");
            out.print(request.getParameter("名前"));
            out.print(request.getParameter("性別"));
            out.print(request.getParameter("趣味"));
        %>    
    </body>
</html>

