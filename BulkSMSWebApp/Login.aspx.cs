using System;

namespace BulkSMSWebApp
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                lblMessage.Text = "";
            }
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            string empId = txtEmployeeId.Text.Trim();
            string password = txtPassword.Text.Trim();
            string enteredCaptcha = txtCaptcha.Text.Trim();
            string sessionCaptcha = Session["Captcha"]?.ToString();

            // Validate CAPTCHA
            if (string.IsNullOrWhiteSpace(sessionCaptcha) || !string.Equals(enteredCaptcha, sessionCaptcha, StringComparison.OrdinalIgnoreCase))
            {
                lblMessage.Text = "❌ Invalid CAPTCHA. Please try again.";
                return;
            }

            // Validate credentials (example static check)
            if (empId == "1234" && password == "abcd")
            {
                Session["EmpId"] = empId;
                Response.Redirect("Home.aspx", false);
                Context.ApplicationInstance.CompleteRequest(); // avoid ThreadAbortException
            }
            else
            {
                lblMessage.Text = "❌ Invalid Employee ID or Password.";
            }
        }
    }
}