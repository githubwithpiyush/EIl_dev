using System.Web.UI.WebControls;
using System;



namespace BulkSMSWebApp
{
    public partial class Home : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // Ensure user is authenticated
            if (Session["EmpId"] == null)
            {
                Response.Redirect("Login.aspx");
                return;
            }

            if (!IsPostBack)
            {
                // Welcome message
                lblWelcome.Text = "Welcome Employee ID: " + Session["EmpId"].ToString();
                lblWelcome.ForeColor = System.Drawing.Color.Green;

                // Initial data bindings
                BindDirectorate();
                BindDivision();
                BindDepartment();
                BindTemplates();
                BindLevelDropdown();
                BindLocationDropdown();

                LoadMessageForEdit(); // If editing an existing message
            }
        }

        private void BindDirectorate()
        {
            ddlDirectorate.Items.Clear();
            ddlDirectorate.Items.Add(new ListItem("-- Select Directorate --", ""));
            ddlDirectorate.Items.Add(new ListItem("HR", "HR"));
            ddlDirectorate.Items.Add(new ListItem("Tech", "Tech"));
            ddlDirectorate.Items.Add(new ListItem("Commercial", "Commercial"));
            ddlDirectorate.Items.Add(new ListItem("Financial", "Financial"));
        }

        private void BindDivision()
        {
            ddlDivision.Items.Clear();
            ddlDivision.Items.Add(new ListItem("-- Select Division --", ""));
            ddlDivision.Items.Add(new ListItem("ATS", "ATS"));
            ddlDivision.Items.Add(new ListItem("ITS", "ITS"));
            //ddlDivision.Items.Add(new ListItem("C", "C"));
        }

        private void BindDepartment()
        {
            ddlDepartment.Items.Clear();
            ddlDepartment.Items.Add(new ListItem("-- Select Department --", ""));
            ddlDepartment.Items.Add(new ListItem("Admin", "Admin"));
            ddlDepartment.Items.Add(new ListItem("User", "User"));
            ddlDepartment.Items.Add(new ListItem("Manager", "Manager"));
            ddlDepartment.Items.Add(new ListItem("HR", "HR"));
        }

        private void BindTemplates()
        {
            ddlTemplates.Items.Clear();
            ddlTemplates.Items.Add(new ListItem("-- Select Template --", ""));
            ddlTemplates.Items.Add(new ListItem("Fumigation Intimation", "Fumigation Intimation abcd"));
            ddlTemplates.Items.Add(new ListItem("Shutdown Intimation", "Shutdown Intimation abcd"));
            ddlTemplates.Items.Add(new ListItem("Don't forget your task", "Don't forget your task"));
        }
        private void BindLevelDropdown()
        {
            ddlLevel.Items.Clear();
            ddlLevel.Items.Add(new ListItem("-- Select Level --", ""));
            ddlLevel.Items.Add(new ListItem("Level 1", "Level 1"));
            ddlLevel.Items.Add(new ListItem("Level 2", "Level 2"));
            ddlLevel.Items.Add(new ListItem("Level 3", "Level 3"));
        }

        private void BindLocationDropdown()
        {
            ddlLocation.Items.Clear();
            ddlLocation.Items.Add(new ListItem("-- Select Location --", ""));
            ddlLocation.Items.Add(new ListItem("E.I.L. Bhawan Delhi", "E.I.L. Bhawan Delhi"));
            ddlLocation.Items.Add(new ListItem("Location B", "Location B"));
            ddlLocation.Items.Add(new ListItem("Location C", "Location C"));
        }


        protected void ddlDirectorate_SelectedIndexChanged(object sender, EventArgs e)
        {
            lblWelcome.Text = $"Directorate selected: {ddlDirectorate.SelectedValue}";
            lblWelcome.ForeColor = System.Drawing.Color.Blue;
        }

        protected void ddlDivision_SelectedIndexChanged(object sender, EventArgs e)
        {
            lblWelcome.Text = $"Division selected: {ddlDivision.SelectedValue}";
            lblWelcome.ForeColor = System.Drawing.Color.Blue;
        }

        protected void ddlDepartment_SelectedIndexChanged(object sender, EventArgs e)
        {
            lblWelcome.Text = $"Department selected: {ddlDepartment.SelectedValue}";
            lblWelcome.ForeColor = System.Drawing.Color.Blue;
        }

        protected void ddlTemplates_SelectedIndexChanged(object sender, EventArgs e)
        {
            txtMessage.Text = ddlTemplates.SelectedValue;
        }
        protected void ddlLevel_SelectedIndexChanged(object sender, EventArgs e)
        {
            // Handle Level selection change
            string selectedLevel = ddlLevel.SelectedValue;
            // You can add your logic here, e.g., filter Location based on Level or update UI
        }

        protected void ddlLocation_SelectedIndexChanged(object sender, EventArgs e)
        {
            // Handle Location selection change
            string selectedLocation = ddlLocation.SelectedValue;
            // Add your logic here, for example, update other controls or validate input
        }

        private void LoadMessageForEdit()
        {
            string messageId = Request.QueryString["id"];

            if (!string.IsNullOrEmpty(messageId))
            {
                hdnMessageId.Value = messageId;

                // Example/mock data for edit mode
                ddlDirectorate.SelectedValue = "B";
                ddlDivision.SelectedValue = "A";
                ddlDepartment.SelectedValue = "Manager";
                ddlTemplates.SelectedValue = "Meeting at 3 PM";

                txtFromDate.Text = DateTime.Today.ToString("yyyy-MM-dd");
                txtToDate.Text = DateTime.Today.AddDays(1).ToString("yyyy-MM-dd");
                txtFromTime.Text = "09:00";
                txtToTime.Text = "18:00";

                //txtShortDescription.Text = "Updated meeting reminder";
                txtMessage.Text = "This is an updated message for the scheduled meeting.";
            }
        }

        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            string fromDate = txtFromDate.Text;
            string toDate = txtToDate.Text;
            string fromTime = txtFromTime.Text;
            string toTime = txtToTime.Text;
            // string shortDescription = txtShortDescription.Text.Trim();
            string message = txtMessage.Text.Trim();
            string messageId = hdnMessageId.Value;

            if (string.IsNullOrWhiteSpace(message))
            {
                lblWelcome.Text = "⚠️ Please enter a message.";
                lblWelcome.ForeColor = System.Drawing.Color.Red;
                return;
            }

            if (string.IsNullOrEmpty(fromDate) || string.IsNullOrEmpty(toDate) ||
                string.IsNullOrEmpty(fromTime) || string.IsNullOrEmpty(toTime))
            {
                lblWelcome.Text = "⚠️ Please select all date and time values.";
                lblWelcome.ForeColor = System.Drawing.Color.Red;
                return;
            }

            // Simulated update success
            lblWelcome.ForeColor = System.Drawing.Color.DarkGreen;
            lblWelcome.Text = $"✅ Message (ID: {messageId}) updated successfully from <b>{fromDate} {fromTime}</b> to <b>{toDate} {toTime}</b><br/>" +
                              $"<b>Message:</b> {message}";
        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            Response.Redirect("Home.aspx"); // Refresh page
        }

        protected void btnLogout_Click(object sender, EventArgs e)
        {
            Session.Clear(); // Remove session values
            Session.Abandon(); // Optional: destroy session object
            Response.Redirect("Login.aspx");
        }
    }
}