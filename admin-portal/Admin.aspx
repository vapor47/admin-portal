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
    <div style="padding-top: 2em;">
        <asp:Menu ID="adminMenu" runat="server" OnMenuItemClick="adminMenu_MenuItemClick" Orientation="Horizontal" BorderStyle="Solid">
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
                UpdateCommand="UPDATE USER_INFO SET Username = @username, Password = @password, FirstName = @firstname, LastName = @lastname, Email = @email, UserType = @usertype WHERE Id = @id"
                DeleteCommand="DELETE FROM USER_INFO WHERE Id =  @id"
                InsertCommand="INSERT INTO USER_INFO (Username, Password, UserType, FirstName, LastName, Email) VALUES (@user, @pw, @type, @fname, @lname, @email)">
                <DeleteParameters>
                    <asp:Parameter Name="id" />
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
                    <b>ID:</b> <asp:Label Text='<%# Eval("Id") %>' runat="server" />
                    <asp:Button Text="New" runat="server" CommandName="New" />
                </ItemTemplate>
                <InsertItemTemplate>
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
            <asp:GridView ID="UsersGridView" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False"
                DataKeyNames="Id" DataSourceID="UsersDataSource" Font-Names="Arial" HorizontalAlign="Left" CellPadding="10" ForeColor="#333333" GridLines="None" Font-Size="Medium" Width="80%">
                <Columns>
                    <asp:CommandField ShowEditButton="True" >
                    <ItemStyle HorizontalAlign="Center" />
                    </asp:CommandField>
                    <asp:BoundField DataField="Id" HeaderText="ID" ReadOnly="True" SortExpression="Id" >
                    <HeaderStyle HorizontalAlign="Center" />
                    </asp:BoundField>
                    <asp:BoundField DataField="Username" HeaderStyle-HorizontalAlign="Center" HeaderText="Username" SortExpression="Username" >
                    <HeaderStyle HorizontalAlign="Center" />
                    </asp:BoundField>
                    <asp:BoundField DataField="Password" HeaderText="Password" SortExpression="Password" >
                    <HeaderStyle HorizontalAlign="Center" Wrap="False" />
                    <ItemStyle HorizontalAlign="Center" />
                    </asp:BoundField>
                    <asp:BoundField DataField="FirstName" HeaderText="First Name" SortExpression="FirstName" >
                    <HeaderStyle HorizontalAlign="Center" Wrap="False" />
                    <ItemStyle HorizontalAlign="Center" />
                    </asp:BoundField>
                    <asp:BoundField DataField="LastName" HeaderText="Last Name" SortExpression="LastName" >
                    <HeaderStyle HorizontalAlign="Center" Wrap="False" />
                    <ItemStyle HorizontalAlign="Center" />
                    </asp:BoundField>
                    <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email" >
                    <HeaderStyle HorizontalAlign="Center" Wrap="False" />
                    <ItemStyle HorizontalAlign="Center" />
                    </asp:BoundField>
                    <asp:BoundField DataField="Usertype" HeaderText="Role" SortExpression="Usertype" >
                    <HeaderStyle HorizontalAlign="Center" Wrap="False" />
                    <ItemStyle HorizontalAlign="Center" />
                    </asp:BoundField>
                    <asp:CommandField DeleteText="Remove" ShowDeleteButton="True" >
                    <ItemStyle HorizontalAlign="Center" />
                    </asp:CommandField>
                </Columns>
                <EditRowStyle BackColor="#2461BF" />
                <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                <HeaderStyle HorizontalAlign="Center" BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                <RowStyle HorizontalAlign="Left" BackColor="#EFF3FB" Font-Size="Medium" Width="10%" Wrap="False" />
                <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                <SortedAscendingCellStyle BackColor="#F5F7FB" />
                <SortedAscendingHeaderStyle BackColor="#6D95E1" />
                <SortedDescendingCellStyle BackColor="#E9EBEF" />
                <SortedDescendingHeaderStyle BackColor="#4870BE" />
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
                    <asp:CommandField ShowEditButton="True" >
                    <ItemStyle HorizontalAlign="Center" />
                    </asp:CommandField>
                    <asp:BoundField DataField="url" HeaderText="URL" ReadOnly="True" SortExpression="url" >
                    <HeaderStyle HorizontalAlign="Center" />
                    </asp:BoundField>
                    <asp:BoundField DataField="title" HeaderStyle-HorizontalAlign="Center" HeaderText="Title" SortExpression="title" >
                    <HeaderStyle HorizontalAlign="Center" />
                    </asp:BoundField>
                    <asp:BoundField DataField="required_role" HeaderText="Required Role" SortExpression="required_role" >
                    <HeaderStyle HorizontalAlign="Center" Wrap="False" />
                    <ItemStyle HorizontalAlign="Center" />
                    </asp:BoundField>
                    <asp:CommandField DeleteText="Remove" ShowDeleteButton="True" >
                    <ItemStyle HorizontalAlign="Center" />
                    </asp:CommandField>
                </Columns>
                <EditRowStyle BackColor="#2461BF" />
                <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                <HeaderStyle HorizontalAlign="Center" BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                <RowStyle HorizontalAlign="Left" BackColor="#EFF3FB" Font-Size="Medium" Width="300px" Wrap="False" />
                <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                <SortedAscendingCellStyle BackColor="#F5F7FB" />
                <SortedAscendingHeaderStyle BackColor="#6D95E1" />
                <SortedDescendingCellStyle BackColor="#E9EBEF" />
                <SortedDescendingHeaderStyle BackColor="#4870BE" />
            </asp:GridView>
        </asp:View>
    </asp:MultiView>
</asp:Content>