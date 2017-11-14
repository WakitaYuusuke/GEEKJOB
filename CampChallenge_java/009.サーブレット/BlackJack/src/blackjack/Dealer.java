/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author Yusuke
 */
package blackjack; 
import java.util.ArrayList;
import java.util.Random;
public class Dealer extends Human {
    ArrayList<Integer> cards;
    ArrayList<String> marks;
    ArrayList<Integer> drawCard = new ArrayList<>();
    Random rnd = new Random();
    int sum = 0;
    boolean burst = false;
    
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
    public boolean checkSum(){
       
        boolean check = false;
        int sum = open();
        if(sum>=21){
            check = false;
            if(sum > 21){
                burst = true;
            }
        }else if(sum < 17){
            check = true;
        }else if(sum >= 17){
            if(rnd.nextInt(10) % 2 == 0)
                check = true;
        }else{
            check = false;
        }
        return check;
    }
    
    
    Dealer(){
        this.cards = new ArrayList<>();
        this.marks = new ArrayList<>();
        
        for(int i = 0;i < 4;i++){
            for(int k = 1;k < 14;k++){
                cards.add(k);
            }
        }
       
    }
    public ArrayList hit(){
        int index = rnd.nextInt(cards.size());
        drawCard.add(cards.get(index));
        cards.remove(index);
        return drawCard;
    }
    public ArrayList deal(){
        hit();
        hit();
        return drawCard;
    }
    
}
