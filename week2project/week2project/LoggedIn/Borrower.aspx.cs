using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace week2project
{
	public partial class Borrower : System.Web.UI.Page
	{
		protected void Page_Load(object sender, EventArgs e)
		{

		}

        protected void SubmitButton_Click(object sender, EventArgs e)
        {
            if(Page.IsValid)
            {
                //ResponseLabel.Text = $"Added {FirstNameText.Text} {LastNameText.Text} To the database.";
                //FirstNameText.Text = LastNameText.Text = PhoneNumberText.Text = "";
            }
        }

		protected void OnEditButtonClicked(object sender, EventArgs e)
		{
			//lblInsertBorrower.Text = "Please cancel current edit box to add new user";
			//SubmitButton.Visible = FirstNameText.Visible = LastNameText.Visible = PhoneNumberText.Visible = false;
			//SubmitButton.Enabled = revPhone.Enabled = RequiredFieldValidator2.Enabled = RequiredFieldValidator3.Enabled = false;
		}

		protected void CancelButton_Click(object sender, EventArgs e)
		{
			//lblInsertBorrower.Text = "Add New Borrower";
			//SubmitButton.Visible = FirstNameText.Visible = LastNameText.Visible = PhoneNumberText.Visible = true;
			//SubmitButton.Enabled = revPhone.Enabled = RequiredFieldValidator2.Enabled = RequiredFieldValidator3.Enabled = true;
		}
	}
}