<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Register.aspx.cs" Inherits="Register" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
       <title>
      New Registration
        </title>
   
   <link rel="shortcut icon" href="favicon.ico">
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">

    <!-- Bootstrap core CSS -->
    <link href="css/bootstrap.css" rel="stylesheet">

    <!-- Add custom CSS here -->
    <link href="css/sb-admin.css" rel="stylesheet">
    <link rel="stylesheet" href="font-awesome/css/font-awesome.min.css">
</head>
<body>
    <form id="form1" runat="server">

    <div class="container" style="margin: 10px;">
      <div class="row"><h2>New Registration for Noriy</h2>
  </div>
 
  <form role="form">
    <div class="form-group">
      <label for="username" class="col-md-2">
        Username
      </label>
      <div class="col-md-10">
         <asp:TextBox ID="UserName" class="form-control" placeholder="Enter Username" runat="server"></asp:TextBox>
         <br />
         <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
            ControlToValidate="UserName" ErrorMessage="Username is required." 
              CssClass="alert alert-warning"></asp:RequiredFieldValidator>
      </div>
 
 
    </div>
 
  
 
    <div class="form-group">
      <label for="emailaddress" class="col-md-2">
        Email address:
      </label>
      <div class="col-md-10">
       <asp:TextBox ID="Email" runat="server" placeholder="Enter email address" class="form-control"></asp:TextBox>
       <br />
        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
        ControlToValidate="Email" ErrorMessage="Email adress is required." 
        style="text-align: left" CssClass="alert alert-warning"></asp:RequiredFieldValidator>
    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" 
        ControlToValidate="Email" ErrorMessage=" Please enter a valid email adress!" 
        ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" 
              CssClass="alert alert-warning"></asp:RegularExpressionValidator>
        <p class="help-block">
          Example: yourname@domain.com
        </p>
      </div>
 
 
    </div>
 
    <div class="form-group">
      <label for="password" class="col-md-2">
        Password:
      </label>
      <div class="col-md-10">
        <asp:TextBox ID="Password" runat="server" class="form-control"   placeholder="Enter Password"  TextMode="Password"></asp:TextBox>
        <br />
        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
            ControlToValidate="Password" ErrorMessage="Password is required." 
              CssClass="alert alert-warning"></asp:RequiredFieldValidator>

               <asp:RegularExpressionValidator Display = "Dynamic" 
              ControlToValidate = "Password" ID="RegularExpressionValidator2" 
              ValidationExpression = "^[\s\S]{6,}$" runat="server" 
              ErrorMessage="Minimum 6 characters required." CssClass="alert alert-warning"></asp:RegularExpressionValidator>
        <p class="help-block">
          Min: 6 characters (Alphanumeric only)
        </p>
      </div>
      <br />
 
    </div>
 
    <div class="form-group">
      <label for="confirmpassword" class="col-md-2">
        Confirm Password
      </label>
      <div class="col-md-10">
        <asp:TextBox ID="PasswordConfirmation"  class="form-control" runat="server" 
            TextMode="Password"></asp:TextBox>
            <br />
        <asp:CompareValidator ID="CompareValidator1" runat="server" 
            ControlToCompare="Password" ControlToValidate="PasswordConfirmation" 
            ErrorMessage="Passwords must match! " CssClass="alert alert-warning"></asp:CompareValidator>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
            ControlToValidate="PasswordConfirmation" 
            ErrorMessage="Password confirmation is required" 
              CssClass="alert alert-warning"></asp:RequiredFieldValidator>
        
      </div>
    <br />
 
    </div>
 
 
 
 
    <div class="row">
      <div class="col-md-2">
      </div>
      <div class="col-md-10">
        <asp:Button ID="Submit" runat="server" class="btn btn-info" type="submit" style="text-align: center" Text="Register" 
            onclick="Submit_Click" />
          
        
      </div>
    </div>
  </form>
  </div>
 
  <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
  <script src="js/jquery.js"></script>
 
  <!-- Include all compiled plugins (below), or include individual files as needed -->
  <script src="js/bootstrap.min.js"></script>

  </form>

</body>
</html>
