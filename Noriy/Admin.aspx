<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Admin.aspx.cs" Inherits="Admin" %>

<%@ Register assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" namespace="System.Web.UI.DataVisualization.Charting" tagprefix="asp" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="shortcut icon" href="favicon.ico">
    <title>Noriy Dashboard</title>

    <!-- Bootstrap core CSS -->
    <link href="css/bootstrap.css" rel="stylesheet">

    <!-- Add custom CSS here -->
    <link href="css/sb-admin.css" rel="stylesheet">
    <link rel="stylesheet" href="font-awesome/css/font-awesome.min.css">
</head>
    
  <body>

    <div id="wrapper">

      <!-- Sidebar -->
      <nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
        <!-- Brand and toggle get grouped for better mobile display -->
        <div class="navbar-header">
          <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-ex1-collapse">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
          <a class="navbar-brand" href="#">Noriy</a>
        </div>

        <!-- Collect the nav links, forms, and other content for toggling -->
        <div class="collapse navbar-collapse navbar-ex1-collapse">
          <ul class="nav navbar-nav side-nav">
             <li><a href="Admin.aspx"><i class="fa fa-dashboard"></i> Dashboard</a></li>
            <li><a href="Traffic.aspx"><i class="fa fa-table"></i> Traffic</a></li>
            <li><a href="CustomList.aspx"><i class="fa fa-file"></i> My Blacklist</a></li>
            <li><a href="Categories.aspx"><i class="fa fa-bar-chart-o"></i> Categories </a></li>
          </ul>

          <form id="form1" runat=server>
          <ul class="nav navbar-nav navbar-right navbar-user">
            
       
             <li class="dropdown user-dropdown">
              <a href="#" class="dropdown-toggle" data-toggle="dropdown"><i class="fa fa-user"></i> <asp:label id="NameLabel" runat="server">Name</asp:label> <b class="caret"></b></a>
              <ul class="dropdown-menu">
                <li><asp:LinkButton ID="LinkButtonLogout" runat="server" OnClick="LinkButtonLogout_Click" ><i class="fa fa-power-off"></i> Logout</asp:LinkButton></li>
                
              </ul>
            </li>
          </ul>
        </div><!-- /.navbar-collapse -->
      </nav>

    

      <div id="page-wrapper">

        <div class="row">
          <div class="col-lg-12">
            <h1>Dashboard<small> Keep control, keep safe!</small></h1>
            <ol class="breadcrumb">
              <li><a href="#"><i class="icon-dashboard"></i> Admin Panel</a></li>
              <li class="active"><i class="icon-file-alt"></i> Dashboard </li>
            </ol>
          </div>
        </div><!-- /.row -->

          
      
        <div>
            <div class="alert alert-success alert-dismissable">

    <button class="close" aria-hidden="true" data-dismiss="alert" type="button">x</button>
    Welcome to Noriy! Here you can view statistics which will help you to improve the experience!

</div>

            <div class="row">

    <div class="col-lg-3">
        <div class="panel panel-warning">
            <div class="panel-heading">
                <div class="row">
                    <div class="col-xs-6">
                       <i class="fa fa-file fa-5x"></i>
                    </div>
                    <div class="col-xs-6 text-right">
                        <p class="announcement-heading">

                            <asp:Label runat="server" ID="Blocked">0</asp:Label>

                        </p>
                        <p class="announcement-text">

                            My Blacklist Length

                        </p>
                    </div>
                </div>
            </div>
            <a href="CustomList.aspx">
                <div class="panel-footer announcement-bottom">
                    <div class="row">
                        <div class="col-xs-6">
                        
                            Manage My Blacklist

                        </div>
                        <div class="col-xs-6 text-right">
                            <i class="fa fa-arrow-circle-right"></i>
                        </div>
                    </div>
                </div>
            </a>
        </div>
    </div>
    <div class="col-lg-3">
        <div class="panel panel-success">
            <div class="panel-heading">
                <div class="row">
                    <div class="col-xs-6">
                        <i class="fa fa-archive fa-5x"></i>
                    </div>
                    <div class="col-xs-6 text-right">
                        <p class="announcement-heading">

                            <asp:Label ID="Traffic" runat="server">0</asp:Label>

                        </p>
                        <p class="announcement-text">

                            Registered Urls

                        </p>
                    </div>
                </div>
            </div>
            <a href="Traffic.aspx">
                <div class="panel-footer announcement-bottom">
                    <div class="row">
                        <div class="col-xs-6">

                            View Traffic

                        </div>
                        <div class="col-xs-6 text-right">
                            <i class="fa fa-arrow-circle-right"></i>
                        </div>
                    </div>
                </div>
            </a>
        </div>
    </div>
    <div class="col-lg-3">
        <div class="panel panel-info">
            <div class="panel-heading">
                <div class="row">
                    <div class="col-xs-6">
                        <i class="fa fa-tasks fa-5x"></i>
                    </div>
                    <div class="col-xs-6 text-right">
                        <p class="announcement-heading">

                            <asp:Label ID="Categories" runat="server">0</asp:Label>

                        </p>
                        <p class="announcement-text">

                            Blocked Categories

                        </p>
                    </div>
                </div>
            </div>
            <a href="Categories.aspx">
                <div class="panel-footer announcement-bottom">
                    <div class="row">
                        <div class="col-xs-6">

                        Select Categories

                        </div>
                        <div class="col-xs-6 text-right">
                            <i class="fa fa-arrow-circle-right"></i>
                        </div>
                    </div>
                </div>
            </a>
        </div>
    </div>
    <div class="col-lg-3">
        <div class="panel panel-danger">
            <div class="panel-heading">
                <div class="row">
                    <div class="col-xs-6">
                        <i class="fa fa-comments fa-5x"></i>
                    </div>
                    <div class="col-xs-6 text-right">
                        <p class="announcement-heading">

                            <asp:Label ID="Attempts" runat="server">0</asp:Label>

                        </p>
                        <p class="announcement-text">

                            Blocked Attempts 

                        </p>
                    </div>
                </div>
            </div>
            <a href="Traffic.aspx">
                <div class="panel-footer announcement-bottom">
                    <div class="row">
                        <div class="col-xs-6">
                            
                            View Traffic

                        </div>
                        <div class="col-xs-6 text-right">
                            <i class="fa fa-arrow-circle-right"></i>
                        </div>
                    </div>
                </div>
            </a>
        </div>
    </div>

</div>
   
    
    
    </div>
      </form>
      </div><!-- /#page-wrapper -->

    </div><!-- /#wrapper -->

    <!-- JavaScript -->
    <script src="js/jquery-1.10.2.js"></script>
    <script src="js/bootstrap.js"></script>

      </div>
      

  </body>
</html>
