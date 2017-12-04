<%@page import="java.util.ArrayList"%>
<%@page import="jums.JumsHelper"
        import="jums.UserDataDTO" %>
<%
    JumsHelper jh = JumsHelper.getInstance();
    ArrayList<UserDataDTO> resultList = (ArrayList<UserDataDTO>)request.getAttribute("resultList");
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JUMS検索結果画面</title>
    </head>
    <body>
        <h1>検索結果</h1>
        <%for(int i = 0;i < resultList.size();i++){
            %><table border=1>
                <tr>
                    <th>名前</th>
                    <th>生年</th>
                    <th>種別</th>
                    <th>登録日時</th>
                </tr>
                <tr>
                    <td><a href="ResultDetail?id=<%= resultList.get(i).getUserID()%>"><%= resultList.get(i).getName()%></a></td>
                    <td><%= resultList.get(i).getBirthday()%></td>
                    <td><%= new JumsHelper().exTypenum(resultList.get(i).getType())%></td>
                    <td><%= resultList.get(i).getNewDate()%></td>
                </tr><br><br>
            </table><%}%>
    </body>
    <%=jh.home()%>
</html>
