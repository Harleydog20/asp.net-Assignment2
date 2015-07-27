using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using Everpass.Models;
using System.Web.ModelBinding;

namespace Everpass
{
    public partial class addPassword : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //if the page isn't posted back, check the url for an id to see know add or edit
            if (!IsPostBack)
            {
                if (Request.QueryString.Keys.Count > 0)
                {
                    //we have a url parameter if the count is > 0 so populate the form
                    GetPassword();
                }
            }
        }

        protected void GetPassword()
        {
            try
            {
                //connect
                using (DefaultConnectionEF conn = new DefaultConnectionEF())
                {
                    //get id from url parameter and store in a variable
                    Int32 PasswordID = Convert.ToInt32(Request.QueryString["PasswordID"]);

                    var p = (from pas in conn.Passwords1
                             where pas.PasswordID == PasswordID
                             select pas).FirstOrDefault();

                    //populate the form
                    txtWebsiteName.Text = p.WebsiteName;
                    txtPassword.Text = p.UserPassword;
                    ddlSecurityLevel.SelectedValue = p.SecurityLevel.ToString();
                }
            }
            catch
            {
                Response.Redirect("/error.aspx");
            }

        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            try
            {
                //connect
                using (DefaultConnectionEF conn = new DefaultConnectionEF())
                {
                    //create a new password object
                    Passwords p = new Passwords();

                    //decide if updating or adding
                    if (Request.QueryString.Count > 0)
                    {
                        Int32 PasswordID = Convert.ToInt32(Request.QueryString["PasswordID"]);

                        p = (from pas in conn.Passwords1
                             where pas.PasswordID == PasswordID
                             select pas).FirstOrDefault();
                    }

                    //fill the properties of our object from the form inputs
                    p.WebsiteName = txtWebsiteName.Text;
                    p.UserPassword = txtPassword.Text;
                    p.SecurityLevel = Convert.ToInt32(ddlSecurityLevel.SelectedValue);
                    p.CreationDate = DateTime.Today;

                    if (Request.QueryString.Count == 0)
                    {
                        conn.Passwords1.Add(p);
                    }
                    conn.SaveChanges();

                    //redirect to updated departments page
                    Response.Redirect("/admin/home.aspx");
                }
            }
            catch
            {
                //Response.Redirect("/error.aspx");
                                
            }
        }
    }
}