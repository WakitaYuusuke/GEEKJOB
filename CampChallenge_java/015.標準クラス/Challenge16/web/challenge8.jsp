<%-- 
    Document   : challenge8
    Created on : 2017/11/16, 17:34:47
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
        <form action = "./challenge8.jsp" method = "post">
            <input type = "text" name = "名前">名前<br>
            <input type = "radio" value = "男性" name = "性別">男性<br>
            <input type = "radio" value = "女性" name = "性別">女性<br>
            <textarea name = "趣味">趣味を書いてください</textarea><br>
            <input type="submit" value = "送信する" name="btnSubmit"><br>
        </form>
        <%
            request.setCharacterEncoding("UTF-8");
            HttpSession hs = request.getSession();
            hs.setAttribute("name",request.getParameter("名前"));
            hs.setAttribute("gender",request.getParameter("性別"));
            hs.setAttribute("hobby",request.getParameter("趣味"));
            out.print(hs.getAttribute("name")+"<br>");
            out.print(hs.getAttribute("gender")+"<br>");
            out.print(hs.getAttribute("hobby")+"<br>");
        %>    
    </body>
</html>
