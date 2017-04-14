<%--
  Created by IntelliJ IDEA.
  User: jagadeesh
  Date: 4/3/17
  Time: 1:33 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="java.util.*" %>
﻿<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">

    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <title>Twitter Sentimental analysis</title>
        <!-- Bootstrap Styles-->
        <link href="assets/css/bootstrap.css" rel="stylesheet" />
        <!-- FontAwesome Styles-->
        <link href="assets/css/font-awesome.css" rel="stylesheet" />
        <!-- Morris Chart Styles-->
        <link href="assets/js/morris/morris-0.4.3.min.css" rel="stylesheet" />
        <!-- Custom Styles-->
        <link href="assets/css/custom-styles.css" rel="stylesheet" />
        <!-- Google Fonts-->
        <link href='http://fonts.googleapis.com/css?family=Open+Sans' rel='stylesheet' type='text/css' />
    </head>

    <body>
        <div id="wrapper">
            <nav class="navbar navbar-default top-navbar" role="navigation">
                <div class="navbar-header">

                    <a class="navbar-brand" href="">TweetSentiAnalyzer </a>
                </div>


            </nav>
            <!--/. NAV TOP  -->
            <nav class="navbar-default navbar-side" role="navigation">
                <div class="sidebar-collapse">
                    <ul class="nav" id="main-menu">

                        <li>
                            <a class="active-menu" href="index.jsp"><i class="fa fa-dashboard"></i>Tweet Dashboard</a>
                        </li>

                        <li>
                            <a href="viewTweetDetails.jsp"><i class="fa fa-table"></i> View Tweet-Details</a>
                        </li>
                        <li>
                            <a href="insertTweets.jsp"><i class="fa fa-edit"></i> Insert Tweets </a>
                        </li>


                    </ul>

                </div>

            </nav>
            <!-- /. NAV SIDE  -->
            <div id="page-wrapper">
                <div id="page-inner">


                    <div class="row">
                        <div class="col-md-12">
                            <h1 class="page-header">
                                Dashboard <br/>
                            </h1>
                        </div>
                    </div>
                    <!-- /. ROW  -->
                    <input type="hidden" name="bc_y" id="bc_y" value="Tweets"/>
                    <input type="hidden" name="bc_a" id="bc_a" value="${sessionScope.positiveTweetCount}" />
                    <input type="hidden" name="bc_b" id="bc_b" value="${sessionScope.negativeTweetCount}" />
                    <div class="row">


                        <div class="col-md-3 col-sm-12 col-xs-12">
                            <div class="panel panel-danger text-center no-boder bg-color-red">
                                <div class="panel-body">
                                    <i class="fa fa fa-comments fa-5x"></i>
                                    <h3>Tweet Topic</h3>

                                </div>
                                <div class="panel-footer back-footer-red">

                                    <div class="btn-group" >

                                        <button data-toggle="dropdown" class="btn btn-primary dropdown-toggle" style="min-width:120px">--Please Select--<span class="caret"></span></button>
                                        <ul class="dropdown-menu">
                                            <c:forEach var="topicName" items="${sessionScope.tweettopiclist}">
                                                <li><a href="/TweetUI2/TweetOpsController?action=getdashboardData&topicName=${topicName}">${topicName}</a></li>
                                                </c:forEach>
                                            <input type="hidden" name="tweetTopicSelected" id="tweetTopicSelected" value="${sessionScope.tweetTopicSelected}"   />  
                                        </ul>
                                    </div>

                                </div>
                            </div>
                        </div>
                        <div class="col-md-3 col-sm-12 col-xs-12">
                            <div class="panel panel-primary text-center no-boder bg-color-green">
                                <div class="panel-body">
                                    <i class="fa fa-bar-chart-o fa-5x"></i>
                                    <h3>${(sessionScope.totalTweetCount==null) ? 0:sessionScope.totalTweetCount} </h3>

                                </div>
                                <div class="panel-footer back-footer-green" style="min-height:53px;">
                                    Tweet


                                </div>
                            </div>
                        </div>
                    </div>


                    <div class="row">


                        <div class="col-md-9 col-sm-12 col-xs-12" style="width:50% ">
                            <div class="panel panel-default">
                                <div class="panel-heading">
                                    Bar Chart
                                </div>
                                <div class="panel-body">

                                    <div id="morris-bar-chart">

                                    </div>

                                </div>
                            </div>
                        </div>
                        <div class="col-md-3 col-sm-12 col-xs-12" style="width:50%">
                            <div class="panel panel-default">
                                <div class="panel-heading">
                                    Donut Chart
                                </div>
                                <div class="panel-body">

                                    <div id="morris-donut-chart"></div>
                                </div>
                            </div>
                        </div>

                    </div>
                    <!-- /. ROW  -->


                    <!-- /. ROW  -->

                </div>
                <!-- /. PAGE INNER  -->
            </div>
            <!-- /. PAGE WRAPPER  -->
        </div>
        <!-- /. WRAPPER  -->
        <!-- JS Scripts-->
        <!-- jQuery Js -->
        <script src="assets/js/jquery-1.10.2.js"></script>
        <!-- Bootstrap Js -->
        <script src="assets/js/bootstrap.min.js"></script>
        <!-- Metis Menu Js -->
        <script src="assets/js/jquery.metisMenu.js"></script>
        <!-- Morris Chart Js -->
        <script src="assets/js/morris/raphael-2.1.0.min.js"></script>
        <script src="assets/js/morris/morris.js"></script>
        <!-- Custom Js -->
        <script src="assets/js/custom-scripts.js"></script>

        <script>
           jQuery(window).load(function () {
                var selText = $('#tweetTopicSelected').val();
               if(selText==='')
                   selText='--Please Select--'; 
                $('.btn-group').find('.dropdown-toggle').html(selText + ' <span class="caret"></span>');

            });
        </script>

    </body>

</html>
