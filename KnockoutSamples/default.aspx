<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="default.aspx.cs" Inherits="KnockoutSamples._default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
    <head runat="server">
        <title>KnockoutJS sample</title>
        <% #if DEBUG %>
            <script type="text/javascript" src="/Scripts/jquery-2.1.1.js"></script>
            <script type="text/javascript" src="/Scripts/knockout-3.1.0.debug.js"></script>
        <% #else %>
            <script type="text/javascript" src="/Scripts/jquery-2.1.1.min.js"></script>
            <script type="text/javascript" src="/Scripts/knockout-3.1.0.js"></script>
        <% #endif %>
        <script>
            $(document).ready(function () {
                $('#jq_version').html($.fn.jquery);
                $('#ko_version').html(ko.version);
            });
        </script>
    </head>
    <body>
        <form id="knokoutForm" runat="server">
            <div>   
                KnockoutJS <span id="ko_version"></span><br />
                jQuery <span id="jq_version"></span>
            </div>
        </form>
    </body>
</html>
