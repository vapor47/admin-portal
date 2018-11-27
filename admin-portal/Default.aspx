<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="admin_portal._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <style>
        .link
        {
            border: 1.5px solid black;
            border-radius: 4px;
            padding-left: 2em;
            padding-bottom: 1em;
        }
    </style>
        
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:localConnectionString %>" SelectCommand="SELECT * FROM [Links] WHERE (([required_role] = @required_role2) OR ([required_role] = @required_role))">
        <SelectParameters>
            <asp:SessionParameter DefaultValue="0" Name="required_role2" SessionField="Usertype" Type="Byte" />
            <asp:Parameter DefaultValue="0" Name="required_role" Type="Byte" />
        </SelectParameters>
    </asp:SqlDataSource>

    <div class="jumbotron">
        <asp:Repeater runat="server" DataSourceID="SqlDataSource1">
            <ItemTemplate>
                <a href=<%# Eval("url") %>>
                    <div class="link">
                        <h3><%# Eval("title") %></h3>
                        <h5><%# Eval("url") %></h5>
                    </div>
                </a>
            </ItemTemplate>

            <SeparatorTemplate>
                <br />
            </SeparatorTemplate>
        </asp:Repeater>
    </div>
</asp:Content>