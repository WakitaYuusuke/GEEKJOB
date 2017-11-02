<%-- 
    Document   : challenge5-1
    Created on : 2017/11/02, 12:49:27
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
            int a  = 3;
            
            if(a == 1){
                out.print("1です！");
            }else if(a == 2){
                out.print("プログラミングキャンプ！");
            }else{
                out.print("その他です");
                }
        %>
    </body>
</html>
