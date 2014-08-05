<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="default.aspx.cs" Inherits="KnockoutSamples._default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
    <head runat="server">
        <title></title>
        <% #if DEBUG %>
            <script type="text/javascript" src="/Scripts/knockout-3.1.0.debug.js"></script>
        <% #else %>
            <script type="text/javascript" src="/Scripts/knockout-3.1.0.js"></script>
        <% #endif %>
    </head>
    <body>
        <form id="knokoutForm" runat="server">
            <div>   
                KnockoutJS sample    
            </div>
        </form>
</body>
</html>
