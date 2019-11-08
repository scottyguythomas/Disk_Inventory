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
                ResponseLabel.Text = $"Added {FirstNameText.Text} {LastNameText.Text} To the database.";
                FirstNameText.Text = LastNameText.Text = PhoneNumberText.Text = "";
            }
        }
    }
}