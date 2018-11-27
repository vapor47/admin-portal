﻿<%@ Page Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Admin.aspx.cs" Inherits="admin_portal.Admin" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <style>
        .addForm
        {
            padding-bottom: 4px;
        }
        .addFormBorder
        {
            border: 1px solid black;
            border-radius: 4px;
            padding-left: 2em;
            padding-bottom: 1em;
            padding-top: 1em;
            padding-right: 2em;
        }
        .addLabel
        {
            float: left;
            width: 25%;
        }
        .addTextBox
        {
            float: right;
            width: 75%;
        }
    </style>
    <div style="padding-top: 2em;">
    <asp:Menu ID="adminMenu" runat="server" OnMenuItemClick="adminMenu_MenuItemClick" Orientation="Horizontal">
        <Items>
            <asp:MenuItem Selected="True" Text="Users" Value="0"></asp:MenuItem>
            <asp:MenuItem Text="Links" Value="1"></asp:MenuItem>
        </Items>
        <StaticMenuItemStyle BackColor="Gainsboro" BorderStyle="Solid" BorderWidth="1px" CssClass="menuItem" Font-Bold="False" Font-Names="Calibri" Font-Size="20px" HorizontalPadding="25px" VerticalPadding="5px" />
    </asp:Menu>
         </div>
    <asp:MultiView ID="adminMultiView" runat="server" ActiveViewIndex="1">
        <asp:View ID="usersView" runat="server">
            <asp:SqlDataSource ID="UsersDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:localConnectionString %>" SelectCommand="SELECT * FROM [USER_INFO]"
                UpdateCommand="UPDATE USER_INFO SET FirstName = @fname, LastName = @lname, Email = @email, UserType = @type WHERE Username = @user"
                DeleteCommand="DELETE FROM USER_INFO U WHERE U.Username =  @user AND U.Password = @pw"
                InsertCommand="INSERT INTO USER_INFO (Username, Password, UserType, FirstName, LastName) VALUES (@user, @pw, @type, @fname, @lname, @email)">
                <DeleteParameters>
                    <asp:Parameter Name="user" />
                    <asp:Parameter Name="pw" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="user" />
                    <asp:Parameter Name="pw" />
                    <asp:Parameter Name="type" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="fname" />
                    <asp:Parameter Name="lname" />
                    <asp:Parameter Name="email" />
                    <asp:Parameter Name="type" />
                    <asp:Parameter Name="user" />
                </UpdateParameters>
            </asp:SqlDataSource>

            <h4 style="font-size: 30px; font-weight: bold">Add New Users</h4>
            <asp:FormView runat="server" ID="FormView1" DataSourceID="UsersDataSource" DefaultMode="Insert" 
                oniteminserted="fv_ItemInserted">
                <ItemTemplate>
                    <b>URL:</b> <asp:Label Text='<%# Eval("url") %>' runat="server" />
                    <asp:Button Text="New" runat="server" CommandName="New" />
                </ItemTemplate>
                <InsertItemTemplate>
                    <table>
                        <tr>
                            <td>Users</td>
                        </tr>
                    </table>
                    <div class="addFormBorder">
                        <div class="addForm">
                            <b>Username:</b> <asp:TextBox ID="txtUsername" runat="server" Text='<%# Bind("user") %>' />
                        </div>
                        <div class="addForm">
                            <b>Password:</b> <asp:TextBox ID="txtPassword" runat="server" Text='<%# Bind("pw") %>' />
                        </div>
                        <div class="addForm">
                            <b>User Role:</b> <asp:TextBox ID="txtUserType" runat="server" Text='<%# Bind("type") %>' />
                        </div>
                        <div class="addForm">
                            <b>First Name:</b>
                            <asp:TextBox ID="txtFName" runat="server" Text='<%# Bind("fname") %>' />
                        </div>
                        <div class="addForm">
                            <b>Last Name:</b>
                            <asp:TextBox ID="txtLName" runat="server" Text='<%# Bind("lname") %>' />
                        </div>
                        <div class="addForm">
                            <b>Email:</b>
                            <asp:TextBox ID="txtEmail" runat="server" Text='<%# Bind("email") %>' />
                        </div>
                        <br />
                        <asp:Button Text="Insert" runat="server" CommandName="Insert" />
                    </div>
                </InsertItemTemplate>
            </asp:FormView>


            <h4 style="font-size: 30px; font-weight: bold">Edit User Info/Remove Users</h4>
            <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="url" DataSourceID="LinksDataSource" BorderStyle="Solid" Font-Names="Arial" HorizontalAlign="Left">
                <Columns>
                    <asp:CommandField ShowEditButton="True" />
                    <asp:BoundField DataField="url" HeaderText="URL" ReadOnly="True" SortExpression="url" >
                    <HeaderStyle HorizontalAlign="Center" />
                    <ItemStyle HorizontalAlign="Left" />
                    </asp:BoundField>
                    <asp:BoundField DataField="title" HeaderText="Title" SortExpression="title" >
                    <HeaderStyle HorizontalAlign="Center" />
                    <ItemStyle HorizontalAlign="Left" />
                    </asp:BoundField>
                    <asp:BoundField DataField="required_role" HeaderText="Required Role" SortExpression="required_role" />
                    <asp:CommandField ShowDeleteButton="True" ButtonType="Button" DeleteText="Remove" >
                    <HeaderStyle HorizontalAlign="Center" />
                    <ItemStyle HorizontalAlign="Center" />
                    </asp:CommandField>
                </Columns>
                <EditRowStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                <RowStyle HorizontalAlign="Center" VerticalAlign="Middle" />
            </asp:GridView>
           </asp:View>
        <asp:View ID="linksView" runat="server">
            <asp:SqlDataSource ID="LinksDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:localConnectionString %>" SelectCommand="SELECT * FROM [Links]"
                UpdateCommand="UPDATE Links SET title = @title, required_role = @required_role WHERE url = @url"
                DeleteCommand="DELETE FROM Links WHERE url = @url"
                InsertCommand="INSERT INTO Links (url, title, required_role) VALUES (@url, @title, @required_role)">
                <UpdateParameters>
                    <asp:Parameter Name="url" Type="String" />
                    <asp:Parameter Name="title" Type="String" />
                    <asp:Parameter Name="required_role" Type="Int16" />
                </UpdateParameters> 
            </asp:SqlDataSource>

            <h4 style="font-size: 30px; font-weight: bold">Add Link</h4>
            <asp:FormView runat="server" ID="fv" DataSourceID="LinksDataSource" DefaultMode="Insert" 
                oniteminserted="fv_ItemInserted">
                <ItemTemplate>
                    <b>URL:</b> <asp:Label Text='<%# Eval("url") %>' runat="server" />
                    <asp:Button Text="New" runat="server" CommandName="New" />
                </ItemTemplate>
                <InsertItemTemplate>
                    <table>
                        <td>URL</td>
                    </table>
                    <div class="addFormBorder">
                        <div class="addForm">
                            <b>URL:</b> <asp:TextBox ID="addUrl" runat="server" Text='<%# Bind("url") %>' />
                        </div>
                        <div class="addForm">
                            <b>Title:</b> <asp:TextBox ID="addTitle" runat="server" Text='<%# Bind("title") %>' />
                        </div>
                        <div class="addForm">
                            <b>Required Role:</b> <asp:TextBox ID="addRole" runat="server" Text='<%# Bind("required_role") %>' />
                        </div>
                        <asp:Button Text="Insert" runat="server" CommandName="Insert" />
                    </div>
                </InsertItemTemplate>
            </asp:FormView>

            <hr />

            <h4 style="font-size: 30px; font-weight: bold">Edit/Remove Links</h4>
            <asp:GridView ID="LinksGridView" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" 
                DataKeyNames="url" DataSourceID="LinksDataSource" Font-Names="Arial" HorizontalAlign="Left" CellPadding="10" ForeColor="#333333" GridLines="None" Font-Size="Medium" Width="80%">
                <Columns>
                    <asp:CommandField ShowEditButton="True" />
                    <asp:BoundField DataField="url" HeaderText="URL" ReadOnly="True" SortExpression="url" >
                    <HeaderStyle HorizontalAlign="Center" />
                    <ItemStyle HorizontalAlign="Left" />
                    </asp:BoundField>
                    <asp:BoundField DataField="title" HeaderText="Title" SortExpression="title" >
                    <HeaderStyle HorizontalAlign="Center" />
                    <ItemStyle HorizontalAlign="Left" />
                    </asp:BoundField>
                    <asp:BoundField DataField="required_role" HeaderText="Required Role" SortExpression="required_role" />
                    <asp:CommandField ShowDeleteButton="True" ButtonType="Button" DeleteText="Remove" >
                    <HeaderStyle HorizontalAlign="Center" />
                    <ItemStyle HorizontalAlign="Center" />
                    </asp:CommandField>
                </Columns>
                <EditRowStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                <RowStyle HorizontalAlign="Center" VerticalAlign="Middle" />
            </asp:GridView>
        </asp:View>
    </asp:MultiView>
</asp:Content>