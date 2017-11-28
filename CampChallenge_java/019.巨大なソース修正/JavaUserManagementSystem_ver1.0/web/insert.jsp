<%@page import="javax.servlet.http.HttpSession" %>
<%@page import="jums.JumsHelper" %>
<%
    JumsHelper jh = new JumsHelper();%>
<%
    HttpSession hs = request.getSession();
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JUMS登録画面</title>
    </head>
    <body>
    <form action="insertconfirm" method="POST">
        名前:
        <input type="text" name="name" value=<%=jh.nullCheck(request.getParameter("name"))%>> 
        <font color="red">
        <%=jh.warnBrank(request.getParameter("check"),5)%>
        </font>
        <br><br>
       

        生年月日:
        <select name="year">
            <option value=>----</option>
            <%
            for(int i=1950; i<=2010; i++){ %>
            <option value="<%=i%>"<%
                if(jh.nullCheck(request.getParameter("year")).equals(String.valueOf(i))){
            %>selected<% } %>
            ><%=i%>
            </option>
            <% } %>
        </select>年
        <select name="month">
            <option value=>--</option>
            <%
            for(int i = 1; i<=12; i++){ %>
            <option value="<%=i%>"<%
                if(jh.nullCheck(request.getParameter("month")).equals(String.valueOf(i))){
            %>selected<% } %>
            ><%=i%>
            </option>
            <% } %>
        </select>月
        <select name="day">
            <option value=>--<option>
            <%
            for(int i = 1; i<=31; i++){ %>
            <option value="<%=i%>"<%
                if(jh.nullCheck(request.getParameter("day")).equals(String.valueOf(i))){
            %>selected<% } %>
            ><%=i%>
            </option>
            <% } %>
        </select>日 
        <font color="red">
        <%=jh.warnBrank(request.getParameter("check"),11)%>
        </font>
        <br><br>
        

        種別:
        <br>
        <input type="radio" name="type" value="1" checked>エンジニア<br>
        <input type="radio" name="type" value="2">営業<br>
        <input type="radio" name="type" value="3">その他<br>
        <br>

        電話番号:
        <input type="text" name="tell" value=<%=jh.nullCheck(request.getParameter("tell"))%>> 
        <font color="red">
        <%=jh.warnBrank(request.getParameter("check"),7)%>
        </font>
        <br><br>
        
        

        自己紹介文
        <br>
        <textarea name="comment" rows=10 cols=50 style="resize:none" wrap="hard"><%=
            
            jh.nullCheck(request.getParameter("comment"))
        
        %></textarea>
        <font color="red">
        <%=jh.warnBrank(request.getParameter("check"),17)%>
        </font><br><br>
        

        <input type="hidden" name="ac"  value="<%= hs.getAttribute("ac")%>">
        <input type="submit" name="btnSubmit" value="確認画面へ">
    </form>
        <br>
        <%=jh.home()%>
    </body>
</html>
