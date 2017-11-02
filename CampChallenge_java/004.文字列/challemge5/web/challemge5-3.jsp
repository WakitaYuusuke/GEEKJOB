<%-- 
    Document   : challemge5-3
    Created on : 2017/11/02, 13:09:02
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
        char word = 'A';
        
        switch(word){
            case 'A':
                out.print("英語");
                break;
            case 'あ':
                out.print("日本語");
                break;
        }
        
        %>
    </body>
</html>
