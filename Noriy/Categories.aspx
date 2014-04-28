<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Categories.aspx.cs" Inherits="Categories" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="shortcut icon" href="favicon.ico">
    <title>Noriy Categories</title>

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
            <h1>Categories <small> Stay away from millions of malicious domains and urls!</small></h1>
            <ol class="breadcrumb">
              <li><a href="#"><i class="icon-dashboard"></i> Admin Panel</a></li>
              <li class="active"><i class="icon-file-alt"></i> Categories </li>
            </ol>
          </div>
        </div><!-- /.row -->

          
      
        <div>
            
            <asp:GridView ID="GridView1" CssClass="table table-striped" 
         RowStyle-CssClass="td" HeaderStyle-CssClass="th"
               Gridlines=None runat="server" AutoGenerateColumns="False">
                <Columns>
                    <asp:TemplateField HeaderText="ID" Visible="False">
                        <ItemTemplate>
                            <asp:Label ID="Label2" runat="server" Text='<%# Eval("ID") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Category">
                        <ItemTemplate>
                            <asp:Label ID="Label1" runat="server" Text='<%# Eval("Name") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Active">
                        <ItemTemplate>
                            <asp:CheckBox ID="CheckBox1" runat="server" AutoPostBack=true 
                                oncheckedchanged="CheckBox1_CheckedChanged" />
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
<HeaderStyle CssClass="th"></HeaderStyle>

<RowStyle CssClass="td"></RowStyle>
            </asp:GridView>
            
        </div>
      </form>
      </div><!-- /#page-wrapper -->

    </div><!-- /#wrapper -->

    <!-- JavaScript -->
    <script src="js/jquery-1.10.2.js"></script>
    <script src="js/bootstrap.js"></script>

  </body>
</html>
