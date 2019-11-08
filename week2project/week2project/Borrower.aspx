<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Borrower.aspx.cs" MasterPageFile="~/Site1.Master" Inherits="week2project.Borrower" %>

<asp:Content runat="server" ContentPlaceHolderID="BodyPlaceholder">
    <div class="panel panel-primary">
        <div class="panel-heading">
            <h3 class="panel-title">Add New Borrower</h3>
        </div>
        <div class="panel-body">

            <form runat="server" method="POST" role="form">

                <div class="form-group">
                    <label>
                        First Name&nbsp;&nbsp;&nbsp;
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" CssClass="text-danger" ErrorMessage="First Name Is Required" ControlToValidate="FirstNameText"></asp:RequiredFieldValidator>
                    </label>
                    <br />
                    <asp:TextBox class="form-control" ID="FirstNameText" runat="server"></asp:TextBox>
                    <label>
                        Last Name&nbsp;&nbsp;&nbsp;
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" CssClass="text-danger" ErrorMessage="Last Name Is Required" ControlToValidate="LastNameText"></asp:RequiredFieldValidator>
                    </label>
                    <br />
                    <asp:TextBox class="form-control" ID="LastNameText" runat="server"></asp:TextBox>
                    <label>
                        Phone Number&nbsp;&nbsp;&nbsp; 
                                  <asp:RegularExpressionValidator ID="revPhone" runat="server"
                                      ControlToValidate="PhoneNumberText" Text="Use this format: 999-999-9999"
                                      Display="Dynamic" CssClass="text-danger"
                                      ValidationExpression="((\(\d{3}\) ?)|(\d{3}-))?\d{3}-\d{4}"></asp:RegularExpressionValidator>
                    </label>
                    <br />
                    <asp:TextBox class="form-control" ID="PhoneNumberText" runat="server" TextMode="Phone"></asp:TextBox>
                </div>



                <asp:Button class="btn btn-primary" ID="SubmitButton" runat="server" Text="Submit" OnClick="SubmitButton_Click" />
                <br />
                <asp:Label ID="ResponseLabel" runat="server" Text=""></asp:Label>
            </form>

        </div>
    </div>
</asp:Content>
