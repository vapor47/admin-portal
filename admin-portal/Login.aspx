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
                  <div id="myTabContent" class="tab-content">
                    <div class="tab-pane active in" id="login">
                      <div class="form-horizontal">
                        <fieldset>
                            <legend class="">Login&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </legend>
                          <div class="control-group">
                            <!-- Username -->
                            <label class="control-label"  for="username">Username</label>
                            <div class="controls">
                              <asp:TextBox ID ="txtloginUser" runat="server"></asp:TextBox>
                            </div>
                          </div>
     
                          <div class="control-group">
                            <!-- Password-->
                            <label class="control-label" for="password">Password</label>
                            <div class="controls">
                              <asp:TextBox ID ="txtLoginPassword" runat="server" TextMode="Password"></asp:TextBox>
                            </div>
                          </div>
     
     
                          <div class="control-group">
                            <!-- Button -->
                            <div class="controls">
                              <asp:Button ID="btnLogin" Text="Login" runat="server" OnClick="btnLogin_Click" CssClass="btn-success" />
                            </div>
                          </div>
                        </fieldset>
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
