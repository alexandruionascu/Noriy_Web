<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Login" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <link rel="shortcut icon" href="favicon.ico">
    <style type="text/css">
        .style1
        {
            width: 100%;
        }
        .style2
        {
            width: 309px;
        }
        .style3
        {
            width: 178px;
        }
    </style>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Noriy Login</title>

    <!-- Bootstrap core CSS -->
    <link href="css/bootstrap.css" rel="stylesheet">

    <!-- Add custom CSS here -->
    <link href="css/sb-admin.css" rel="stylesheet">
    <link rel="stylesheet" href="font-awesome/css/font-awesome.min.css">
</head>
<body>
    <form id="form1" runat="server">
    
    <table class="style1">
        <tr>
           
                
            </td>
            <td>
                
            </td>
        </tr>
        <tr>
   
                
            </td>
            <td>
               
            </td>
        </tr>
        <tr>
            <td class="style2">
                &nbsp;</td>
            <td class="style3">
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style2">
                
            </td>
            <td class="style3">
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
    </table>
   

    <!--login modal-->
   
<div id="loginModal" class="modal show" tabindex="-1" role="dialog" aria-hidden="true">
  <div class="modal-dialog">
  <div class="modal-content">
      <div class="modal-header">
         
          <h1 class="text-center">Login</h1>
      </div>
      <div class="modal-body">
          <form class="form col-md-12 center-block">
            <div class="form-group">
              <asp:TextBox ID="Username" runat="server" placeholder="Username" class="form-control input-lg"></asp:TextBox>
            </div>
            <div class="form-group">
              <asp:TextBox ID="Password" runat="server" TextMode="Password" class="form-control input-lg" placeholder="Password"></asp:TextBox>
            </div>
            <div class="form-group">
                <asp:Button ID="Submit" runat="server" class="btn btn-primary btn-lg btn-block" onclick="Submit_Click"  Text="Login"/>
              <span class="pull-right"><a href="Register.aspx">Register</a></span><span><a href="Contact.aspx">Need help?</a></span>
            </div>
          </form>
      </div>
      <div class="modal-footer">
      
                    
          <div class="col-md-12">
          <button class="btn" data-dismiss="modal" aria-hidden="true">Cancel</button>
		  </div>	
      </div>
  </div>
  <br />


<div style="text-align:center">
<asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
        ControlToValidate="Username" ErrorMessage="Username is required" 
        CssClass="alert alert-danger" Display="Dynamic" Font-Strikeout="False"></asp:RequiredFieldValidator> 
<br />
<br />
<br />

<asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
        ControlToValidate="Password" ErrorMessage="Password is required" 
        CssClass="alert alert-danger" Display="Dynamic"></asp:RequiredFieldValidator>
        </div>

  </div>
</div>
 </form>
</body>
</html>
