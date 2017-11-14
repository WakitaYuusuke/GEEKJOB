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

abstract class Human {
    ArrayList<Integer> myCards = new ArrayList<>();
    public abstract int open();
    public abstract void setCard();
    public abstract boolean checkSum();
}
