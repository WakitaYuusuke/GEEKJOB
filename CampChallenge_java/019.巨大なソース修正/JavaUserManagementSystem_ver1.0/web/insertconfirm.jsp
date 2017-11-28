<%@page import="javax.servlet.http.HttpSession" %>
<%
    HttpSession hs = request.getSession();
%>
<%@page import="jums.JumsHelper" %>
<%
    JumsHelper jh = new JumsHelper();%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JUMS登録確認画面</title>
    </head>
    <body>
    <%  int check = jh.checker(hs);
        if(check == 1){ %>
        <h1>登録確認</h1>
        名前:<%= hs.getAttribute("name")%><br>
        生年月日:<%= hs.getAttribute("year")+"年"+hs.getAttribute("month")+"月"+hs.getAttribute("day")+"日"%><br>
        種別:<%= hs.getAttribute("type")%><br>
        電話番号:<%= hs.getAttribute("tell")%><br>
        自己紹介:<%= hs.getAttribute("comment")%><br>
        上記の内容で登録します。よろしいですか？
        <form action="insertresult" method="POST">
            <input type="hidden" name="ac"  value="<%= hs.getAttribute("ac")%>">
            <input type="submit" name="yes" value="はい">
        </form>
    <% }else{ %>
        <h1>入力が不完全です</h1>
    <% } %>
        <form action="insert.jsp" method="POST">
            <input type="hidden" name="check"  value="<%=check%>">
            <input type="hidden" name="name"  value="<%=hs.getAttribute("name")%>">
            <input type="hidden" name="year"  value="<%=hs.getAttribute("year")%>">
            <input type="hidden" name="month"  value="<%=hs.getAttribute("month")%>">
            <input type="hidden" name="day"  value="<%=hs.getAttribute("day")%>">
            <input type="hidden" name="type"  value="<%=hs.getAttribute("type")%>">
            <input type="hidden" name="tell"  value="<%=hs.getAttribute("tell")%>">
            <input type="hidden" name="comment"  value="<%=hs.getAttribute("comment")%>">
            <input type="submit" name="no" value="登録画面に戻る">
        </form>
        <br>
        <%=jh.home()%>
    </body>
</html>
