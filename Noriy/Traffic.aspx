<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Traffic.aspx.cs" Inherits="Manager" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="shortcut icon" href="favicon.ico">
    <title>Noriy Traffic</title>

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
          <a class="navbar-brand" href="Admin.aspx">Noriy</a>
        </div>

        <!-- Collect the nav links, forms, and other content for toggling -->
        <div class="collapse navbar-collapse navbar-ex1-collapse">
         <ul class="nav navbar-nav side-nav">
             <li><a href="Admin.aspx"><i class="fa fa-dashboard"></i> Dashboard</a></li>
            <li><a href="Traffic.aspx"><i class="fa fa-table"></i> Traffic</a></li>
            <li><a href="CustomList.aspx"><i class="fa fa-file"></i> My Blacklist</a></li>
            <li><a href="Categories.aspx"><i class="fa fa-bar-chart-o"></i> Categories </a></li>
          </ul>


          <form id="form1" runat="server">
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
            <h1> Traffic <small> Keep track of browsing instantly!</small></h1>
            <ol class="breadcrumb">
              <li><a href="index.html"><i class="icon-dashboard"></i> Admin Panel</a></li>
              <li class="active"><i class="icon-file-alt"></i> Traffic </li>
            </ol>
          </div>
        </div><!-- /.row -->

         
      
        <div>
          

     
      <div class="well" style="width:40%">
        <h2>Search for website</h2>
        <asp:TextBox ID="TextBox1"  class="form-control input" runat="server"></asp:TextBox>
        <br />
      <asp:Button ID="Button1" runat="server" class="btn btn-primary btn-lg btn-block" style="width:30%" onclick="Button1_Click" Text="Search" />
      <br />
      <asp:Panel ID="Panel1" runat="server" Visible="false">

        <div class="alert-warning" width="auto">
            No results found!
        </div>
      </asp:Panel>
    </div>
    <br />
     <asp:GridView ID="GridView1" runat="server" CssClass="table table-striped" 
         RowStyle-CssClass="td" HeaderStyle-CssClass="th"
               Gridlines=None AllowPaging="True"  onpageindexchanging="GridView1_PageIndexChanging1" PageSize="50">
               
         <HeaderStyle CssClass="th" />
         <PagerStyle CssClass="bs-pagination"/>
         <RowStyle CssClass="td" />

     </asp:GridView>
    </form>
 
    
        </div>
      
      </div><!-- /#page-wrapper -->

    </div><!-- /#wrapper -->

    <!-- JavaScript -->
    <script src="js/jquery-1.10.2.js"></script>
    <script src="js/bootstrap.js"></script>
    <script type="text/javascript" src="js/bs.pagination.js"></script>

  </body>
</html>

