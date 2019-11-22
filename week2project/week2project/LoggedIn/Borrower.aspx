<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Borrower.aspx.cs" MasterPageFile="~/Site.Master" Inherits="week2project.Borrower" %>
<%--	Scott Thomas
		11/22/2019
		Connected Borrower Page to Database,
		Insert, Update, Delete Added

		Moved files to LoggedIn Folder, thus limiting access to moderator pages through the LoggedIn folders web.config
	--%>
<asp:Content runat="server" ContentPlaceHolderID="TablePlaceHolder">
	<div class="panel panel-primary">
		<div class="panel-heading">
			<h3 class="panel-title">Borrower List</h3>
		</div>
		<div class="panel-body center-block">
			<asp:ValidationSummary runat="server" ValidationGroup="Edit"
				CssClass="center-block text-capitalize text-danger text-center" DisplayMode="List" />
			<asp:ValidationSummary runat="server" ValidationGroup="Insert"
				CssClass="center-block text-capitalize text-danger text-center" DisplayMode="List" />
			<asp:ListView ID="ListView1" runat="server" DataSourceID="BorrowerDataSource" DataKeyNames="Borrower_ID"
				GroupItemCount="4" InsertItemPosition="LastItem">
				<EditItemTemplate>
					<td runat="server" style="">
						<div class="panel panel-primary">
							<div class="panel-heading">
								<h3 class="panel-title">
									<asp:Label ID="Borrower_FNameLabel" runat="server"
										Text='<%# Eval("Borrower_FName") %>' />
									<asp:Label ID="Borrower_LNameLabel" runat="server"
										Text='<%# Eval("Borrower_LName") %>' />
									(
									<asp:Label ID="Borrower_IDLabel1" runat="server"
										Text='<%# Eval("Borrower_ID") %>' />)
								</h3>
							</div>
							<div class="panel-body">
								<label>
									Phone Number:
								</label>

								<asp:TextBox ID="Borrower_NumberTextBox" runat="server"
									Text='<%# Bind("Borrower_Number") %>' />
								<br />
								<label>
									First Name:
								</label>

								<asp:TextBox ID="Borrower_FNameTextBox" runat="server"
									Text='<%# Bind("Borrower_FName") %>' />
								<br />
								<label>
									Last Name:
								</label>

								<asp:TextBox ID="Borrower_LNameTextBox" runat="server"
									Text='<%# Bind("Borrower_LName") %>' />
								<br />
							</div>

							<asp:Button ID="UpdateButton" ValidationGroup="Edit" runat="server" CommandName="Update"
								Text="Update" />
							<asp:Button ID="CancelButton" CausesValidation="false" runat="server" CommandName="Cancel"
								Text="Cancel" />

							<asp:RequiredFieldValidator ValidationGroup="Edit" ID="RequiredFieldValidator3"
								CssClass="text-danger" runat="server" ErrorMessage="Phone Number Is Required Field"
								Display="None" ControlToValidate="Borrower_NumberTextBox"></asp:RequiredFieldValidator>
							<asp:RequiredFieldValidator ValidationGroup="Edit" ID="RequiredFieldValidator2"
								CssClass="text-danger" runat="server" ErrorMessage="First Name Is Required Field"
								Display="None" ControlToValidate="Borrower_FNameTextBox"></asp:RequiredFieldValidator>
							<asp:RequiredFieldValidator ValidationGroup="Edit" ID="RequiredFieldValidator1"
								CssClass="text-danger" runat="server" ErrorMessage="Last Name Is Required Field"
								Display="None" ControlToValidate="Borrower_LNameTextBox"></asp:RequiredFieldValidator>
							<asp:RegularExpressionValidator ID="RegularExpressionValidator2" CssClass="text-danger"
								ValidationExpression="^\s*(?:\+?(\d{1,3}))?[-. (]*(\d{3})[-. )]*(\d{3})[-. ]*(\d{4})(?: *x(\d+))?\s*$"
								ValidationGroup="Edit" runat="server" ErrorMessage="Please Enter A Valid Phone Number"
								ControlToValidate="Borrower_NumberTextBox" Display="None">
							</asp:RegularExpressionValidator>
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
								<label>Add New Borrower</label>
							</h3>
						</div>
						<div class="panel-body">
							<label>
								Phone Number:
							</label>
							<asp:TextBox ID="Borrower_NumberTextBox" runat="server"
								Text='<%# Bind("Borrower_Number") %>' ValidationGroup="Insert" />
							<br />
							<label>
								First Name:
							</label>
							<asp:TextBox ID="Borrower_FNameTextBox" runat="server" Text='<%# Bind("Borrower_FName") %>'
								ValidationGroup="Insert" />
							<br />
							<label>
								Last Name:
							</label>
							<asp:TextBox ID="Borrower_LNameTextBox" runat="server" Text='<%# Bind("Borrower_LName") %>'
								ValidationGroup="Insert" />

							<asp:RequiredFieldValidator ID="RequiredFieldValidator5"
								ControlToValidate="Borrower_FNameTextBox" runat="server"
								ErrorMessage="First Name Is Required Field" Display="None" ValidationGroup="Insert">
							</asp:RequiredFieldValidator>
							<asp:RequiredFieldValidator ID="RequiredFieldValidator6"
								ControlToValidate="Borrower_LNameTextBox" runat="server"
								ErrorMessage="Last Name Is Required Field" Display="None" ValidationGroup="Insert">
							</asp:RequiredFieldValidator>
							<asp:RequiredFieldValidator ID="RequiredFieldValidator4"
								ControlToValidate="Borrower_NumberTextBox" runat="server"
								ErrorMessage="Phone Number Is Required Field" Display="None" ValidationGroup="Insert">
							</asp:RequiredFieldValidator>
							<asp:RegularExpressionValidator ID="RegularExpressionValidator1" CssClass="text-danger"
								ControlToValidate="Borrower_NumberTextBox" runat="server"
								ErrorMessage="Please Enter A Valid Phone Number"
								ValidationExpression="^\s*(?:\+?(\d{1,3}))?[-. (]*(\d{3})[-. )]*(\d{3})[-. ]*(\d{4})(?: *x(\d+))?\s*$"
								Display="None" ValidationGroup="Insert"></asp:RegularExpressionValidator>
						</div>

						<asp:Button ID="InsertButton" ValidationGroup="Insert" runat="server" CommandName="Insert"
							Text="Insert" />
						<asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Clear"
							CausesValidation="False" />
					</div>






				</InsertItemTemplate>

				<ItemTemplate>
					<td runat="server" style="">
						<div class="panel panel-primary" style="margin: 20px">
							<div class="panel-heading">
								<h3 class="panel-title">
									<asp:Label ID="Borrower_FNameLabel" runat="server"
										Text='<%# Eval("Borrower_FName") %>' />
									<asp:Label ID="Borrower_LNameLabel" runat="server"
										Text='<%# Eval("Borrower_LName") %>' />
									(
									<asp:Label ID="Borrower_IDLabel" runat="server" Text='<%# Eval("Borrower_ID") %>' />
									)
								</h3>
							</div>
							<div class="panel-body">
								<label>
									Phone Number:
								</label>
								<br />
								<asp:Label ID="Borrower_NumberLabel" runat="server"
									Text='<%# Eval("Borrower_Number") %>' />
							</div>

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
								<asp:DataPager ID="DataPager1" runat="server" PageSize="16">
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
				<SelectedItemTemplate>
					<td runat="server" style="">Borrower_Number:
						<asp:Label ID="Borrower_NumberLabel" runat="server" Text='<%# Eval("Borrower_Number") %>' />
						<br />
						Borrower_LName:
						<asp:Label ID="Borrower_LNameLabel" runat="server" Text='<%# Eval("Borrower_LName") %>' />
						<br />
						Borrower_ID:
						<asp:Label ID="Borrower_IDLabel" runat="server" Text='<%# Eval("Borrower_ID") %>' />
						<br />
						Borrower_FName:
						<asp:Label ID="Borrower_FNameLabel" runat="server" Text='<%# Eval("Borrower_FName") %>' />
						<br />
						<asp:Button ID="DeleteButton" runat="server" CommandName="Delete" Text="Delete" />
						<br />
						<asp:Button ID="EditButton" runat="server" CommandName="Edit" Text="Edit" />
						<br />
					</td>
				</SelectedItemTemplate>

			</asp:ListView>




			<asp:SqlDataSource ID="BorrowerDataSource" runat="server"
				ConnectionString="<%$ ConnectionStrings:disk_inventoryRTConnectionString %>"
				DeleteCommand="execute sp_DeleteBorrower @Borrower_ID"
				InsertCommand="execute sp_InsBorrower @Borrower_FName,  @Borrower_LName, @Borrower_Number"
				SelectCommand="SELECT [Borrower_Number], [Borrower_LName], [Borrower_ID], [Borrower_FName] FROM [Borrower] ORDER BY [Borrower_LName], [Borrower_FName]"
				UpdateCommand="execute sp_UpdateBorrower @Borrower_ID, @Borrower_FName, @Borrower_Number, @Borrower_LName">
				<DeleteParameters>
					<asp:Parameter Name="Borrower_ID" Type="Int32" />
				</DeleteParameters>
				<InsertParameters>
					<asp:Parameter Name="Borrower_Number" Type="String" />
					<asp:Parameter Name="Borrower_LName" Type="String" />
					<asp:Parameter Name="Borrower_FName" Type="String" />
				</InsertParameters>
				<UpdateParameters>
					<asp:Parameter Name="Borrower_Number" Type="String" />
					<asp:Parameter Name="Borrower_LName" Type="String" />
					<asp:Parameter Name="Borrower_FName" Type="String" />
					<asp:Parameter Name="Borrower_ID" Type="Int32" />
				</UpdateParameters>
			</asp:SqlDataSource>
		</div>
	</div>
</asp:Content>

<asp:Content runat="server" ContentPlaceHolderID="BodyPlaceholder" ID="InsertBorrowerContent">
	<%--	<div class="panel panel-primary">
		<div class="panel-heading">
			<asp:Label runat="server" ID="lblInsertBorrower" CssClass="panel-title" Text="Add New Borrower"></asp:Label>
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
	</div>--%>
</asp:Content>