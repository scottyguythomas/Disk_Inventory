<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Borrower.aspx.cs" MasterPageFile="~/Site1.Master" Inherits="week2project.Borrower" %>

<asp:Content runat="server" ContentPlaceHolderID="TablePlaceHolder">
	<div class="panel panel-primary">
		<div class="panel-heading">
			<h3 class="panel-title">Borrower List</h3>
		</div>
		<div class="panel-body">

			<asp:ListView ID="ListView1" runat="server" DataSourceID="BorrowerDataSource">
				<EditItemTemplate>
					<span style="">Borrower_Fname:
			<asp:TextBox ID="Borrower_FnameTextBox" runat="server" Text='<%# Bind("Borrower_Fname") %>' />
						<br />
						Borrower_Lname:
			<asp:TextBox ID="Borrower_LnameTextBox" runat="server" Text='<%# Bind("Borrower_Lname") %>' />
						<br />
						Borrower_Number:
			<asp:TextBox ID="Borrower_NumberTextBox" runat="server" Text='<%# Bind("Borrower_Number") %>' />
						<br />
						<asp:Button ID="UpdateButton" runat="server" CommandName="Update" Text="Update" />
						<asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Cancel" />
						<br />
						<br />
					</span>
				</EditItemTemplate>
				<EmptyDataTemplate>
					<span>Could Not Find Any Borrowers.</span>
				</EmptyDataTemplate>
				
				<ItemTemplate>
					<div class="card" style="width: 18rem;">
  <div class="card-body">
    <h5 class="card-title">Card title</h5>
    <h6 class="card-subtitle mb-2 text-muted">Card subtitle</h6>
    <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
    <a href="#" class="card-link">Card link</a>
    <a href="#" class="card-link">Another link</a>
  </div>
</div>
					<%--<div class="card col-sm-2"">
						<div class="card-body table-bordered">
							<asp:Label cssClass="card-title" ID="Borrower_FnameLabel" runat="server" Text='<%#Eval("Borrower_Fname") + " " + Eval("Borrower_LName") %>' />
							<p class="card-text">Phone Number: '<%# Eval("Borrower_Number") %>'</p>
							<asp:Button cssClass="card-link" ID="Button1" runat="server" CommandName="Edit" Text="Edit" />
							<asp:Button cssClass="card-link" ID="Button2" runat="server" CommandName="Delete" Text="Delete" />
						</div>
					</div>--%>
				</ItemTemplate>
				<%--<SelectedItemTemplate>
			<span style="">Borrower_Fname:
			<asp:Label ID="Borrower_FnameLabel" runat="server" Text='<%# Eval("Borrower_Fname") %>' />
			<br />
			Borrower_Lname:
			<asp:Label ID="Borrower_LnameLabel" runat="server" Text='<%# Eval("Borrower_Lname") %>' />
			<br />
			Borrower_Number:
			<asp:Label ID="Borrower_NumberLabel" runat="server" Text='<%# Eval("Borrower_Number") %>' />
			<br />
			<asp:Button ID="EditButton" runat="server" CommandName="Edit" Text="Edit" />
			<asp:Button ID="DeleteButton" runat="server" CommandName="Delete" Text="Delete" />
<br /><br /></span>
		</SelectedItemTemplate>--%>
			</asp:ListView>


			<asp:SqlDataSource ID="BorrowerDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:disk_inventoryRTConnectionString %>" DeleteCommand="sp_DeleteBorrower" DeleteCommandType="StoredProcedure" InsertCommand="sp_InsBorrower" InsertCommandType="StoredProcedure" SelectCommand="SELECT [Borrower_Fname], [Borrower_Lname], [Borrower_Number] FROM BORROWER ORDER BY [Borrower_Lname], [Borrower_Fname]" UpdateCommand="sp_UpdateBorrower" UpdateCommandType="StoredProcedure">
				<DeleteParameters>
					<asp:Parameter Name="borrowerID" Type="Int32" />
				</DeleteParameters>
				<InsertParameters>
					<asp:Parameter Name="fname" Type="String" />
					<asp:Parameter Name="lname" Type="String" />
					<asp:Parameter Name="number" Type="String" />
				</InsertParameters>
				<UpdateParameters>
					<asp:Parameter Name="borrowerID" Type="Int32" />
					<asp:Parameter Name="fname" Type="String" />
					<asp:Parameter Name="number" Type="String" />
					<asp:Parameter Name="lname" Type="String" />
				</UpdateParameters>
			</asp:SqlDataSource>
		</div>
	</div>
</asp:Content>

<asp:Content runat="server" ContentPlaceHolderID="BodyPlaceholder">
	<div class="panel panel-primary">
		<div class="panel-heading">
			<h3 class="panel-title">Add New Borrower</h3>
		</div>
		<div class="panel-body">

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

		</div>
	</div>
</asp:Content>
