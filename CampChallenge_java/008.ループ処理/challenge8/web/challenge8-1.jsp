<%-- 
    Document   : challenge8-1
    Created on : 2017/11/02, 16:38:15
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
        <%  long num = 1;
            for(int i = 0;i <= 20;i++){
                num *= 8; 
            }%>
    </body>
</html>
