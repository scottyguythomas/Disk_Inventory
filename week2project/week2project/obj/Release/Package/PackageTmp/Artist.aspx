<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="week2project.Default" MasterPageFile="~/Site1.Master" %>
<%--	Scott Thomas
		11/15/2019
		Connected Artist Page to Database,
		Insert, Update, Delete Added
	--%>
<asp:Content runat="server" ContentPlaceHolderID="BodyPlaceholder">
	<div class="panel panel-primary">
		<div class="panel-heading">
			<h3 class="panel-title">Add New Artist</h3>
		</div>
		<div class="panel-body">
			<asp:ValidationSummary CssClass="center-block text-center text-danger" ValidationGroup="Edit" ID="ValidationSummary2" runat="server" DisplayMode="List" />
			<asp:ValidationSummary CssClass="center-block text-center text-danger" ValidationGroup="Insert" ID="ValidationSummary1" runat="server" DisplayMode="List" />
			<asp:ListView ID="ListView1" runat="server" DataKeyNames="Artist_ID" DataSourceID="SqlDataSource1" GroupItemCount="4" InsertItemPosition="LastItem" OnSelectedIndexChanged="ListView1_SelectedIndexChanged">
				<EditItemTemplate>
					<td runat="server" style="">
						<div class="panel panel-primary center-block text-center" style="margin: 20px">
							<div class="panel-heading">
								<h3 class="panel-title">
									<label>
										<asp:Label ID="Artist_FNameLabel" runat="server" Text='<%# Eval("Artist_FName") %>' />
										<asp:Label ID="Artist_LNameLabel" runat="server" Text='<%# Eval("Artist_LName") %>' />
										(<asp:Label ID="Artist_IDLabel" runat="server" Text='<%# Eval("Artist_ID") %>' />)
									</label>
								</h3>
							</div>
							<div class="panel-body">
								First Name:
								<br />
								<asp:TextBox ID="Artist_FNameTextBox" ValidationGroup="Edit" runat="server" Text='<%# Bind("Artist_FName") %>' />
								<br />
								Last Name:
								<br />
								<asp:TextBox ID="Artist_LNameTextBox" ValidationGroup="Edit" runat="server" Text='<%# Bind("Artist_LName") %>' />
								<br />
								Is Group:
								<br />
								<asp:TextBox ID="Artist_TypeTextBox" ValidationGroup="Edit" runat="server" Text='<%# Bind("Artist_Type") %>' />
								<br />
								<br />
								<asp:Button ID="UpdateButton" runat="server" ValidationGroup="Edit" CommandName="Update" Text="Update" />
								<asp:Button ID="CancelButton" runat="server" ValidationGroup="Edit" CommandName="Cancel" Text="Cancel" />
								<br />

								<asp:RequiredFieldValidator ID="RequiredFieldValidator1" ValidationGroup="Edit" runat="server" ErrorMessage="First Name Is A Required Field" Display="None" ControlToValidate="Artist_FNameTextBox"></asp:RequiredFieldValidator>


								<asp:RequiredFieldValidator ID="RequiredFieldValidator2" ValidationGroup="Edit" runat="server" ErrorMessage="Is Group Is A Required Field" ControlToValidate="Artist_TypeTextBox">

									<asp:RangeValidator ID="RangeValidator1" runat="server" ErrorMessage="Is Group Must Be Either O(Solo) or 1(Group)" ControlToValidate="Artist_TypeTextBox" MaximumValue="1" MinimumValue="0" ValidationGroup="Edit" Type="Integer"></asp:RangeValidator>

								</asp:RequiredFieldValidator>
							</div>
					</td>
				</EditItemTemplate>
				<EmptyDataTemplate>
					<table runat="server" style="">
						<tr>
							<td>No data was returned.</td>
						</tr>
					</table>
				</EmptyDataTemplate>
				<EmptyItemTemplate>
					<td runat="server" />
				</EmptyItemTemplate>
				<GroupTemplate>
					<tr id="itemPlaceholderContainer" runat="server">
						<td id="itemPlaceholder" runat="server"></td>
					</tr>
				</GroupTemplate>
				<InsertItemTemplate>
					<div class="panel panel-primary center-block text-center" style="margin: 20px">
						<div class="panel-heading">
							<h3 class="panel-title">
								<label>
									Insert A New Artist
								</label>
							</h3>
						</div>
						<div class="panel-body">

							<label>
								First Name:
							</label>
							<asp:TextBox ID="Artist_FNameTextBox" runat="server" ValidationGroup="Insert" Text='<%# Bind("Artist_FName") %>' />
							<br />
							<label>
								Last Name:
							</label>
							<asp:TextBox ID="Artist_LNameTextBox" runat="server" ValidationGroup="Insert" Text='<%# Bind("Artist_LName") %>' />
							<br />
							<label>
								Is Group:
							</label>
							<asp:TextBox ID="Artist_TypeTextBox" runat="server" ValidationGroup="Insert" Text='<%# Bind("Artist_Type") %>' />
							<br />
							<asp:Button ID="InsertButton" ValidationGroup="Insert" runat="server" CommandName="Insert" Text="Insert" />
							<asp:Button ID="CancelButton" ValidationGroup="Insert" runat="server" CommandName="Cancel" Text="Clear" CausesValidation="false" />
							<asp:RequiredFieldValidator ValidationGroup="Insert" ID="RequiredFieldValidator3" runat="server" ErrorMessage="First Name Is A Required Field" Display="None" ControlToValidate="Artist_FNameTextBox"></asp:RequiredFieldValidator>
							<asp:RequiredFieldValidator ID="RequiredFieldValidator4" ValidationGroup="Insert" ControlToValidate="Artist_TypeTextBox" runat="server" ErrorMessage="Is Group Is A Required Field">

								<asp:RangeValidator ID="RangeValidator2" runat="server" ValidationGroup="Insert" ControlToValidate="Artist_TypeTextBox" ErrorMessage="RangeValidator" Type="Integer" MaximumValue="1" MinimumValue="0" Display="None">

								</asp:RangeValidator>
							</asp:RequiredFieldValidator>
						</div>
				</InsertItemTemplate>
				<ItemTemplate>
					<td runat="server" style="">
						<div class="panel panel-primary center-block text-center" style="margin: 20px">
							<div class="panel-heading">
								<h3 class="panel-title">
									<label>
										<asp:Label ID="Artist_FNameLabel" runat="server" Text='<%# Eval("Artist_FName") %>' />
										<asp:Label ID="Artist_LNameLabel" runat="server" Text='<%# Eval("Artist_LName") %>' />
										(<asp:Label ID="Artist_IDLabel" runat="server" Text='<%# Eval("Artist_ID") %>' />)
									</label>
								</h3>
							</div>
							<div class="panel-body">
								Is Group:
						<asp:Label ID="Artist_TypeLabel" runat="server" Text='<%# Eval("Artist_Type") %>' />
								<br />
								<asp:Button ID="DeleteButton" runat="server" CommandName="Delete" Text="Delete" />
								<asp:Button ID="EditButton" runat="server" CommandName="Edit" Text="Edit" />
							</div>
					</td>
				</ItemTemplate>
				<LayoutTemplate>
					<table runat="server">
						<tr runat="server">
							<td runat="server">
								<table id="groupPlaceholderContainer" runat="server" border="0" style="">
									<tr id="groupPlaceholder" runat="server">
									</tr>
								</table>
							</td>
						</tr>
						<tr runat="server">
							<td runat="server" style="">
								<asp:DataPager ID="DataPager1" runat="server" PageSize="12">
									<Fields>
										<asp:NextPreviousPagerField ButtonType="Button" ShowFirstPageButton="True" ShowNextPageButton="False" ShowPreviousPageButton="False" />
										<asp:NumericPagerField />
										<asp:NextPreviousPagerField ButtonType="Button" ShowLastPageButton="True" ShowNextPageButton="False" ShowPreviousPageButton="False" />
									</Fields>
								</asp:DataPager>
							</td>
						</tr>
					</table>
				</LayoutTemplate>
			</asp:ListView>
			<asp:SqlDataSource ID="SqlDataSource1" runat="server"
				ConnectionString="<%$ ConnectionStrings:disk_inventoryRTConnectionString %>"
				DeleteCommand="execute sp_DeleteArtist @Artist_ID"
				InsertCommand="execute sp_InsArtist @Artist_FName, @Artist_Type, @Artist_LName"
				SelectCommand="SELECT [Artist_ID], [Artist_FName], [Artist_LName], [Artist_Type] FROM [Artist] ORDER BY [Artist_LName], [Artist_FName]"
				UpdateCommand="execute sp_UpdateArtist @Artist_ID, @Artist_FName, @Artist_Type, @Artist_LName">
				<DeleteParameters>
					<asp:Parameter Name="Artist_ID" Type="Int32" />
				</DeleteParameters>
				<InsertParameters>
					<asp:Parameter Name="Artist_FName" Type="String" />
					<asp:Parameter Name="Artist_LName" Type="String" />
					<asp:Parameter Name="Artist_Type" Type="Int32" />
				</InsertParameters>
				<UpdateParameters>
					<asp:Parameter Name="Artist_FName" Type="String" />
					<asp:Parameter Name="Artist_LName" Type="String" />
					<asp:Parameter Name="Artist_Type" Type="Int32" />
					<asp:Parameter Name="Artist_ID" Type="Int32" />
				</UpdateParameters>
			</asp:SqlDataSource>
		</div>
	</div>
</asp:Content>
