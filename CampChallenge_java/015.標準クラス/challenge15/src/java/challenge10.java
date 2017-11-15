/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Random;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Yusuke
 */
@WebServlet(urlPatterns = {"/challenge10"})
public class challenge10 extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
           
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy年MM月dd日HH時mm分ss秒");
            Date day = new Date();
            
            File fp = new File("C:\\Users\\Yusuke\\Desktop\\テスト.txt");
            try{
                fp.createNewFile();
            }catch(IOException e){
                out.println(e);
            }
            
            FileWriter fw = new FileWriter(fp);
            fw.write(sdf.format(day));
            fw.write(" 開始\r\n ");
            
            
            Random rnd = new Random();
            double num1 = 10+(0.1*rnd.nextInt(10));
            double num2 = rnd.nextInt(4);
            double num3 = Math.pow(num1, num2);
            if(Math.round(num3) > num3){
                out.println(num3+"切り上げ！"+Math.round(num3)+"<br>");
            }else{
                out.println(num3+"切り下げ！"+Math.round(num3)+"<br>");
                        }
            
            fw.write(sdf.format(day));
            fw.write(" 終了\r\n ");
            fw.close();
            
            FileReader fr = new FileReader(fp);
            BufferedReader br = new BufferedReader(fr);
            String str;
            while((str = br.readLine()) != null){
            out.println(str+"<br>");
            }
            br.close();
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet challenge10</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet challenge10 at " + request.getContextPath() + "</h1>");
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
