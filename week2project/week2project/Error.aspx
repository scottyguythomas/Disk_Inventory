<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Error.aspx.cs" Inherits="week2project.Error" MasterPageFile="~/Site.Master" %>
<%--	Scott Thomas
		11/15/2019
		
	--%>
<asp:Content runat="server" ContentPlaceHolderID="BodyPlaceholder">
   
    <div class="panel panel-primary">
        <div class="panel-heading">
            <h3 class="panel-title">Whoops something went wrong</h3>
        </div>
        <div class="panel-body">

    <img src="Images/old-school.png" class="center-block" width="75%" />
           <asp:Button CssClass="btn btn-primary center-block" runat="server" Text="Click Me To Go Back Home" PostBackUrl="~/Default.aspx" />
        </div>
    </div>
</asp:Content>
