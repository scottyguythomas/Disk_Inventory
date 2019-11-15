<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="week2project.Default" MasterPageFile="~/Site1.Master" %>
<%--	Scott Thomas
		11/15/2019
		Connected Disk Page to Database,
		Insert, Update, Delete Added
	--%>
<asp:Content runat="server" ContentPlaceHolderID="BodyPlaceholder">
	<div class="panel panel-primary">
		<div class="panel-heading">
			<h3 class="panel-title">Add New Disk</h3>
		</div>
		<div class="panel-body">

			<asp:ValidationSummary ValidationGroup="Edit" CssClass="center-block text-center text-danger" ID="ValidationSummary2" runat="server" DisplayMode="List" />
			<asp:ValidationSummary ValidationGroup="Insert" CssClass="center-block text-center text-danger" ID="ValidationSummary1" runat="server" DisplayMode="List" />

			<asp:ListView ID="ListView1" runat="server" DataKeyNames="Disk_ID" DataSourceID="SqlDataSource1"
				GroupItemCount="3" InsertItemPosition="LastItem">
				<EditItemTemplate>
					<td runat="server" style="">
						<div class="panel panel-primary" style="margin: 20px">
							<div class="panel-heading">
								<h3 class="panel-title">
									<asp:Label ID="NameLabel" runat="server" Text='<%# Eval("Name") %>' />
									(<asp:Label ID="Disk_IDLabel" runat="server" Text='<%# Eval("Disk_ID") %>' />)
								</h3>
							</div>
							<div class="panel-body" aria-live="off">
								<label>
									Name:
								</label>
								<br />

								<asp:TextBox ID="NameTextBox" ValidationGroup="Edit" runat="server" Text='<%# Bind("Name") %>' />

								<br />

								<label>
									Release Date:
								</label>
								<br />

								<asp:TextBox ID="ReleaseDateTextBox" ValidationGroup="Edit" runat="server" Text='<%# Bind("ReleaseDate") %>' />
								<br />
								<label>
									Genre:
								</label>
								<br />

								<asp:TextBox ID="Genre_IDTextBox" ValidationGroup="Edit" runat="server" Text='<%# Bind("Genre_ID") %>' />
								<br />
								<label>
									Type:
								</label>
								<br />

								<asp:TextBox ID="Type_IDTextBox" ValidationGroup="Edit" runat="server" Text='<%# Bind("Type_ID") %>' />
								<br />
								<label>
									Status:
								</label>
								<br />

								<asp:TextBox ID="Status_IDTextBox" ValidationGroup="Edit" runat="server" Text='<%# Bind("Status_ID") %>' />

								<br />
								<asp:Button ID="UpdateButton"  ValidationGroup="Edit" runat="server" CommandName="Update" Text="Update" />
								<asp:Button ID="CancelButton"  ValidationGroup="Edit" runat="server" CommandName="Cancel" Text="Cancel"  CausesValidation="false"/>
								<br />
								<asp:RequiredFieldValidator ID="RequiredFieldValidator1" ValidationGroup="Edit" Display="None" ControlToValidate="NameTextBox" runat="server" ErrorMessage="Name Is A Required Field"></asp:RequiredFieldValidator>

								<asp:RequiredFieldValidator ID="RequiredFieldValidator2" ValidationGroup="Edit" Display="None" ControlToValidate="ReleaseDateTextBox" runat="server" ErrorMessage="Release Date Is A Required Field">
								</asp:RequiredFieldValidator>
								<asp:RangeValidator ID="RangeValidator4" runat="server" ValidationGroup="Edit" Display="None" ControlToValidate="ReleaseDateTextBox" ErrorMessage="Date must be in MM/DD/YYYY Format" Type="Date" MaximumValue="12/31/9999" MinimumValue="01/01/0001">
								</asp:RangeValidator>

								<asp:RequiredFieldValidator ID="RequiredFieldValidator3" ValidationGroup="Edit" Display="None" ControlToValidate="Genre_IDTextBox" runat="server" ErrorMessage="Genre Is A Required Field">
								</asp:RequiredFieldValidator>
								<asp:RangeValidator ID="RangeValidator1" runat="server" ErrorMessage="Genre must be between 1 and 3" ValidationGroup="Edit" Display="None" ControlToValidate="Genre_IDTextBox" Type="Integer" MinimumValue="1" MaximumValue="3">

								</asp:RangeValidator>

								<asp:RequiredFieldValidator ID="RequiredFieldValidator4" ValidationGroup="Edit" Display="None" ControlToValidate="Type_IDTextBox" runat="server" ErrorMessage="Type Is A Required Field">
								</asp:RequiredFieldValidator>
								<asp:RangeValidator ID="RangeValidator2" runat="server" ErrorMessage="Genre must be Between 1 and 2" ValidationGroup="Edit" Display="None" ControlToValidate="Type_IDTextBox" Type="Integer" MinimumValue="1" MaximumValue="2">

								</asp:RangeValidator>
								<asp:RequiredFieldValidator ID="RequiredFieldValidator5" ValidationGroup="Edit" Display="None" ControlToValidate="Status_IDTextBox" runat="server" ErrorMessage="Status Is A Required Field">
								</asp:RequiredFieldValidator>
								<asp:RangeValidator ID="RangeValidator3" runat="server" ErrorMessage="Status must be Between 1 and 2" ValidationGroup="Edit" Display="None" ControlToValidate="Status_IDTextBox" Type="Integer" MinimumValue="1" MaximumValue="2">

								</asp:RangeValidator>
							</div>

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
							<h3 class="panel-title">Add New Disk
							</h3>
						</div>
						<div class="panel-body">
							<label>
								Name:
							</label>
							<asp:TextBox ID="NameTextBox" ValidationGroup="Insert" runat="server" Text='<%# Bind("Name") %>' />
							<br />
							<label>
								Release Date:
							</label>
							<asp:TextBox ID="ReleaseDateTextBox" ValidationGroup="Insert" runat="server" Text='<%# Bind("ReleaseDate") %>' />
							<br />
							<label>
								Genre:
							</label>
							<asp:TextBox ID="Genre_IDTextBox" ValidationGroup="Insert" runat="server" Text='<%# Bind("Genre_ID") %>' />
							<br />
							<label>
								Type:
							</label>
							<asp:TextBox ID="Type_IDTextBox" ValidationGroup="Insert" runat="server" Text='<%# Bind("Type_ID") %>' />
							<br />
							<label>
								Status:
							</label>
							<asp:TextBox ID="Status_IDTextBox" ValidationGroup="Insert" runat="server" Text='<%# Bind("Status_ID") %>' />
							<br />
							<asp:Button ID="InsertButton" ValidationGroup="Insert" runat="server" CommandName="Insert" Text="Insert" />
							<asp:Button ID="CancelButton" ValidationGroup="Insert" runat="server" CommandName="Cancel" Text="Clear" CausesValidation="false" />
							<asp:RequiredFieldValidator ID="RequiredFieldValidator1" ValidationGroup="Insert" Display="None" ControlToValidate="NameTextBox" runat="server" ErrorMessage="Name Is A Required Field"></asp:RequiredFieldValidator>

								<asp:RequiredFieldValidator ID="RequiredFieldValidator2" ValidationGroup="Insert" Display="None" ControlToValidate="ReleaseDateTextBox" runat="server" ErrorMessage="Release Date Is A Required Field">
								</asp:RequiredFieldValidator>
								<asp:RangeValidator ID="RangeValidator4" runat="server" ValidationGroup="Insert" Display="None" ControlToValidate="ReleaseDateTextBox" ErrorMessage="Date must be in MM/DD/YYYY Format" Type="Date" MaximumValue="12/31/9999" MinimumValue="01/01/0001">
								</asp:RangeValidator>

								<asp:RequiredFieldValidator ID="RequiredFieldValidator3" ValidationGroup="Insert" Display="None" ControlToValidate="Genre_IDTextBox" runat="server" ErrorMessage="Genre Is A Required Field">
								</asp:RequiredFieldValidator>
								<asp:RangeValidator ID="RangeValidator1" runat="server" ErrorMessage="Genre must be between 1 and 3" ValidationGroup="Insert" Display="None" ControlToValidate="Genre_IDTextBox" Type="Integer" MinimumValue="1" MaximumValue="3">

								</asp:RangeValidator>

								<asp:RequiredFieldValidator ID="RequiredFieldValidator4" ValidationGroup="Insert" Display="None" ControlToValidate="Type_IDTextBox" runat="server" ErrorMessage="Type Is A Required Field">
								</asp:RequiredFieldValidator>
								<asp:RangeValidator ID="RangeValidator2" runat="server" ErrorMessage="Genre must be Between 1 and 2" ValidationGroup="Insert" Display="None" ControlToValidate="Type_IDTextBox" Type="Integer" MinimumValue="1" MaximumValue="2">

								</asp:RangeValidator>
								<asp:RequiredFieldValidator ID="RequiredFieldValidator5" ValidationGroup="Insert" Display="None" ControlToValidate="Status_IDTextBox" runat="server" ErrorMessage="Status Is A Required Field">
								</asp:RequiredFieldValidator>
								<asp:RangeValidator ID="RangeValidator3" runat="server" ErrorMessage="Status must be Between 1 and 2" ValidationGroup="Insert" Display="None" ControlToValidate="Status_IDTextBox" Type="Integer" MinimumValue="1" MaximumValue="2">

								</asp:RangeValidator>
						</div>
				</InsertItemTemplate>
				<ItemTemplate>
					<td runat="server" style="">
						<div class="panel panel-primary" style="margin: 20px">
							<div class="panel-heading">
								<h3 class="panel-title">
									<asp:Label ID="NameLabel" runat="server" Text='<%# Eval("Name") %>' />
									(<asp:Label ID="Disk_IDLabel" runat="server" Text='<%# Eval("Disk_ID") %>' />)
								</h3>
							</div>
							<div class="panel-body">

								<label>
									Release Date:
								</label>

								<asp:Label ID="ReleaseDateLabel" runat="server" Text='<%# Eval("ReleaseDate") %>' />
								<label>
									Genre:
								</label>

								<asp:Label ID="Genre_IDLabel" runat="server" Text='<%# Eval("Genre_ID") %>' />
								<label>
									Type:
								</label>

								<asp:Label ID="Type_IDLabel" runat="server" Text='<%# Eval("Type_ID") %>' />
								<label>
									Status:
								</label>
								<asp:Label ID="Status_IDLabel" runat="server" Text='<%# Eval("Status_ID") %>' />
								<br />
								<asp:Button ID="DeleteButton" runat="server" CommandName="Delete" Text="Delete" />
								<asp:Button ID="EditButton" runat="server" CommandName="Edit" Text="Edit" />
							</div>

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
										<asp:NextPreviousPagerField ButtonType="Button" ShowFirstPageButton="True"
											ShowNextPageButton="False" ShowPreviousPageButton="False" />
										<asp:NumericPagerField />
										<asp:NextPreviousPagerField ButtonType="Button" ShowLastPageButton="True"
											ShowNextPageButton="False" ShowPreviousPageButton="False" />
									</Fields>
								</asp:DataPager>
							</td>
						</tr>
					</table>
				</LayoutTemplate>
			</asp:ListView>



			<asp:SqlDataSource ID="SqlDataSource1" runat="server"
				ConnectionString="<%$ ConnectionStrings:disk_inventoryRTConnectionString %>"
				DeleteCommand="execute sp_DeleteDisk @Disk_ID"
				InsertCommand="execute sp_InsDisk @Name, @ReleaseDate, @Type_ID, @Genre_ID, @Status_ID"
				SelectCommand="SELECT [Disk_ID], [Name], [ReleaseDate], [Genre_ID], [Type_ID], [Status_ID] FROM [Disk] ORDER BY [Name]"
				UpdateCommand="execute sp_UpdateDisk @Disk_ID, @Name, @ReleaseDate, @Type_ID, @Genre_ID, @Status_ID">
				<DeleteParameters>
					<asp:Parameter Name="Disk_ID" Type="Int32" />
				</DeleteParameters>
				<InsertParameters>
					<asp:Parameter Name="Name" Type="String" />
					<asp:Parameter DbType="DateTime2" Name="ReleaseDate" />
					<asp:Parameter Name="Genre_ID" Type="Int32" />
					<asp:Parameter Name="Type_ID" Type="Int32" />
					<asp:Parameter Name="Status_ID" Type="Int32" />
				</InsertParameters>
				<UpdateParameters>
					<asp:Parameter Name="Name" Type="String" />
					<asp:Parameter DbType="DateTime2" Name="ReleaseDate" />
					<asp:Parameter Name="Genre_ID" Type="Int32" />
					<asp:Parameter Name="Type_ID" Type="Int32" />
					<asp:Parameter Name="Status_ID" Type="Int32" />
					<asp:Parameter Name="Disk_ID" Type="Int32" />
				</UpdateParameters>
			</asp:SqlDataSource>



		</div>
	</div>
</asp:Content>
