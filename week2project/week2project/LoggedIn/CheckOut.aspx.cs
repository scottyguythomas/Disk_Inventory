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
			BorrowedCalendar.SelectedDate = DateTime.Today;
			BorrowedCalendar.TodaysDate = DateTime.Today;
		}

		protected void OnCheckout(object sender, EventArgs e)
		{
			try
			{
				int disk = Convert.ToInt32(ddlDisks.SelectedValue);
				int borrower = Convert.ToInt32(ddlBorrowers.SelectedValue);
				var date = BorrowedCalendar.SelectedDate.ToShortDateString();
				var connection = new SqlConnection(CheckOutDataSource2.ConnectionString);
				var command = new SqlCommand("exec sp_CheckoutDisk @diskID, @borrowerID, @borrowedDate", connection);

				command.Parameters.Add("@diskID", SqlDbType.Int);
				command.Parameters["@diskID"].Value = disk;
				command.Parameters.Add("@borrowerID", SqlDbType.Int);
				command.Parameters["@borrowerID"].Value = borrower;
				command.Parameters.Add("@borrowedDate", SqlDbType.DateTime2);
				command.Parameters["@borrowedDate"].Value = date;

				connection.Open();
				command.ExecuteNonQuery();
				connection.Close();

				ddlBorrowers.DataBind();
				ddlDisks.DataBind();

				lblOutput.CssClass = "text-success";
				lblOutput.Text = "Disk Checked Out Successfully!";
				lblOutput.Visible = true;

			}
			catch (Exception)
			{
				lblOutput.CssClass = "text-danger";
				lblOutput.Text = $"An Error Has Occured During Checkout... ";
				lblOutput.Visible = true;
			}
		}

		protected void BorrowedCalendar_SelectionChanged(object sender, EventArgs e)
		{
			if(BorrowedCalendar.SelectedDate < DateTime.Today)
			{
				submitButton.Enabled = false;
				BorrowerLabel.Visible = true;
				BorrowerLabel.Text = "Date cannot be in the past";

			}
			else
			{
				submitButton.Enabled = true;
				BorrowerLabel.Visible = false;
			}
		}
	}
}