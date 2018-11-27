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
        
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:localConnectionString %>" SelectCommand="SELECT [url], [title] FROM [Links] WHERE ([required_role] &lt;= @required_role2)">
        <SelectParameters>
            <asp:Parameter DefaultValue="1" Name="required_role2" Type="Byte" />
        </SelectParameters>
    </asp:SqlDataSource>

    <!--
        Search bar
        Role specific links
            links
        Global links
            links

        2 different repeaters
        maybe separate jumbotrons

        -->
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