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
    
    String[] makeProfiel (String checkId,PrintWriter pw){
        Scanner scan = new Scanner(System.in);
        String[] profiel = new String[4];
        String[] profiel1 = {"Yuusuke","1","...都道府県...市町村...","H10/5/15"};
        String[] profiel2 = {"A","2","...都道府県...市町村...","～年～月～日"};
        String[] profiel3 = {"B","3","...都道府県...市町村...","～年～月～日"};
        
        if(checkId.equals(profiel1[1])){
            System.arraycopy(profiel1, 0, profiel, 0, 4);
        }else if(checkId.equals(profiel2[1])){
            System.arraycopy(profiel2,0,profiel,0,4);
        }else if(checkId.equals(profiel3[1])){
            System.arraycopy(profiel3, 0, profiel, 0, 4);
        }
         return profiel;
    }
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            String id = "2";
            String[] profiel = makeProfiel(id,out);
            
            out.print("Name: "+profiel[0]+"<br>");
            out.print("Addres: "+profiel[2]+"<br>");
            out.print("Birthday: "+profiel[3]+"<br>");
            
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
