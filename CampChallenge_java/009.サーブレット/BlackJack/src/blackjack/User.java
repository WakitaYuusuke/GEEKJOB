package blackjack;
import static blackjack.Main.user;
import java.util.ArrayList;
import java.util.Scanner;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author Yusuke
 */
public class User extends Human{
    Scanner scn = new Scanner(System.in);
    ArrayList<Integer> drawCard = new ArrayList<>();
    int sum = 0;
    boolean burst = false;
    
    @Override
    public int open(){
        int num = 0 ;
        for(int i = 0;i < myCards.size();i++){
            if(myCards.get(i) > 10){
                num += 10;
            }else{
                num += myCards.get(i);
            }
        }    
        return num;
    }
    
    @Override
    public void setCard(){
        int times = drawCard.size();
            for(int i = 0;i < times;i++){
                Integer addCard = drawCard.get(0);
                myCards.add(addCard);
                this.drawCard.remove(0);
                
        }
        
    }
    @Override
    public boolean checkSum(){
        boolean check = true;
        sum = open();
        if(sum >= 21){
            check = false;
            if(sum > 21){
                burst = true;
            }
        }else{
            System.out.println("\n1:Hit\n2:Stand");
            int key = scn.nextInt();
            if(key == 1){
                check = true;
            }else{
                check = false;
            }
        }
        return check;
    }
}
