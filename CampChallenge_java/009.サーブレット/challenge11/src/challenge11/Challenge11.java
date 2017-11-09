/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package challenge11;

import java.util.Scanner;

/**
 *
 * @author Yusuke
 */
public class Challenge11 {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        // TODO code application logic here
        Kadai kadai = new Kadai();
        
        kadai.SetNum();
        kadai.printer();
        
    }
    
}

class  Kadai{
    public int a;
    public int b;
    
    public void SetNum(){
        Scanner scn = new Scanner(System.in);
        System.out.println("数字を入力してください");
        a = scn.nextInt();
        System.out.println("もう一度数字を入力してください");
        b = scn.nextInt();
    }
    
    public void printer(){
        System.out.println(a);
        System.out.println(b);
    }
}
