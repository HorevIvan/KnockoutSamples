<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="SinglePage.aspx.cs" Inherits="KnockoutSamples.SinglePage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="server">
    <script>
        var dataRoot;

        $(document).ready(function () {

            dataRoot = $("#SinglePage")[0];

            ko.applyBindings(new WebmailViewModel(), dataRoot);
        });

        function WebmailViewModel() {

            var self = this;
            self.folders = ['Inbox', 'Archive', 'Sent', 'Spam'];
            self.chosenFolderId = ko.observable();

            self.goToFolder = function (folder) {
                self.chosenFolderId(folder);
            };
        };
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Body" runat="server">
    <div id="SinglePage">
        Click items...
        <ul class="folders" data-bind="foreach: folders">
            <li data-bind="text: $data, style: { 'font-weight': $data == $root.chosenFolderId() ? 'bold' : 'normal' }, click: $root.goToFolder"></li>
        </ul>
    </div>
</asp:Content>
