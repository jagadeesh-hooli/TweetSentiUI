/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.controller;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.database.TweetManager;
import com.service.tweetDetailService;
import com.service.tweetTopicService;

import java.util.*;
import javax.servlet.http.*;

/**
 *
 * @author jagadeesh
 */
@WebServlet(name = "TweetOpsController", urlPatterns = {"/TweetOpsController"})
public class TweetOpsController extends HttpServlet {

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
        TweetManager tmgr = new TweetManager();
        List<String> tweettopiclist = tmgr.getAllTweetTopics();

        HttpSession session = request.getSession();
        session.setAttribute("tweettopiclist", tweettopiclist);
        session.setAttribute("tweetDetailsList", tmgr.getTweetListFromTopic("#trump"));
        response.sendRedirect(request.getContextPath() + "/viewTweetDetails.jsp");

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

        HttpSession session = request.getSession();
        tweetDetailService tdService = new tweetDetailService();
        session.setAttribute("tweetTopicSelected", request.getParameter("topicName"));
        if (request.getParameter("action").equals("getdashboardData")) {
            HashMap<String, Integer> dashboardData = tdService.getDashBoardTweetData(request.getParameter("topicName"));
            session.setAttribute("negativeTweetCount", Integer.parseInt(dashboardData.get("negativeTweetCount").toString()));
            session.setAttribute("positiveTweetCount", Integer.parseInt(dashboardData.get("positiveTweetCount").toString()));
            session.setAttribute("totalTweetCount", Integer.parseInt(dashboardData.get("totalTweetCount").toString()));

            response.sendRedirect(request.getContextPath() + "/dashBoard.jsp");
        }
        if (request.getParameter("action").equals("getTweetData")) {
            session.setAttribute("tweetDetailsList", tdService.getTweetDetailListFromTopic(request.getParameter("topicName")));
            response.sendRedirect(request.getContextPath() + "/viewTweetDetails.jsp");
        }

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
