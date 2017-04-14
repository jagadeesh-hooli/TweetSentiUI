<%--
  Created by IntelliJ IDEA.
  User: jagadeesh
  Date: 4/4/17
  Time: 12:30 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
    <!-- Custom Styles-->
    <link href="assets/css/custom-styles.css" rel="stylesheet"/>
    <!-- Google Fonts-->
    <link href='http://fonts.googleapis.com/css?family=Open+Sans' rel='stylesheet' type='text/css'/>
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
                    <a href="viewTweetDetails.jsp"><i class="fa fa-table"></i> View Tweet-Details</a>
                </li>
                <li>
                    <a class="active-menu" href="insertTweets.jsp"><i class="fa fa-edit"></i> Insert Tweets </a>
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
                        New tweets

                    </h1>
                </div>
            </div>
            <!-- /. ROW  -->
            <div class="row">
                <div class="col-lg-12">
                    <div class="panel panel-default">

                        <div class="panel-body">
                            <div class="row">
                                <%--  <div class="col-lg-6">
                                      <form id="tweetInsertForm" role="form">
                                          <div class="form-group">
                                              <label>New Tweet topic</label>
                                              <input class="form-control" placeholder="Enter text" name="fullName">
                                              <p class="help-block">Example block-level help text here.</p>
                                          </div>

                                          <button type="submit" class="btn btn-primary">Submit</button>


                                      </form>
                                  </div>--%>
                                <form class="form-horizontal" action="/TweetUI2/TweetTopicController?action=insertTweets " method="post" id="reg_form">
                                    <fieldset>

                                        <!-- Form Name -->
                                        <legend> Tweet Information</legend>


                                        <div class="form-group">
                                            <label class="col-md-4 control-label">Topic Name:</label>
                                            <div class="col-md-6  inputGroupContainer">
                                                <div class="input-group"><span class="input-group-addon"><i
                                                        class="glyphicon glyphicon-pencil"></i></span>
                                                    
                                                        <input name="topicName" placeholder="Enter Text" class="form-control"
                                                           type="text">
                                                </div>
                                            </div>
                                        </div>


                                        <div class="form-group">
                                            <label class="col-md-4 control-label"></label>
                                            <div class="col-md-4">
                                                <button type="submit" class="btn btn-warning">Insert <span
                                                        class="glyphicon glyphicon-send"></span></button>
                                            </div>
                                        </div>


                                    </fieldset>


                                </form>


                            </div>
                            <!-- /.row (nested) -->
                        </div>
                        <!-- /.panel-body -->
                    </div>
                    <!-- /.panel -->
                </div>
                <!-- /.col-lg-12 -->
            </div>

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

<script src='http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>
<script src='http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js'></script>
<script src='http://cdnjs.cloudflare.com/ajax/libs/bootstrap-validator/0.4.5/js/bootstrapvalidator.min.js'></script>

<script type="text/javascript">

    $(document).ready(function () {
        $('#reg_form').bootstrapValidator({
            // To use feedback icons, ensure that you use Bootstrap v3.1.0 or later
            feedbackIcons: {
                valid: 'glyphicon glyphicon-ok',
                invalid: 'glyphicon glyphicon-remove',
                validating: 'glyphicon glyphicon-refresh'
            },
            fields: {

                topicName: {
                    validators: {
                        notEmpty: {
                            message: 'Please enter Tweet topic name'
                        },

                        stringLength: {
                            min: 3,
                            message:'Topic name should be atleast 3 characters long'
                        },
                    }
                },



            }
        })


            .on('success.form.bv', function (e) {
                $('#success_message').slideDown({opacity: "show"}, "slow") // Do something ...
                $('#reg_form').data('bootstrapValidator').resetForm();

                // Prevent form submission
                e.preventDefault();

                // Get the form instance
                var $form = $(e.target);

                // Get the BootstrapValidator instance
                var bv = $form.data('bootstrapValidator');

                // Use Ajax to submit form data
                $.post($form.attr('action'), $form.serialize(), function (result) {
                    console.log(result);
                }, 'json');
            });
    });


</script>
</body>
</html>

