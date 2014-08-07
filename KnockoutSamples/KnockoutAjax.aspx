<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="KnockoutAjax.aspx.cs" Inherits="KnockoutSamples.KnockoutAjax" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="server">
    <script>
        var viewModel;

        $(document).ready(function () {

            function VM() {
                this.hello = ko.observable(null);
                this.employees = ko.observableArray(null);
            };

            viewModel = new VM();

            ko.applyBindings(viewModel, $('#page')[0]);

            $("#button").click(function () {

                $.ajax({
                    type: "POST",
                    url: "http://localhost:53643/DataService.asmx/HelloWorld",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (data, status, req, xml, xmlHttpRequest, responseXML) {
                        viewModel.hello(data.d);
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
                        viewModel.employees(data.d);
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
    <siv id="page">
        <div data-bind="text: hello"></div>
        <ul data-bind="template: { foreach: employees }">
            <li><span data-bind="text: FirstName+', '+LastName"></span></li>
        </ul>
    </siv>
</asp:Content>
