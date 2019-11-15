<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="week2project.Default" MasterPageFile="~/Site1.Master" %>

<asp:Content runat="server" ContentPlaceHolderID="BodyPlaceholder">
	<div class="panel panel-primary">
		<div class="panel-heading">
			<h3 class="panel-title">Add New Disk</h3>
		</div>
		<div class="panel-body">



			<asp:ListView ID="ListView1" runat="server" DataKeyNames="Disk_ID" DataSourceID="SqlDataSource1"
				GroupItemCount="3" InsertItemPosition="LastItem">
				<EditItemTemplate>
					<td runat="server" style="">Disk_ID:
						<asp:Label ID="Disk_IDLabel1" runat="server" Text='<%# Eval("Disk_ID") %>' />
						<br />
						Name:
						<asp:TextBox ID="NameTextBox" runat="server" Text='<%# Bind("Name") %>' />
						<br />
						ReleaseDate:
						<asp:TextBox ID="ReleaseDateTextBox" runat="server" Text='<%# Bind("ReleaseDate") %>' />
						<br />
						Genre_ID:
						<asp:TextBox ID="Genre_IDTextBox" runat="server" Text='<%# Bind("Genre_ID") %>' />
						<br />
						Type_ID:
						<asp:TextBox ID="Type_IDTextBox" runat="server" Text='<%# Bind("Type_ID") %>' />
						<br />
						Status_ID:
						<asp:TextBox ID="Status_IDTextBox" runat="server" Text='<%# Bind("Status_ID") %>' />
						<br />
						<asp:Button ID="UpdateButton" runat="server" CommandName="Update" Text="Update" />
						<br />
						<asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Cancel" />
						<br />
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
					<td runat="server" style="">Name:
						<asp:TextBox ID="NameTextBox" runat="server" Text='<%# Bind("Name") %>' />
						<br />
						ReleaseDate:
						<asp:TextBox ID="ReleaseDateTextBox" runat="server" Text='<%# Bind("ReleaseDate") %>' />
						<br />
						Genre_ID:
						<asp:TextBox ID="Genre_IDTextBox" runat="server" Text='<%# Bind("Genre_ID") %>' />
						<br />
						Type_ID:
						<asp:TextBox ID="Type_IDTextBox" runat="server" Text='<%# Bind("Type_ID") %>' />
						<br />
						Status_ID:
						<asp:TextBox ID="Status_IDTextBox" runat="server" Text='<%# Bind("Status_ID") %>' />
						<br />
						<asp:Button ID="InsertButton" runat="server" CommandName="Insert" Text="Insert" />
						<br />
						<asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Clear" />
						<br />
					</td>
				</InsertItemTemplate>
				<ItemTemplate>
					<td runat="server" style="">
						<div class="panel panel-primary" style="margin: 20px">
							<div class="panel-heading">
								<h3 class="panel-title"></h3>
							</div>
							<div class="panel-body">
								<asp:Label ID="Disk_IDLabel" runat="server" Text='<%# Eval("Disk_ID") %>' />
								<br />

								<label>
									Name:
								</label>
								<asp:Label ID="NameLabel" runat="server" Text='<%# Eval("Name") %>' />
								<br />
								
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
				DeleteCommand="DELETE FROM [Disk] WHERE [Disk_ID] = @Disk_ID"
				InsertCommand="INSERT INTO [Disk] ([Name], [ReleaseDate], [Genre_ID], [Type_ID], [Status_ID]) VALUES (@Name, @ReleaseDate, @Genre_ID, @Type_ID, @Status_ID)"
				SelectCommand="SELECT [Disk_ID], [Name], [ReleaseDate], [Genre_ID], [Type_ID], [Status_ID] FROM [Disk] ORDER BY [Name]"
				UpdateCommand="UPDATE [Disk] SET [Name] = @Name, [ReleaseDate] = @ReleaseDate, [Genre_ID] = @Genre_ID, [Type_ID] = @Type_ID, [Status_ID] = @Status_ID WHERE [Disk_ID] = @Disk_ID">
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
