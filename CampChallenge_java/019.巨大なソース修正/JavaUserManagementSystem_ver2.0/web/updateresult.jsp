<%@page import="java.text.SimpleDateFormat"%>
<%@page import="jums.UserDataDTO"%>
<%@page import="jums.UserDataBeans"%>
<%@page import="jums.JumsHelper" %>
<%
    JumsHelper jh = JumsHelper.getInstance();
    UserDataDTO udd = (UserDataDTO)request.getAttribute("udd");
    SimpleDateFormat sdf = new SimpleDateFormat("yyyy年MM月dd日");
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JUMS更新結果画面</title>
    </head>
    <body>
        <h1>変更結果</h1><br>
        名前:<%= udd.getName()%><br>
        生年月日:<%= sdf.format(udd.getBirthday())%><br>
        種別:<%= new JumsHelper().exTypenum(udd.getType())%><br>
        電話番号:<%= udd.getTell()%><br>
        自己紹介:<%= udd.getComment()%><br>
        以上の内容で登録しました。<br>
    </body>
    <form action="ResultDetail" method="POST">
            <input type="hidden" name="id"  value="<%= udd.getUserID()%>">
            <input type="submit" name="btnSubmit" value="詳細画面へ戻る"style="width:100px">
        </form><br>
    <%=jh.home()%>
    </body>
</html>
