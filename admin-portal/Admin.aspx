<%@ Page Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Admin.aspx.cs" Inherits="admin_portal.Admin" %>

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

    <asp:Menu ID="adminMenu" runat="server" OnMenuItemClick="adminMenu_MenuItemClick" Orientation="Horizontal">
        <Items>
            <asp:MenuItem Selected="True" Text="Users" Value="0"></asp:MenuItem>
            <asp:MenuItem Text="Links" Value="1"></asp:MenuItem>
        </Items>
    </asp:Menu>
    <asp:MultiView ID="adminMultiView" runat="server" ActiveViewIndex="1">
        <asp:View ID="usersView" runat="server">
            Users</asp:View>
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

            <h4 style="font-size: 30px; font-weight: bold">Add Links</h4>
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
            <asp:GridView ID="LinksGridView" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="url" DataSourceID="LinksDataSource" BorderStyle="Solid" Font-Names="Arial" HorizontalAlign="Left">
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