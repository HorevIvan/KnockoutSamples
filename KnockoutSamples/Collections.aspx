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

            self.addSeat = function () {
                self.seats.push(new SeatReservation("", self.availableMeals[0]));
            };

            self.removeSeat = function (seat) {
                self.seats.remove(seat)
            };

            self.totalSurcharge = ko.computed(function () {
                var total = 0;
                for (var i = 0; i < self.seats().length; i++)
                    total += self.seats()[i].meal().price;
                return total;
            });
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
                    <td data-bind="text: formattedPrice"></td>
                    <td><a href="#" data-bind="click: $root.removeSeat">Remove</a></td>
                </tr>    
            </tbody>
        </table>
        <h3 data-bind="visible: totalSurcharge() > 0">
            Total surcharge: $<span data-bind="text: totalSurcharge().toFixed(2)"></span>
        </h3>
        <button data-bind="click: addSeat, enable: seats().length < 5">Reserve another seat</button>
        <h2>Your seat reservations (<span data-bind="text: seats().length"></span>)</h2>
    </div>
</asp:Content>
