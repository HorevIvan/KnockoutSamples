<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="jQueryAjax.aspx.cs" Inherits="KnockoutSamples.jQueryAjax" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="server">
    <script>
        $(document).ready(function () {
            $("#button").click(function () {
                $.ajax({
                    type: "POST",
                    url: "http://localhost:53643/DataService.asmx/HelloWorld",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (data, status, req, xml, xmlHttpRequest, responseXML) {
                        $('#hellow').html(data.d);
                    },
                    error: function (data, status, req) {
                        alert(status);
                    }
                });
                $.ajax({
                    type: "POST",
                    url: "http://localhost:53643/DataService.asmx/GetEmployees",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (data, status, req, xml, xmlHttpRequest, responseXML) {
                        var employees = data.d;
                        $('#out').empty();
                        $.each(employees, function (index, employee) {
                            $('#out').append('<p><strong>' + employee.FirstName + ' ' + employee.LastName + '</strong></p>');
                        });
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
    <div id="hellow">
    </div>
    <div id="out">
    </div>
</asp:Content>
