<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="MakingTheDataEditable.aspx.cs" Inherits="KnockoutSamples.MakingTheDataEditable" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="server">
    <script>

        var dataRoot;

        $(document).ready(function () {

            dataRoot = $("#data")[0]; //важно

            Binding("Horev", "Ivan");
        });

        function AppViewModel(fn, ln) {
            firstName = ko.observable(fn);
            lastName = ko.observable(ln);
        }

        function Binding(fn, ln) {
            ko.applyBindings(new AppViewModel(fn, ln), dataRoot);
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Body" runat="server">
    <div id="data">
        <p>First name: <input data-bind="value: firstName" /></p>
        <p>Last name: <input data-bind="value: lastName" /></p>
    </div>
</asp:Content>
