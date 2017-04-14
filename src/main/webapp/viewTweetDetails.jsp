<%--
  Created by IntelliJ IDEA.
  User: jagadeesh
  Date: 4/3/17
  Time: 11:50 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="java.util.*" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <meta charset="utf-8"/>
        <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
        <title>Free Bootstrap Admin Template : Dream</title>
        <!-- Bootstrap Styles-->
        <link href="assets/css/bootstrap.css" rel="stylesheet"/>
        <!-- FontAwesome Styles-->
        <link href="assets/css/font-awesome.css" rel="stylesheet"/>
        <!-- Morris Chart Styles-->

        <!-- Custom Styles-->
        <link href="assets/css/custom-styles.css" rel="stylesheet"/>
        <!-- Google Fonts-->
        <link href='http://fonts.googleapis.com/css?family=Open+Sans' rel='stylesheet' type='text/css'/>
        <!-- TABLE STYLES-->
        <link href="assets/js/dataTables/dataTables.bootstrap.css" rel="stylesheet"/>
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
                            <a href="index.jsp"><i class="fa fa-dashboard"></i>Tweet Dashboard</a>
                        </li>

                        <li>
                            <a class="active-menu" href="viewTweetDetails.jsp"><i class="fa fa-table"></i> View
                                Tweet-Details</a>
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
                                Tweet Sentiment Details
                            </h1>
                        </div>
                    </div>
                    <!-- /. ROW  -->

                    <div class="row">
                        <div class="col-md-12">
                            <!-- Advanced Tables -->
                            <div class="panel panel-default">
                                <div class="panel-heading">

                                    <div class="btn-group">
                                        <button class="btn btn-danger disabled">Tweet Topic :</button>
                                        <button data-toggle="dropdown" class="btn btn-primary dropdown-toggle"
                                                style="min-width:120px">--Please Select--<span class="caret"></span></button>
                                        <ul class="dropdown-menu">
                                            <c:forEach var="topicName" items="${sessionScope.tweettopiclist}">
                                                <li><a href="/TweetUI2/TweetOpsController?action=getTweetData&topicName=${topicName} "> ${topicName} </a></li>
                                                </c:forEach>
                                            <input type="hidden" name="tweetTopicSelected" id="tweetTopicSelected" value="${sessionScope.tweetTopicSelected}" /> 
                                        </ul>
                                    </div>
                                </div>

                                <div class="panel-body">
                                    <div class="table-responsive">
                                        <table class="table table-striped table-bordered table-hover"
                                               id="dataTables-example">
                                            <thead>
                                                <tr>
                                                    <th>Tweet Id</th>
                                                    <th>Date of Tweet</th>
                                                    <th>Topic</th>
                                                    <th>Sentiment Score</th>
                                                    <th>Description</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <c:forEach var="tweetDetails" items="${sessionScope.tweetDetailsList}">
                                                    <tr>
                                                        <td>${tweetDetails.get("Id")} </td>
                                                        <td>${tweetDetails.get("DateOfTweet")} </td>
                                                        <td>${tweetDetails.get("Topic")} </td>
                                                        <td>${tweetDetails.get("SentiScore")} </td>
                                                        <td>${tweetDetails.get("Desc")} </td>
                                                    </tr>
                                                </c:forEach>

                                            </tbody>
                                        </table>
                                    </div>

                                </div>




                            </div>
                            <!--End Advanced Tables -->
                        </div>
                    </div>

                </div>

            </div>
            <!-- /. PAGE INNER  -->
        </div>
        <!-- /. PAGE WRAPPER  -->
        <!-- /. WRAPPER  -->
        <!-- JS Scripts-->
        <!-- jQuery Js -->
        <script src="assets/js/jquery-1.10.2.js"></script>
        <!-- Bootstrap Js -->
        <script src="assets/js/bootstrap.min.js"></script>
        <!-- Metis Menu Js -->

        <script src="assets/js/dataTables/jquery.dataTables.js"></script>
        <script src="assets/js/dataTables/dataTables.bootstrap.js"></script>
        <script>
            $(document).ready(function () {
                $('#dataTables-example').dataTable();
            });
        </script>

        <script>


            jQuery(window).load(function () {
                var selText = $('#tweetTopicSelected').val();
                
                if (selText === '')
                    selText = '--Please Select--';
                $('.btn-group').find('.dropdown-toggle').html(selText + ' <span class="caret"></span>');

            });


        </script>

    </body>
</html>

