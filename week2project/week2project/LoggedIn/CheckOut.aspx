<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CheckOut.aspx.cs" MasterPageFile="~/Site.Master" Inherits="week2project.LoggedIn.CheckOut" %>

<%--	Scott Thomas
		11/22/2019
		Connected Borrower Page to Database,
		Insert, Update, Delete Added

		Moved files to LoggedIn Folder, thus limiting access to moderator pages through the LoggedIn folders web.config
--%>
<asp:Content runat="server" ContentPlaceHolderID="TablePlaceHolder">

	<div class="panel panel-primary">
		<div class="panel-heading">
			<h3 class="panel-title">Checkout</h3>
		</div>
		<div class="panel-body center-block">
			<label>All Disks Are Due 2 Weeks From Checkout.</label>
			<br />
			<label>Reserving Disks Ahead Of Time Is Not Allowed.</label>
			<br />

			<asp:DropDownList ID="ddlBorrowers" runat="server" DataSourceID="CheckOutDataSource" DataTextField="Borrower_Name" DataValueField="Borrower_ID">
			</asp:DropDownList>


			<asp:SqlDataSource ID="CheckOutDataSource" runat="server"
				ConnectionString="<%$ ConnectionStrings:disk_inventoryRTConnectionString %>"
				SelectCommand=
				"SELECT [Borrower_FName] + ' ' + [Borrower_LName] as Borrower_Name, [Borrower_ID]
				FROM [Borrower]
				ORDER BY Borrower_Name">
			</asp:SqlDataSource>

			<asp:SqlDataSource ID="CheckOutDataSource2" runat="server"
				ConnectionString="<%$ ConnectionStrings:disk_inventoryRTConnectionString %>"
				SelectCommand=
				"select Distinct Disk.Disk_ID, Disk.Name
				from Disk
				where
				Disk.Status_ID = 2
				order by Name">
			</asp:SqlDataSource>
			<asp:DropDownList ID="ddlDisks" runat="server" DataSourceID="CheckOutDataSource2" DataTextField="Name" DataValueField="Disk_ID">
			</asp:DropDownList>
			<br />
			<asp:Button Text="CheckOut Disk" OnClick="OnCheckout" runat="server" CssClass="btn btn-default" />
			<br />
			<asp:Label runat="server" ID="lblOutput" Visible="True"></asp:Label>
		</div>
	</div>
</asp:Content>
