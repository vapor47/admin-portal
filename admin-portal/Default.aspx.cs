using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace admin_portal
{
    public partial class _Default : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (Int16.Parse(Session["Usertype"].ToString()) == null)
                {
                    Response.Redirect("Login.aspx");
                }
            }
            catch (NullReferenceException ex)
            {
                Console.WriteLine(ex.StackTrace);
                Response.Redirect("Login.aspx");
            }
        }
    }
}