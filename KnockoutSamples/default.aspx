<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="KnockoutSamples.Default" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="server">

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Body" runat="server">
    <asp:HyperLink ID="HyperLink1" NavigateUrl="~/Introduction.aspx" runat="server">Introduction</asp:HyperLink><br />
    <asp:HyperLink ID="HyperLink2" NavigateUrl="~/Collections.aspx" runat="server">Collections</asp:HyperLink><br />
    <asp:HyperLink ID="HyperLink3" NavigateUrl="~/SinglePage.aspx" runat="server">SinglePage</asp:HyperLink><br />
    <asp:HyperLink ID="HyperLink4" NavigateUrl="~/jQueryAjax.aspx" runat="server">jQueryAjax</asp:HyperLink><br />
    <asp:HyperLink ID="HyperLink5" NavigateUrl="~/KnockoutAjax.aspx" runat="server">KnockoutAjax</asp:HyperLink><br />
</asp:Content>
