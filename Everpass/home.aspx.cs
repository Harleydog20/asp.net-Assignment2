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
    public partial class home : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //fill the grid
            if (!IsPostBack)
            {
                GetPasswords();
            }
        }
        protected void GetPasswords()
        {
            try
            {
                //connect using our connection string from web.config and EF context class
                using (DefaultConnection conn = new DefaultConnection())
                {
                    //use link to query the Departments model
                    var pass = from p in conn.Passwords1
                               select p;

                    //bind the query result to the gridview
                    grdPasswords.DataSource = pass.ToList();
                    grdPasswords.DataBind();
                }
            }
            catch
            {
                Response.Redirect("/error.aspx");
            }
        }

        protected void grdPasswords_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            try
            {
                //connect
                using (DefaultConnection conn = new DefaultConnection())
                {
                    //get the selected DepartmentID
                    Int32 PasswordID = Convert.ToInt32(grdPasswords.DataKeys[e.RowIndex].Values["PasswordID"]);

                    var p = (from pas in conn.Passwords1
                             where pas.PasswordID == PasswordID
                             select pas).FirstOrDefault();

                    //process the delete
                    conn.Passwords1.Remove(p);
                    conn.SaveChanges();

                    //update the grid
                    GetPasswords();
                }
            }
            catch
            {
                Response.Redirect("/error.aspx");
            }
        }
    }
}