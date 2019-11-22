﻿<%@ Page Title="Log in" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="week2project.Account.Login" Async="true" %>

<%-- 
		Scott Thomas
		11/22/2019
		Modified layout to match current design
	
	--%>

<%@ Register Src="~/Account/OpenAuthProviders.ascx" TagPrefix="uc" TagName="OpenAuthProviders" %>

<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="BodyPlaceholder">
	<div class="panel panel-primary">
		<div class="panel-heading">
			<h3 class="panel-title"><%: Title %></h3>
		</div>
		<div class="panel-body">

			<div class="row">
				<div class="col-md-8">
					<section id="loginForm">
						<div class="form-horizontal">
							<h4>Use a local account to log in.</h4>
							<hr />
							<asp:PlaceHolder runat="server" ID="ErrorMessage" Visible="false">
								<p class="text-danger">
									<asp:Literal runat="server" ID="FailureText" />
								</p>
							</asp:PlaceHolder>
							<div class="form-group">
								<asp:Label runat="server" AssociatedControlID="Email" CssClass="col-md-2 control-label">Email</asp:Label>
								<div class="col-md-10">
									<asp:TextBox runat="server" ID="Email" CssClass="form-control" TextMode="Email" />
									<asp:RequiredFieldValidator runat="server" ControlToValidate="Email"
										CssClass="text-danger" ErrorMessage="The email field is required." />
								</div>
							</div>
							<div class="form-group">
								<asp:Label runat="server" AssociatedControlID="Password" CssClass="col-md-2 control-label">Password</asp:Label>
								<div class="col-md-10">
									<asp:TextBox runat="server" ID="Password" TextMode="Password" CssClass="form-control" />
									<asp:RequiredFieldValidator runat="server" ControlToValidate="Password" CssClass="text-danger" ErrorMessage="The password field is required." />
								</div>
							</div>
							<div class="form-group">
								<div class="col-md-offset-2 col-md-10">
									<div class="checkbox">
										<asp:CheckBox runat="server" ID="RememberMe" />
										<asp:Label runat="server" AssociatedControlID="RememberMe">Remember me?</asp:Label>
									</div>
								</div>
							</div>
							<div class="form-group">
								<div class="col-md-offset-2 col-md-10">
									<asp:Button runat="server" OnClick="LogIn" Text="Log in" CssClass="btn btn-default" />
								</div>
							</div>
						</div>
						<p>
							<asp:HyperLink runat="server" ID="RegisterHyperLink" ViewStateMode="Disabled">Register as a new user</asp:HyperLink>
						</p>
						<p>
							<%-- Enable this once you have account confirmation enabled for password reset functionality
                    <asp:HyperLink runat="server" ID="ForgotPasswordHyperLink" ViewStateMode="Disabled">Forgot your password?</asp:HyperLink>
							--%>
						</p>
					</section>
				</div>

				<%--<div class="col-md-4">
					<section id="socialLoginForm">
						<uc:OpenAuthProviders runat="server" ID="OpenAuthLogin" />
					</section>
				</div>--%>
			</div>
		</div>
	</div>

</asp:Content>
