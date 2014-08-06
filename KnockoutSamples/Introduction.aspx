<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Introduction.aspx.cs" Inherits="KnockoutSamples.Introduction" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="server">
    <script>
        var dataRoot;

        $(document).ready(function () {

            dataRoot = $("#Data")[0];

            Binding("Horev", "Ivan");
        });

        function AppViewModel(fn, ln) {

            firstName = ko.observable(fn);
            lastName = ko.observable(ln);

            hellow = ko.computed(function () {
                if (firstName().length > 0 && lastName().length > 0)
                    return "Hello " + firstName() + " " + lastName();
                else
                    return "";
            }, this);

            fnToUpperCase = function () {
                firstName(firstName().toUpperCase());
            };
        }

        function Binding(fn, ln) {
            ko.applyBindings(new AppViewModel(fn, ln), dataRoot);
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Body" runat="server">
    <div id="Data">
        <p>First name: <input data-bind="value: firstName" /> (update by lost focus)</p>
        <p>Last name: <input data-bind="value: lastName, valueUpdate: 'afterkeydown'" /> (update by keydown)</p>
        <br />
        <br />
        <span data-bind="text: hellow"></span>
        <br />
        <br />
        <div data-bind="click: fnToUpperCase" style="display: inline-block; padding: 7px 12px 7px 12px; background-color: silver; border: 1px solid black; border-radius: 4px; cursor: pointer;">
            First name to upper case
        </div>
    </div>
</asp:Content>
