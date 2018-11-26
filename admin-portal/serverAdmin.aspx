<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="serverAdmin.aspx.cs" Inherits="admin_portal._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container">
	<div class="row">
        <div class="span12">
    		<div class="" id="adminModal">
              <div class="modal-body">
                <div class="well">
                  <ul class="nav nav-tabs">
                    <li class="active"><a href="#user" data-toggle="tab">User Changes</a></li>
                    <li><a href="#links" data-toggle="tab">Links</a></li>
                  </ul>
                  <div id="myTabContent" class="tab-content">
                    <div class="tab-pane active in" id="users">
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
            </div>
        </div>
        </div>

    </asp:Content>