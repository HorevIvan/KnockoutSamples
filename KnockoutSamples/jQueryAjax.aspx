<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="jQueryAjax.aspx.cs" Inherits="KnockoutSamples.jQueryAjax" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="server">
    <script>
        $(document).ready(function () {
            $("#button").click(function () {
                var soapMessage =
                    "<?xml version='1.0' encoding='utf-8'?>"+
                    "<soap12:Envelope xmlns:xsi='http://www.w3.org/2001/XMLSchema-instance' xmlns:xsd='http://www.w3.org/2001/XMLSchema' xmlns:soap12='http://www.w3.org/2003/05/soap-envelope'>"+
                    "  <soap12:Body>"+
                    "    <HelloWorld xmlns='http://tempuri.org/' />"+
                    "  </soap12:Body>"+
                    "</soap12:Envelope>";

                $.ajax({
                    type: "POST",
                    url: "http://localhost:53643/DataService.asmx/HelloWorld",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (data, status, req, xml, xmlHttpRequest, responseXML) {
                        alert(data.d);
                    },
                    error: function (data, status, req) {
                        alert(status);
                    }
                });
            });
        });
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Body" runat="server">
    <input id="button" type="button" value="click" />
    <br />
    <div id="answer">
    </div>
</asp:Content>
