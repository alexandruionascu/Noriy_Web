<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Contact.aspx.cs" Inherits="Contact" %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="shortcut icon" href="favicon.ico">

    <title>Noriy Contact</title>

    <!-- Bootstrap core CSS -->
    
    <link rel="stylesheet" href="font-awesome/css/font-awesome.min.css">
    <link href="css/bootstrap.css" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="cover.css" rel="stylesheet">

    <!-- Just for debugging purposes. Don't actually copy this line! -->
    <!--[if lt IE 9]><script src="../../assets/js/ie8-responsive-file-warning.js"></script><![endif]-->

    <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
      <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
  </head>

  <body>

    <div class="site-wrapper">

      <div class="site-wrapper-inner">

        <div class="cover-container">

          <div class="masthead clearfix">
            <div class="inner">
              <h3 class="masthead-brand">Noriy</h3>
              <ul class="nav masthead-nav">
                <li><a href="Home.aspx">Home</a></li>
                <li><a href="Login.aspx">Login</a></li>
                <li><a href="Register.aspx">Register</a></li>
                <li><a href="Features.aspx">Features</a></li>
                <li class="active"><a href="#">Contact</a></li>
              </ul>
            </div>
          </div>

          <div class="inner cover">
          <h1>Please send your feedback!</h3>
            <div class="container">
            
<div class="row">
    
<div class="col-sm-8 contact-form">
<form id="contact" method="post" class="form" runat="server" role="form">
<div class="row">
<div class="col-xs-6 col-md-6 form-group">
<asp:TextBox class="form-control" id="Name" runat="server" name="name" 
        placeholder="Name"  required autofocus MaxLength="40" />
</div>
<div class="col-xs-6 col-md-6 form-group">
<asp:TextBox runat="server" class="form-control" id="Email" name="email" 
        placeholder="Email" type="email" required MaxLength="40" />
</div>
</div>
<asp:TextBox runat="server"  class="form-control" id="Message" name="message" 
    placeholder="Message" rows="5" MaxLength="1000" TextMode="MultiLine"></asp:TextBox>
<br />
<div class="row">
<div class="col-xs-12 col-md-12 form-group">
<asp:Button ID="Submit" runat="server" OnClick="Submit_Click" class="btn btn-primary pull-right" Text="Submit" type="submit"></asp:Button>

<asp:RegularExpressionValidator ID="RegularExpressionValidator1" 
	runat="server" ControlToValidate="Message" 
	ErrorMessage="Please enter maximum 2000 charachters."
 SetFocusOnError="true" ValidationExpression="^[a-zA-Z.]{1,2000}$" 
        CssClass="alert alert-info" Display="Dynamic"></asp:RegularExpressionValidator>

</form>
</div>
          </div>

          <div class="mastfoot">
            <div class="inner">
              
            </div>
          </div>

        </div>

      </div>

    </div>

    </div>
    </div>

    <!-- Bootstrap core JavaScript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    <script src="https://code.jquery.com/jquery-1.10.2.min.js"></script>
    <script src="../../dist/js/bootstrap.min.js"></script>
    <script src="../../assets/js/docs.min.js"></script>
  
  </body>
</html>
