<%-- 
    Document   : challenge1
    Created on : 2017/11/15, 11:41:12
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
        <form action = "./challenge1.jsp" method = "post">
            <input type = "text" name = "名前">
            <input type = "radio" neme = "性別">
            <input type="submit" name="btnSubmit">
            <textarea name = "趣味"></textarea>
        </form>
    </body>
</html>
