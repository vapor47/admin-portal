<%@ Page Title="Login" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="admin_portal.About" %>


<asp:Content ContentPlaceHolderID="MainContent" runat ="server">
    <link href="//netdna.bootstrapcdn.com/twitter-bootstrap/2.3.2/css/bootstrap-combined.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//netdna.bootstrapcdn.com/twitter-bootstrap/2.3.2/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>

<div class="container">
	<div class="row">
        <div class="span12">
    		<div class="" id="loginModal">
              <div class="modal-body">
                <div class="well">
                  <ul class="nav nav-tabs">
                    <li class="active"><a href="#login" data-toggle="tab">Login</a></li>
                    <li><a href="#create" data-toggle="tab">Create Account</a></li>
                  </ul>
                  <div id="myTabContent" class="tab-content">
                    <div class="tab-pane active in" id="login">
                      <div class="form-horizontal">
                        <fieldset>
                            <legend class="">Login&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </legend>
                          <div class="control-group">
                            <!-- Username -->
                            <label class="control-label"  for="username">Username</label>
                            <div class="controls">
                              <asp:TextBox ID ="loginUsernameText" runat="server"></asp:TextBox>
                            </div>
                          </div>
     
                          <div class="control-group">
                            <!-- Password-->
                            <label class="control-label" for="password">Password</label>
                            <div class="controls">
                              <asp:TextBox ID ="loginPasswordText" runat="server"></asp:TextBox>
                            </div>
                          </div>
     
     
                          <div class="control-group">
                            <!-- Button -->
                            <div class="controls">
                              <button class="btn btn-success">Login</button>
                            </div>
                          </div>
                        </fieldset>
                      </div>                
                    </div>
                    <div class="tab-pane fade" id="create">
                      <div id="tab">
                        <label>Username</label>
                        <asp:TextBox ID ="txtCreateUsername" runat="server"></asp:TextBox>
                        <label>Password</label>
                        <asp:TextBox ID="txtCreatePassword"  TextMode="Password" runat="server" type ="password"></asp:TextBox>
                        <label>First Name</label>
                        <asp:TextBox ID ="txtCreateFName" runat="server"></asp:TextBox>
                        <label>Last Name</label>
                        <asp:TextBox ID ="txtCreateLName" runat="server"></asp:TextBox>
                        <label>Email</label>
                        <asp:TextBox ID ="txtCreateEmail" runat="server"></asp:TextBox>
                        <label>User Type</label>
                        <asp:DropDownList ID="ddlUserType" runat="server">
                            <asp:ListItem Enabled="true" Text="Admin" Value="0"></asp:ListItem>
                            <asp:ListItem Enabled="true" Text="User1" Value="1"></asp:ListItem>
                            <asp:ListItem Enabled="true" Text="User2" Value="2"></asp:ListItem>
                        </asp:DropDownList>
     
                        <div>
                          <asp:Button ID="btnCreateAcc" Text="Create Account" runat="server" OnClick="btnCreateAcc_Click" CssClass="btn-primary" />
                        </div>
                      </div>
                    </div>
                </div>
              </div>
            </div>
        </div>
	</div>
</div>
    <asp:Label ID="lblNotify" runat="server" Font-Size="Large" Text="Account Creation Successful" Visible="False"></asp:Label>
    </div>
</asp:Content>
