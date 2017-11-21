
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
public class challenge5 {
    public static void main(String[] args) {
        // TODO code application logic here
        String url = "http://localhost:8080/対象ファイル.jsp?total=6000&kuy=242" ;
        String query = url.substring(url.indexOf("?") + 1,url.length());
        String[] dates = query.split("&");
        for (String date : dates) {
            String num = date.substring(date.indexOf("=") + 1, date.length());
            logic(num);
            System.out.println("");
        }
    }
    static void logic(String data){
            int num = Integer.parseInt(data); //2 3 5 7
            ArrayList<Integer> primeFactors = new ArrayList<>();
            System.out.print(data + " ");
            for(int i = 2;i <= 7;){
                if(num % i == 0){
                    primeFactors.add(i);
                    System.out.print(i+" ");
                    boolean check = true;
                    while(check){
                        num /= i;
                        if(num % i != 0){
                            check = false;
                        }
                    }
                }
                if(i == 2){
                    i++;
                }else{
                    i += 2;
                }
            }
            if(num != 1){
                System.out.println(num);
            }
        }
    
    
}
