/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package blackjack;


import java.util.ArrayList;

/**
 *
 * @author Yusuke
 */
public class Main {
static Dealer dealer = new Dealer();
static User user = new User();
    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        // TODO code application logic here
       
   
       user.drawCard  = dealer.deal();
       user.setCard();
       System.out.println("あなたの手札");
                for(int i = 0;i < user.myCards.size();i++){
                    outPut(user.myCards.get(i));
                } 
        
       dealer.drawCard = dealer.deal();
       dealer.setCard();
       System.out.println("\nディーラーの手札");
       outPut(dealer.myCards.get(0));
       System.out.print(" ?");
       
     
       
        
        while(true){
            if(user.checkSum()){
                dealer.hit();
                user.setCard();
                System.out.println("あなたのカードは\n");
                for(int i = 0;i < user.myCards.size();i++){
                    outPut(user.myCards.get(i));
                } 
            }else{
                System.out.println("あなたの合計値は"+user.sum);
                break;
            }
        }
       
        
         while(true){
            System.out.println("現在のディーラーの手札");
            for(int i = 0;i < dealer.myCards.size();i++){
                    outPut(dealer.myCards.get(i));
                } 
            if(dealer.checkSum()){
                dealer.hit();
                System.out.println("\nディーラーがヒットしました");
                dealer.setCard();
            }else{
                System.out.println("\nディーラーの合計値は"+dealer.open());
                break;
            }
        }
       
         result();
        
    }
    
    static void result(){
        if(dealer.burst == true || user.burst == true){
            if(dealer.burst == true && user.burst == true){
                System.out.println("どちらもバーストしたので引き分けです");
            }else if(dealer.burst){
                System.out.println("ディーラーがバーストしたのであなたの勝ちです");
            }else if(user.burst){
                System.out.println("バーストしたのであなたの負けです");
            }
        }else if(dealer.open() > user.open()){
            System.out.println("あなたの負けです");
        }else if(dealer.open() == user.open()){
            System.out.println("引き分けです");
        }else if(dealer.open() < user.open()){
            System.out.println("あなたの勝ちです");
        }
    }
    
    static void outPut(Integer outPutC){ 
            if(outPutC > 10){
                switch(outPutC){
                    case 11:
                        System.out.print("Jack ");
                        break;
                    case 12:
                        System.out.print("Queen ");
                        break;
                    case 13:
                        System.out.print("King ");
                        break;
                }        
            }else{
                       System.out.print(outPutC+" "); 
            }     
                  
    }       
    
   
    }     
    
    
   
       
    
    

