<%-- 
    Document   : challenge8-3
    Created on : 2017/11/02, 17:06:52
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
        <%
            int num = 0;
            for(int i = 0;i <=100;i++){
                num += i;
            }
            out.print(num);%>
    </body>
</html>
