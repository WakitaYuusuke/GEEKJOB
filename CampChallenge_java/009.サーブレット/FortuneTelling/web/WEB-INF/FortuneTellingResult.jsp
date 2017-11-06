<%-- 
    Document   : FortuneTellingResult
    Created on : 2017/11/06, 14:33:50
    Author     : Yusuke
--%>
<%@page import="org.camp.servlet.ResultData" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <%
            ResultData data = (ResultData)request.getAttribute("DATA");
         %>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            if(data != null){
                out.print("<h1>あなたの" + data.getD() + "運勢は" + data.getLuck() + "です</h1>");
    }%>
    </body>
</html>
