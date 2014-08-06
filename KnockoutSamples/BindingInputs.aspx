<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="BindingInputs.aspx.cs" Inherits="KnockoutSamples.BindingInputs" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="server">
    <script>

        var dataRoot;

        $(document).ready(function () {

            dataRoot = $("#InputData")[0]; //важно

            Binding("Horev", "Ivan");
        });

        function AppViewModel(fn, ln) {
            firstName = ko.observable(fn);
            lastName = ko.observable(ln);
            hellow = ko.computed(function () {
                if (firstName().length > 0 && lastName().length > 0)
                    return "Hellow " + firstName() + " " + lastName();
                else
                    return "";
            }, this);
        }

        function Binding(fn, ln) {
            ko.applyBindings(new AppViewModel(fn, ln), dataRoot);
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Body" runat="server">
    <div id="InputData">
        <p>First name: <input data-bind="value: firstName" /></p>
        <p>Last name: <input data-bind="value: lastName" /></p>
        <br />
        <br />
        <span data-bind="text: hellow"></span>
    </div>
</asp:Content>
