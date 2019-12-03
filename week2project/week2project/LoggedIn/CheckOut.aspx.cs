using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace week2project.LoggedIn
{
	public partial class CheckOut : System.Web.UI.Page
	{
		protected void Page_Load(object sender, EventArgs e)
		{

		}

		protected void OnCheckout(object sender, EventArgs e)
		{
			try
			{
				int disk = Convert.ToInt32(ddlDisks.SelectedValue);
				int borrower = Convert.ToInt32(ddlBorrowers.SelectedValue);
				var connection = new SqlConnection(CheckOutDataSource2.ConnectionString);
				var command = new SqlCommand("exec sp_CheckoutDisk @diskID, @borrowerID", connection);

				command.Parameters.Add("@diskID", SqlDbType.Int);
				command.Parameters["@diskID"].Value = disk;
				command.Parameters.Add("@borrowerID", SqlDbType.Int);
				command.Parameters["@borrowerID"].Value = borrower;

				connection.Open();
				command.ExecuteNonQuery();
				connection.Close();

				lblOutput.CssClass = "txt-success";
				lblOutput.Text = "Disk Checked Out Successfully!";

			}
			catch (Exception)
			{
				lblOutput.CssClass = "txt-danger";
				lblOutput.Text = "An Error Has Occured During Checkout... Please Try Again Later.";
			}
		}
	}
}