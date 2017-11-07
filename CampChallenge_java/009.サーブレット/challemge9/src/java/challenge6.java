/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.Scanner;
import java.util.Random;

/**
 *
 * @author Yusuke
 */
@WebServlet(urlPatterns = {"/challenge6"})
public class challenge6 extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    
    String[] makeProfiel (int num,PrintWriter pw){
        Scanner scan = new Scanner(System.in);
        String[] profiel = new String[4];
        String[] profiel1 = {"1","Yuusuke","静岡県","H10/5/15"};
        String[] profiel2 = {"2","Asan",null,"～年～月～日"};
        String[] profiel3 = {"3","Bsan","東京都","～年～月～日"};
        
        if(num == 0){
             System.arraycopy(profiel1, 0, profiel, 0, 4);
         }else if(num == 1){
             System.arraycopy(profiel2,0,profiel,0,4);
         }else if(num == 2){
             System.arraycopy(profiel3, 0, profiel, 0, 4);
         }
        
        return profiel;
    }
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            for(int i = 0;i < 3;i ++){
                String[] profiel = makeProfiel(i,out);
                for(int ii = 1;ii < 4;ii++){
                    if(profiel[ii] == null){
                        continue;
                    }
                    out.print(profiel[ii]+"<br>");
                }
                
            }
            
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet challenge6</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet challenge6 at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
