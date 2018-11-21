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
                      <form class="form-horizontal" action='' method="POST">
                        <fieldset>
                          <div id="legend">
                            <legend class="">Login</legend>
                          </div>    
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
                      </form>                
                    </div>
                    <div class="tab-pane fade" id="create">
                      <form id="tab">
                        <label>Username</label>
                        <asp:TextBox ID ="createUsernameText" runat="server"></asp:TextBox>
                        <label>Password</label>
                        <asp:TextBox ID="createPasswordText"  TextMode="Password" runat="server" type ="password"></asp:TextBox>
                        <label>First Name</label>
                        <asp:TextBox ID ="createFNameText" runat="server"></asp:TextBox>
                        <label>Last Name</label>
                        <asp:TextBox ID ="createLNameText" runat="server"></asp:TextBox>
                        <label>Email</label>
                        <asp:TextBox ID ="createEmailText" runat="server"></asp:TextBox>
                        <label>User Type</label>
                        <asp:DropDownList ID="UserType" runat="server">
                            <asp:ListItem Enabled="true" Text="Admin" Value="0"></asp:ListItem>
                            <asp:ListItem Enabled="true" Text="User1" Value="1"></asp:ListItem>
                            <asp:ListItem Enabled="true" Text="User2" Value="2"></asp:ListItem>
                        </asp:DropDownList>
     
                        <div>
                          <button class="btn btn-primary">Create Account</button>
                        </div>
                      </form>
                    </div>
                </div>
              </div>
            </div>
        </div>
	</div>
</div>
</asp:Content>
