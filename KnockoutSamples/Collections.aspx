<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Collections.aspx.cs" Inherits="KnockoutSamples.Collections" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="server">
    <script>
        var dataRoot;

        $(document).ready(function () {
            dataRoot = $("#Collections")[0]
            Binding();
        });

        function Binding() {
            ko.applyBindings(new ReservationsViewModel(), dataRoot);
        }

        function SeatReservation(name, initialMeal) {

            var self = this;

            self.name = name;
            self.meal = ko.observable(initialMeal);

            self.formattedPrice = ko.computed(function () {
                var price = self.meal().price;
                return price ? "$" + price.toFixed(2) : "None";
            });
        }

        function ReservationsViewModel() {

            var self = this;

            self.availableMeals = [
                { mealName: "Standard (sandwich)", price: 0 },
                { mealName: "Premium (lobster)", price: 34.95 },
                { mealName: "Ultimate (whole zebra)", price: 290 }
            ];

            self.seats = ko.observableArray([
                new SeatReservation("Steve", self.availableMeals[0]),
                new SeatReservation("Bert", self.availableMeals[1])
            ]);
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Body" runat="server">
    <div id="Collections">
        <table>
            <thead>
                <tr>
                    <th>Passenger name</th>
                    <th>Food</th>
                    <th>Surcharge</th>
                    <th></th>
                </tr>
            </thead>
            <tbody data-bind="foreach: seats">
                <tr>
                    <td><input data-bind="value: name" /></td>
                    <td><select data-bind="options: $root.availableMeals, value: meal, optionsText: 'mealName'"></select></td>
                    <td data-bind="text: meal().price"></td>
                </tr>    
            </tbody>
        </table>
    </div>
</asp:Content>
