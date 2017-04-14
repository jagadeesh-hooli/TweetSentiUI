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
import com.database.TweetManager;
import com.service.tweetTopicService;

import java.util.*;
import javax.servlet.http.*;

/**
 *
 * @author jagadeesh
 */
@WebServlet(name = "TweetTopicController", urlPatterns = {"/TweetTopicController","/index.jsp"})
public class TweetTopicController extends HttpServlet {

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
        tweetTopicService tpService = new tweetTopicService();
       if(request.getParameter("action").equals("insertTweets")){
       
            if(tpService.insertTweetsFromTopic(request.getParameter("topicName"))!= -1)
                 response.sendRedirect(request.getContextPath() + "/success.jsp");
            else
                 response.sendRedirect(request.getContextPath() + "/error.jsp");

            
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
//           response.setContentType("text/html");
//        PrintWriter out = response.getWriter();
//        out.println("<h1>in topic cont</h1>");
//        String   params =request.getParameter("topicName");
//         out.println("<h1>in topic cont"+params+"</h2>");
//        out.println();
//        out.flush();
//        TweetManager tmgr =new TweetManager();
//        
//        HttpSession session = request.getSession();
//        session.setAttribute("tweetDetailsList", tmgr.getTweetListFromTopic(request.getParameter("topicName")) );
//        response.sendRedirect(request.getContextPath() + "/viewTweetDetails.jsp");
        HttpSession session = request.getSession();
        session.setAttribute("tweettopiclist", new tweetTopicService().getTweetTopicList() );
        response.sendRedirect(request.getContextPath() + "/dashBoard.jsp");
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
