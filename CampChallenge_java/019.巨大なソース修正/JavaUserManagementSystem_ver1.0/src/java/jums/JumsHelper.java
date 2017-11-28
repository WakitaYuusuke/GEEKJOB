package jums;

import javax.servlet.http.HttpSession;

/**
 * 画面系の処理や表示を簡略化するためのヘルパークラスです。定数なども保存されます
 *
 * @author hayashi-s
 */
public class JumsHelper {

    //トップへのリンクを定数として設定
    private final String homeURL = "index.jsp";

    public static JumsHelper getInstance() {
        return new JumsHelper();
    }

    //トップへのリンクを返却
    public String home() {
        return "<a href=\"" + homeURL + "\">トップへ戻る</a>";
    }


    public int checker(HttpSession hs) {
        int checkNum = 1;
        String date[] = {(String) hs.getAttribute("year"),(String) hs.getAttribute("month"),(String) hs.getAttribute("day")};
        String birthday = "";
        for(int i= 0;i < date.length;i++){
           if( !(date[i].isEmpty() || date[i] == null)){
                birthday += date[i];
            }else{
                birthday = "";
                break;
           }
        }
        
        String check[] = {(String) hs.getAttribute("name"), (String) hs.getAttribute("tell"), birthday, (String) hs.getAttribute("comment")};
//    name:5 tell:7 birthday:11 comment:17
//    フォームに未入力の場合上記のそれぞれ割り当てた素数を掛ける
        int k = 5;
        for (int i = 0; i < 4; i++) {
            if (check[i].isEmpty() || check[i] == null) {
                checkNum *= k;
            }

            k += 2 * (i + 1);
        }

        return checkNum;
    }

    public String warnBrank(String check, int primeNum) {
        String warn = "";
//        対応してる素数でcehckNumが割りきれるならwarn表示
        if (check != null) {
            int checkNum = Integer.valueOf(check);
            if (checkNum % primeNum == 0) {
                warn += "未記入です!";
            }
        }
        return warn;
    }
    
    public String nullCheck(String word){
        if(word == null || word.isEmpty()){
            word = "";
        }
    return word;
    }
}
