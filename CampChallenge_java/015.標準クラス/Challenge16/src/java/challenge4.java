
import java.util.ArrayList;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author Yusuke
 */
public class challenge4 {
     public static void main(String[] args) {
        String url = "http://localhost:8080/対象ファイル.jsp?total=6000&count=12&type=1" ;
        String query = url.substring(url.indexOf("?") + 1,url.length());
        String[] dates = query.split("&");
        ArrayList<Integer> data2 = new ArrayList<>();
        for(int i = 0;i < dates.length;i++){
            String num = dates[i].substring(dates[i].indexOf("=") + 1,dates[i].length());
            data2.add(Integer.parseInt(num));
            switch(i){
                case 1:
                    int value = data2.get(0) / data2.get(1);
                    System.out.println("一つあたり"+value+"円");
                    if(data2.get(0) >= 5000){
                        System.out.println("ポイント:5%");
                    }else if(data2.get(0) >= 3000){
                        System.out.println("ポイント:4％");
                    }
                    break;
                      case 2:
                    switch(data2.get(2)){
                        case 1:
                            System.out.println("雑貨");
                            break;
                        case 2:
                            System.out.println("生鮮食品");
                            break;
                        case 3:
                            System.out.println("その他");
                            break;
                    }break;
                }
        }

    }
}
